import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flexi/features/shop/models/category_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../services/cloud_storage/firebase_storage_service.dart';

class CategoryRepo extends GetxController {
  static CategoryRepo get instance => Get.find();

  // Variables
  final _db = FirebaseFirestore.instance;

// Get all categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final querySnapshot = await _db.collection('Categories').get();

      final List<CategoryModel> list = querySnapshot.docs
          .map((documentSnapshot) => CategoryModel.instance(documentSnapshot))
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

  // Get sub categories
  Future<List<CategoryModel>> getSubCategories(String categoryId) async {
    try {
      final querySnapshot = await _db
          .collection("Categories")
          .where("ParentId", isEqualTo: categoryId)
          .get();

      final subCats = querySnapshot.docs
          .map((subCat) =>
              CategoryModel.instanceFromQueryDocumentSnapshot(subCat))
          .toList();

      return subCats;
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

  // Upload categories to Firestore
  Future<void> uploadDummyData(List<CategoryModel> categories) async {
    try {
      // Upload all the Categories along with their images
      final storage = Get.put(FirebaseStorageService());

      // Loop through each category
      for (var category in categories) {
        // Get ImageData Link from the local assets
        final file = await storage.getImageDataFromAssets(category.image);

        // Upload image and get its Url
        final url =
            await storage.uploadImageData("Categories", file, category.name);

        // Assign Url to category image attribute
        category.image = url;

        // Store category in Firestore
        await _db
            .collection("Categories")
            .doc(category.id)
            .set(category.toJson());
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
