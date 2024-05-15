import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flexi/data/services/cloud_storage/firebase_storage_service.dart';
import 'package:flexi/features/shop/models/banner_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BannerRepo extends GetxController {
  static BannerRepo get instance => Get.find();

  // variables
  final _db = FirebaseFirestore.instance;

  // Get all order related to current user
  Future<List<BannerModel>> fetchBanners() async {
    try {
      final querySnapshot = await _db
          .collection('Banners')
          .where('IsActive', isEqualTo: true)
          .get();

      final List<BannerModel> list = querySnapshot.docs
          .map((documentSnapshot) => BannerModel.instance(documentSnapshot))
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
      throw 'Something went wrong while fetching banners';
    }
  }

  // Upload banners to the cloud firebase
  Future<void> uploadDummyData(List<BannerModel> banners) async {
    try {
      // Upload all the Categories along with their images
      final storage = Get.put(FirebaseStorageService());

      // Loop through each banner
      for (var banner in banners) {
        // Get ImageData Link from the local assets
        final file = await storage.getImageDataFromAssets(banner.image);

        // Upload image and get its Url
        final url =
            await storage.uploadImageData("Banners", file, banner.number);

        // Assign Url to banner image attribute
        banner.image = url;

        // Store Banner in Firestore
        await _db.collection("Banners").doc().set(banner.toJson());
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
