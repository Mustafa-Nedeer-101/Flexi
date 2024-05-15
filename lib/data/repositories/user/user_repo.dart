import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flexi/data/repositories/authentication/authentication_repo.dart';
import 'package:flexi/features/personalization/models/user_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserRepo extends GetxController {
  static UserRepo get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Save User data to Firestore
  Future<void> saveUserRecord(UserModel userModel) async {
    try {
      await _db.collection("Users").doc(userModel.id).set(userModel.toJson());
    } on FirebaseException catch (e) {
      throw e.code;
    } on FormatException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.code;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  // Fetch user data
  Future<UserModel> fetchUserRecord() async {
    try {
      final documentSnapshot = await _db
          .collection("Users")
          .doc(AuthenticationRepo.instance.instanceUser?.uid)
          .get();

      // Test if Query returns a document and return a UserModel
      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
    } on FirebaseException catch (e) {
      throw e.code;
    } on FormatException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.code;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  // update user
  Future<void> updateUserRecord(UserModel userModel) async {
    try {
      await _db
          .collection("Users")
          .doc(userModel.id)
          .update(userModel.toJson());
    } on FirebaseException catch (e) {
      throw e.code;
    } on FormatException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.code;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  // update specific fields
  Future<void> updateUserRecordField(Map<String, dynamic> json) async {
    try {
      await _db
          .collection("Users")
          .doc(AuthenticationRepo.instance.instanceUser?.uid)
          .update(json);
    } on FirebaseException catch (e) {
      throw e.code;
    } on FormatException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.code;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  // remove user
  Future<void> removeUserRecord(String userId) async {
    try {
      await _db.collection("Users").doc(userId).delete();
    } on FirebaseException catch (e) {
      throw e.code;
    } on FormatException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.code;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  // upload any image
  Future<String> uploadImage(String path, XFile image) async {
    try {
      final ref = FirebaseStorage.instance.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    } on FirebaseException catch (e) {
      throw e.code;
    } on FormatException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.code;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }
}
