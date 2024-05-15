import 'package:cloud_firestore/cloud_firestore.dart';

class ProductCategoryModel {
  ProductCategoryModel({
    required this.productId,
    required this.categoryId,
  });

  final String productId;
  final String categoryId;

  static ProductCategoryModel empty() =>
      ProductCategoryModel(productId: '', categoryId: '');

  // convert model to Json
  Map<String, dynamic> toJson() {
    return {
      'ProductId': productId,
      'CategoryId': categoryId,
    };
  }

  // return model from query document snapshot
  factory ProductCategoryModel.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    final data = documentSnapshot.data();

    if (data != null) {
      return ProductCategoryModel(
          productId: data['ProductId'] ?? '',
          categoryId: data['CategoryId'] ?? '');
    } else {
      return ProductCategoryModel.empty();
    }
  }

  // return model from query document snapshot
  factory ProductCategoryModel.fromQueryDocumentSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    final data = documentSnapshot.data();

    if (data.isNotEmpty) {
      return ProductCategoryModel(
          productId: data['ProductId'] ?? '',
          categoryId: data['CategoryId'] ?? '');
    } else {
      return ProductCategoryModel.empty();
    }
  }
}
