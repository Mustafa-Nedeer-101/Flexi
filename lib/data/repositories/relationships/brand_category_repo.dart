import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flexi/features/shop/models/brand_category_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BrandCategoryRepo extends GetxController {
  static BrandCategoryRepo get instance => Get.find();

  // Variables
  final _db = FirebaseFirestore.instance;

  // Get

  // Upload Data
  Future<void> uploadDummyData(List<BrandCategoryModel> brandCategory) async {
    try {
      // Loop through each Model
      for (final brandCat in brandCategory) {
        // Upload to Firestore
        await _db.collection('BrandCategory').doc().set(brandCat.toJson());
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
