class CartItemModel {
  String productId;
  String title;
  double price;
  String? image;
  int quantity;
  String variationId;
  String? brandName;
  Map<String, String>? selectedVariaition;

  // constructor
  CartItemModel(
      {required this.productId,
      this.title = '',
      this.price = 0.0,
      this.image,
      required this.quantity,
      this.variationId = '',
      this.brandName,
      this.selectedVariaition});

  // Empty Cart Item
  static CartItemModel empty() => CartItemModel(productId: '', quantity: 0);

  // to JSON
  Map<String, dynamic> toJson() {
    return {
      'ProductId': productId,
      'Title': title,
      'Price': price,
      'Image': image,
      'Quantity': quantity,
      'VariationId': variationId,
      'BrandName': brandName,
      'SelectedVariation': selectedVariaition,
    };
  }

  // From document snapshot
  factory CartItemModel.instanceFromDocumentSnapshot(
      Map<String, dynamic> json) {
    return CartItemModel(
        productId: json['ProductId'] ?? '',
        title: json["Title"],
        price: json['Price']?.toDouble(),
        image: json['Image'],
        quantity: json['Quantity'] ?? 0,
        variationId: json['VariationId'],
        brandName: json['BrandName'],
        selectedVariaition: json['SelectedVariation'] != null
            ? Map<String, String>.from(json['SelectedVariation'])
            : null);
  }
}
