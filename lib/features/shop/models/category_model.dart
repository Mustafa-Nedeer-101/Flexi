import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String id;
  String name;
  String image;
  String parentId;
  bool isFeatured;

  CategoryModel(
      {required this.id,
      required this.name,
      required this.image,
      required this.isFeatured,
      this.parentId = ''});

  // Empty Helper Function
  static CategoryModel empty() =>
      CategoryModel(id: '', name: '', image: '', isFeatured: false);

  // convert model to Json structure so that you can store data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Name': name,
      'Image': image,
      'IsFeatured': isFeatured,
      'ParentId': parentId,
    };
  }

  // Map Json oriented document snapshot from firestore
  factory CategoryModel.instance(
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    if (documentSnapshot.data() != null) {
      final data = documentSnapshot.data()!;

      return CategoryModel(
          id: documentSnapshot.id,
          name: data['Name'] ?? '',
          image: data['Image'] ?? '',
          parentId: data['ParentId'] ?? '',
          isFeatured: data['IsFeatured'] ?? false);
    } else {
      return CategoryModel.empty();
    }
  }

  // Map Json oriented query document snapshot from firestore
  factory CategoryModel.instanceFromQueryDocumentSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    final data = documentSnapshot.data();
    if (data.isNotEmpty) {
      return CategoryModel(
          id: documentSnapshot.id,
          name: data['Name'] ?? '',
          image: data['Image'] ?? '',
          parentId: data['ParentId'] ?? '',
          isFeatured: data['IsFeatured'] ?? false);
    } else {
      return CategoryModel.empty();
    }
  }
}
