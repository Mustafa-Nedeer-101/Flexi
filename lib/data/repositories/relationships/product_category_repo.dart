import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flexi/features/shop/models/product_category_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProductCategoryRepo extends GetxController {
  static ProductCategoryRepo get instance => Get.find();

  // Variables
  final _db = FirebaseFirestore.instance;

  // Get

  // Upload Data
  Future<void> uploadDummyData(
      List<ProductCategoryModel> productCategory) async {
    try {
      // Loop through each Model
      for (final productCat in productCategory) {
        // Upload to Firestore
        await _db.collection('ProductCategory').doc().set(productCat.toJson());
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
