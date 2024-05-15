class ProductAttributeModel {
  String? name;
  final List<String>? values;

  ProductAttributeModel({this.name, this.values});

  // Empty Helper Function
  static ProductAttributeModel empty() =>
      ProductAttributeModel(name: '', values: []);

  // convert model to Json structure so that you can store data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Values': values,
    };
  }

  // Map Json oriented document snapshot from firestore
  factory ProductAttributeModel.instance(
      Map<String, dynamic> documentSnapshot) {
    if (documentSnapshot.isNotEmpty) {
      return ProductAttributeModel(
          name: documentSnapshot.containsKey('Name')
              ? documentSnapshot['Name']
              : '',
          values: List<String>.from(documentSnapshot['Values']));
    } else {
      return ProductAttributeModel.empty();
    }
  }
}
