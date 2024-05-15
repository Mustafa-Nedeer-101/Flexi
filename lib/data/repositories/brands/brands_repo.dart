import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flexi/data/services/cloud_storage/firebase_storage_service.dart';
import 'package:flexi/features/shop/models/brand_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BrandsRepo extends GetxController {
  static BrandsRepo get instance => Get.find();

  // Variables
  final _db = FirebaseFirestore.instance;
  final storage = Get.put(FirebaseStorageService());

  // Return a list of All brands
  Future<List<BrandModel>> getAllBrands() async {
    try {
      final snapshot = await _db.collection('Brands').get();

      final List<BrandModel> list = snapshot.docs
          .map((document) => BrandModel.instanceQueryDocument(document))
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

  // Return a list of 2 brands of a sepecific category
  Future<List<BrandModel>> getBrandsForCategory(String categoryId) async {
    try {
      // get a list of brands id
      QuerySnapshot brandCategoryQuery = await _db
          .collection('BrandCategory')
          .where("CategoryId", isEqualTo: categoryId)
          .limit(30)
          .get();

      // a list of brands id from the previous query
      List<String> brandIds = brandCategoryQuery.docs
          .map((brandCategory) => brandCategory["BrandId"] as String)
          .toList();

      // get the brands from their id
      final brandsQuery = await _db
          .collection("Brands")
          .where(FieldPath.documentId, whereIn: brandIds)
          .limit(2)
          .get();

      // a list of brand models
      final List<BrandModel> brands = brandsQuery.docs
          .map((brand) => BrandModel.instanceQueryDocument(brand))
          .toList();

      return brands;
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

  // upload brands
  Future<void> uploadDummyData(List<BrandModel> brands) async {
    try {
      // Loop through brands
      for (final brand in brands) {
        // Get image path from assets
        final imageData = await storage.getImageDataFromAssets(brand.image);

        // store image on cloud firebase storage
        final imageUrl = await storage.uploadImageData(
          "Brands/${brand.name}/",
          imageData,
          'brandLogo',
        );

        // Assign image path to brand.image
        brand.image = imageUrl;

        // Upload Brand
        _db.collection('Brands').doc(brand.id).set(brand.toJson());
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
