import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flexi/data/repositories/authentication/authentication_repo.dart';
import 'package:flexi/features/shop/models/order_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class OrderRepo extends GetxController {
  static OrderRepo get instance => Get.find();

  // Variables
  final _db = FirebaseFirestore.instance;

  // Return all order related to curent user
  Future<List<OrderModel>> getUserOrders() async {
    try {
      final userId = AuthenticationRepo.instance.instanceUser?.uid;

      if (userId == null || userId.isEmpty) {
        throw 'Unable to find user information. Try again in few minutes';
      }

      final result = await _db
          .collection('Users')
          .doc(userId)
          .collection('Orders')
          .orderBy("OrderDate", descending: true)
          .get();

      return result.docs
          .map((doc) => OrderModel.instanceFromQueryDocumentSnapshot(doc))
          .toList();
    } on FirebaseAuthException catch (e) {
      throw e.code;
    } on FirebaseException catch (e) {
      throw e.code;
    } on FormatException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.code;
    } catch (e) {
      throw 'Something went wrong While fetching your order information. Please try again';
    }
  }

  // Store new user model
  Future<void> saveOrder(OrderModel order, String userId) async {
    try {
      await _db
          .collection('Users')
          .doc(userId)
          .collection('Orders')
          .add(order.toJson());
    } on FirebaseAuthException catch (e) {
      throw e.code;
    } on FirebaseException catch (e) {
      throw e.code;
    } on FormatException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.code;
    } catch (e) {
      throw 'Something went wrong saving your order information. Please try again';
    }
  }
}
