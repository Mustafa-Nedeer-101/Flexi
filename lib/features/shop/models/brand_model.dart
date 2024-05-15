import 'package:cloud_firestore/cloud_firestore.dart';

class BrandModel {
  String id;
  String name;
  String image;
  bool? isFeatured;
  int? productsCount;

  BrandModel({
    required this.id,
    required this.image,
    required this.name,
    this.isFeatured,
    this.productsCount,
  });

  // Empty Helper Function
  static BrandModel empty() => BrandModel(id: '', image: '', name: '');

  // convert model to Json structure so that you can store data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Name': name,
      'Image': image,
      'ProductsCount': productsCount,
      'IsFeatured': isFeatured,
    };
  }

  // Map Json oriented document snapshot from firestore
  factory BrandModel.instance(Map<String, dynamic> documentSnapshot) {
    if (documentSnapshot.isNotEmpty) {
      return BrandModel(
          id: documentSnapshot['Id'] ?? '',
          image: documentSnapshot['Image'] ?? '',
          name: documentSnapshot['Name'] ?? '',
          productsCount: documentSnapshot['ProductsCount'] ?? 0,
          isFeatured: documentSnapshot['IsFeatured'] ?? false);
    } else {
      return BrandModel.empty();
    }
  }

  // Map Json oriented query document snapshot from firestore
  factory BrandModel.instanceQueryDocument(
      QueryDocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    final data = documentSnapshot.data();

    // Data is empty
    if (data.isEmpty) {
      return BrandModel.empty();
    }

    return BrandModel(
        id: documentSnapshot['Id'] ?? '',
        image: documentSnapshot['Image'] ?? '',
        name: documentSnapshot['Name'] ?? '',
        productsCount: documentSnapshot['ProductsCount'] ?? 0,
        isFeatured: documentSnapshot['IsFeatured'] ?? false);
  }
}
