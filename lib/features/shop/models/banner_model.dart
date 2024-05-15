import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
  BannerModel(
      {required this.number,
      required this.image,
      required this.isActive,
      required this.targetScreen});

  // Variables
  final String number;
  String image;
  final bool isActive;
  final String targetScreen;

  // empty model
  static empty() => BannerModel(
      number: '', image: '', isActive: false, targetScreen: '/home');

  // Upload a model to Firestore
  Map<String, dynamic> toJson() {
    return {
      'Number': number,
      'ImageUrl': image,
      'IsActive': isActive,
      'TargetScreen': targetScreen,
    };
  }

  // Fetch a model from Firebase
  factory BannerModel.instance(
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    if (documentSnapshot.data() != null) {
      final data = documentSnapshot.data()!;

      return BannerModel(
          number: data['Number'] ?? '',
          image: data['ImageUrl'] ?? '',
          isActive: data['IsActive'] ?? false,
          targetScreen: data['TargetScreen'] ?? '/home');
    } else {
      return BannerModel.empty();
    }
  }
}
