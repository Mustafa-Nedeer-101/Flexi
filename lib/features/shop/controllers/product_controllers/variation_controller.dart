import 'package:flexi/features/shop/controllers/product_controllers/cart_controller.dart';
import 'package:flexi/features/shop/controllers/product_controllers/images_controller.dart';
import 'package:flexi/features/shop/models/product_model.dart';
import 'package:flexi/features/shop/models/product_variation_model.dart';
import 'package:get/get.dart';

class VariationController extends GetxController {
  static VariationController get instance => Get.find();

  // Vriables
  RxMap selectedAttributes = {}.obs;
  RxString variationStockStatus = ''.obs;
  Rx<ProductVariationModel> selectedVariation =
      ProductVariationModel.empty().obs;

  void updateSelectedVariation(ProductVariationModel variation) {
    selectedVariation.value = variation;
  }

  // Select attribute, and variation
  void onAttributeSelected(
      ProductModel product, attributeName, attributeValue) {
    // add attribute to the selectedAttributes
    final selectedAttributes =
        Map<String, dynamic>.from(this.selectedAttributes);
    selectedAttributes[attributeName] = attributeValue;
    this.selectedAttributes[attributeName] = attributeValue;

    // Check the variation
    final selectedVariation = product.productVariations!.firstWhere(
        (variation) => _isSameAttributeValues(
            variation.attributeValues, selectedAttributes),
        orElse: () => ProductVariationModel.empty());

    // Show the selected variation image as a main image
    if (selectedVariation.image.isNotEmpty) {
      ImagesController.instance.selectedProductImage.value =
          selectedVariation.image;
    }

    if (selectedVariation.id.isNotEmpty) {
      final cartController = CartController.instance;
      cartController.productQuantityInCart.value = cartController
          .getVariationQuantityInCart(product.id, selectedVariation.id);
    }
    // Assign selected variation
    this.selectedVariation.value = selectedVariation;

    // Update selected product variation status
    getProductVariationStockStatus();
  }

  // Check if selected attributes matchs any variation attributes
  bool _isSameAttributeValues(Map<String, dynamic> variationAttributes,
      Map<String, dynamic> selectedAttribute) {
    // Length is different
    if (variationAttributes.length != selectedAttribute.length) return false;

    for (final key in variationAttributes.keys) {
      if (variationAttributes[key] != selectedAttribute[key]) return false;
    }

    return true;
  }

  // Check attribute availability / stock in variation
  Set<String?> getAttributesAvailabilityInVariation(
      List<ProductVariationModel> variations, String attributeName) {
    // Pass the variations to check which attributes are available and stock is not 0
    final availableVariationAttributeValues = variations
        .where((variation) =>
            variation.attributeValues[attributeName] != null &&
            variation.attributeValues[attributeName]!.isNotEmpty &&
            variation.stock > 0)
        .map((variation) => variation.attributeValues[attributeName])
        .toSet();

    return availableVariationAttributeValues;
  }

  // Get variation price
  String getVariationPrice() {
    return (selectedVariation.value.salePrice > 0
            ? selectedVariation.value.salePrice
            : selectedVariation.value.price)
        .toString();
  }

  // Check product variation stock status
  void getProductVariationStockStatus() {
    variationStockStatus.value =
        selectedVariation.value.stock > 0 ? 'In Stock' : 'Out of Stock';
  }

  // Reset selected attributes when switching products
  void resetSelectedAttributes() {
    selectedAttributes.clear();
    variationStockStatus.value = '';
    selectedVariation.value = ProductVariationModel.empty();
  }
}
