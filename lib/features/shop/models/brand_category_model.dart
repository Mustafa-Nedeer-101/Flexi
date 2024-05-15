import 'package:cloud_firestore/cloud_firestore.dart';

class BrandCategoryModel {
  BrandCategoryModel({
    required this.categoryId,
    required this.brandId,
  });

  final String categoryId;
  final String brandId;

  static BrandCategoryModel empty() =>
      BrandCategoryModel(categoryId: '', brandId: '');

  // convert the model to Json
  Map<String, dynamic> toJson() {
    return {
      'CategoryId': categoryId,
      'BrandId': brandId,
    };
  }

  // return model from a document snapshot
  factory BrandCategoryModel.fromdocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    final data = documentSnapshot.data();

    if (data != null) {
      return BrandCategoryModel(
          categoryId: data['CategoryId'] ?? '', brandId: data['BrandId'] ?? '');
    } else {
      return BrandCategoryModel.empty();
    }
  }

  // return model form query document snapshot
  factory BrandCategoryModel.fromQueryDocumentSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    final data = documentSnapshot.data();

    if (data.isEmpty) {
      return BrandCategoryModel.empty();
    } else {
      return BrandCategoryModel(
          brandId: data['BrandId'] ?? '', categoryId: data['CategoryId'] ?? '');
    }
  }
}
