import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flexi/features/shop/models/product_model.dart';
import 'package:flexi/utils/constants/enums.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../services/cloud_storage/firebase_storage_service.dart';

class ProductRepo extends GetxController {
  static ProductRepo get instance => Get.find();

  // Variables
  final _db = FirebaseFirestore.instance;

// Get 4 Featured Products
  Future<List<ProductModel>> getfeaturedProducts() async {
    try {
      final querySnapshot = await _db
          .collection('Products')
          .where('IsFeatured', isEqualTo: true)
          .limit(4)
          .get();

      final List<ProductModel> list = querySnapshot.docs
          .map((documentSnapshot) =>
              ProductModel.instanceFromQuerySnapshot(documentSnapshot))
          .toList();

      return list;
    } on FirebaseAuthException catch (e) {
      throw e.code;
    } on FirebaseException catch (e) {
      throw e.code;
    } on FormatException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.code;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // Get All featured products
  Future<List<ProductModel>> getAllfeaturedProducts() async {
    try {
      final querySnapshot = await _db
          .collection('Products')
          .where('IsFeatured', isEqualTo: true)
          .get();

      final List<ProductModel> list = querySnapshot.docs
          .map((documentSnapshot) =>
              ProductModel.instanceFromQuerySnapshot(documentSnapshot))
          .toList();

      return list;
    } on FirebaseAuthException catch (e) {
      throw e.code;
    } on FirebaseException catch (e) {
      throw e.code;
    } on FormatException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.code;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // Get Products by query
  Future<List<ProductModel>> getProductsByQuery(Query query) async {
    try {
      final querySnapshot = await query.get();

      final List<ProductModel> productList = querySnapshot.docs
          .map((documentSnapshot) => ProductModel.instanceFromQuerySnapshot(
              documentSnapshot as QueryDocumentSnapshot<Map<String, dynamic>>))
          .toList();

      return productList;
    } on FirebaseAuthException catch (e) {
      throw e.code;
    } on FirebaseException catch (e) {
      throw e.code;
    } on FormatException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.code;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // Return products of a specific category
  Future<List<ProductModel>> getProductsforCategory(
      {required String categoryId, int limit = -1}) async {
    try {
      // productCategory query
      final productCategoryQuery = limit == -1
          ? await _db
              .collection("ProductCategory")
              .where("CategoryId", isEqualTo: categoryId)
              .limit(30)
              .get()
          : await _db
              .collection("ProductCategory")
              .where("CategoryId", isEqualTo: categoryId)
              .limit(limit)
              .get();

      // Products ids strings
      final productIds = productCategoryQuery.docs
          .map((p) => p["ProductId"] as String)
          .toList();

      // Products query
      final productsQuery = await _db
          .collection("Products")
          .where(FieldPath.documentId, whereIn: productIds)
          .get();

      // Products model
      final products = productsQuery.docs
          .map((product) => ProductModel.instanceFromDocumentSnapshot(product))
          .toList();

      return products;
    } on FirebaseAuthException catch (e) {
      throw e.code;
    } on FirebaseException catch (e) {
      throw e.code;
    } on FormatException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.code;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // Upload Products to Firestore
  Future<void> uploadDummyData(List<ProductModel> products) async {
    try {
      final storage = Get.put(FirebaseStorageService());

      // Loop through each Product
      for (var product in products) {
        // Get ImageData Link from the local assets
        final thumbnail =
            await storage.getImageDataFromAssets(product.thumbnail);

        // Upload image and get its Url
        final url = await storage.uploadImageData("Products/Images/", thumbnail,
            product.thumbnail.split('/').last.toString());

        // Assign Url to Product.thumbnail attribute
        product.thumbnail = url;

        // Product list of images
        if (product.images != null && product.images!.isNotEmpty) {
          List<String> imagesUrl = [];

          for (var image in product.images!) {
            // Get ImageData Link from the local assets
            final assetImage = await storage.getImageDataFromAssets(image);

            // Upload image and get its Url
            final url = await storage.uploadImageData("Products/Images/",
                assetImage, image.split('/').last.toString());

            // Add url to imagesUrl
            imagesUrl.add(url);
          }

          // Assign imagesUrl to product.images
          product.images!.clear();
          product.images!.assignAll(imagesUrl);
        }

        // Upload variation images
        if (product.productType == ProductType.variable.toString()) {
          for (var variation in product.productVariations!) {
            // Get ImageData Link from the local assets
            final assetImage =
                await storage.getImageDataFromAssets(variation.image);

            // Upload image and get its Url
            final url = await storage.uploadImageData("Products/Images/",
                assetImage, variation.image.split('/').last.toString());

            // Assign Url to variation.image attribute
            variation.image = url;
          }
        }

        // Store Product in Firestore
        await _db.collection("Products").doc(product.id).set(product.toJson());
      }
    } on FirebaseAuthException catch (e) {
      throw e.code;
    } on FirebaseException catch (e) {
      throw e.code;
    } on FormatException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.code;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // Return Favourite products
  Future<List<ProductModel>> getFavouritProducts(
      List<String> productIds) async {
    try {
      final querySnapshot = await _db
          .collection("Products")
          .where(FieldPath.documentId, whereIn: productIds)
          .get();

      final List<ProductModel> productList = querySnapshot.docs
          .map((documentSnapshot) =>
              ProductModel.instanceFromQuerySnapshot(documentSnapshot))
          .toList();

      return productList;
    } on FirebaseAuthException catch (e) {
      throw e.code;
    } on FirebaseException catch (e) {
      throw e.code;
    } on FormatException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.code;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // Upload Dummy Data For Testing
  Future<void> uploadDummyDataTest(List<ProductModel> products) async {
    try {
      final storage = Get.put(FirebaseStorageService());
      Map<String, String> assetImages = {};

      // Loop through each Product
      for (var product in products) {
        // Get ImageData Link from the local assets
        final thumbnail =
            await storage.getImageDataFromAssets(product.thumbnail);

        // Upload image and get its Url
        final url = await storage.uploadImageData("Products/Images/", thumbnail,
            product.thumbnail.split('/').last.toString());

        // Add to assetImages of existing images
        assetImages[product.thumbnail] = url;

        // Assign Url to Product.thumbnail attribute
        product.thumbnail = url;

        // Product list of images
        if (product.images != null && product.images!.isNotEmpty) {
          List<String> imagesUrl = [];

          for (var image in product.images!) {
            // Get ImageData Link from the local assets
            final assetImage = await storage.getImageDataFromAssets(image);

            final String url;
            // If image has been previously uploaded
            if (assetImages.containsKey(image)) {
              url = assetImages[image]!;
            } else {
              // Upload image and get its Url
              url = await storage.uploadImageData("Products/Images/",
                  assetImage, image.split('/').last.toString());

              // Add to assetImages of existing images
              assetImages[image] = url;
            }

            // Add url to imagesUrl
            imagesUrl.add(url);
          }

          // Assign imagesUrl to product.images
          product.images!.clear();
          product.images!.assignAll(imagesUrl);
        }

        // Upload variation images
        if (product.productType == ProductType.variable.toString()) {
          for (var variation in product.productVariations!) {
            // Get ImageData Link from the local assets
            final assetImage =
                await storage.getImageDataFromAssets(variation.image);

            final String url;
            // If image has been previously uploaded
            if (assetImages.containsKey(variation.image)) {
              url = assetImages[variation.image]!;
            } else {
              // Upload image and get its Url
              url = await storage.uploadImageData("Products/Images/",
                  assetImage, variation.image.split('/').last.toString());

              // Add to assetImages of existing images
              assetImages[variation.image] = url;
            }

            // Assign Url to variation.image attribute
            variation.image = url;
          }
        }

        assetImages.clear();
        // Store Product in Firestore
        await _db.collection("Products").doc(product.id).set(product.toJson());
      }
    } on FirebaseAuthException catch (e) {
      throw e.code;
    } on FirebaseException catch (e) {
      throw e.code;
    } on FormatException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.code;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
