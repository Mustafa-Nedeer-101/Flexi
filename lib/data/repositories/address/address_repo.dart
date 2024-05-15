import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flexi/data/repositories/authentication/authentication_repo.dart';
import 'package:flexi/features/personalization/models/address_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AddressRepo extends GetxController {
  static AddressRepo get instance => Get.find();

  // Variables
  final _db = FirebaseFirestore.instance;

  // Return all addressed of a user
  Future<List<AddressModel>> getUserAddresses() async {
    try {
      // Get User id
      final userId = AuthenticationRepo.instance.instanceUser?.uid;

      if (userId == null || userId.isEmpty) {
        throw 'Unable to find your information. Try again in few minutes.';
      }

      final addresses = await _db
          .collection("Users")
          .doc(userId)
          .collection("Addresses")
          .get();

      final List<AddressModel> addressesList = addresses.docs
          .map((address) => AddressModel.instanceFromDocumentSnapshot(address))
          .toList();

      return addressesList;
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

  // Clear the isSelected field for all addresses
  Future<void> updateSelectedField(String addressId, bool selected) async {
    try {
      final userId = AuthenticationRepo.instance.instanceUser!.uid;

      if (userId.isEmpty) {
        throw 'Unable to find your information. Try again in few minutes.';
      }

      await _db
          .collection("Users")
          .doc(userId)
          .collection("Addresses")
          .doc(addressId)
          .update({"IsSelectedAddress": selected});
    } on FirebaseAuthException catch (e) {
      throw e.code;
    } on FirebaseException catch (e) {
      throw e.code;
    } on FormatException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.code;
    } catch (e) {
      throw 'Something went wrong while fetching address informatation. Try again later';
    }
  }

  // Add new address
  Future<String> addNewAddress(AddressModel newAddress) async {
    try {
      final userId = AuthenticationRepo.instance.instanceUser!.uid;

      if (userId.isEmpty) {
        throw 'Unable to find your information. Try again in few minutes.';
      }

      final currentAddress = await _db
          .collection("Users")
          .doc(userId)
          .collection("Addresses")
          .add(newAddress.toJson());

      return currentAddress.id;
    } on FirebaseAuthException catch (e) {
      throw e.code;
    } on FirebaseException catch (e) {
      throw e.code;
    } on FormatException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.code;
    } catch (e) {
      throw 'Something went wrong while fetching address informatation. Try again later';
    }
  }

  // Update Id field of an address
  Future updateIdOfAddress(String addressId) async {
    try {
      final userId = AuthenticationRepo.instance.instanceUser!.uid;

      if (userId.isEmpty) {
        throw 'Unable to find your information. Try again in few minutes.';
      }

      await _db
          .collection("Users")
          .doc(userId)
          .collection("Addresses")
          .doc(addressId)
          .update({'Id': addressId});
    } on FirebaseAuthException catch (e) {
      throw e.code;
    } on FirebaseException catch (e) {
      throw e.code;
    } on FormatException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.code;
    } catch (e) {
      throw 'Something went wrong while fetching address informatation. Try again later';
    }
  }

  // Upload Dummy Data
  Future<void> uploadDummyData() async {}
}
