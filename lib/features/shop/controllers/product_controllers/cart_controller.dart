import 'package:flexi/common/widgets/loaders/loaders.dart';
import 'package:flexi/features/shop/controllers/product_controllers/variation_controller.dart';
import 'package:flexi/features/shop/models/cart_item_model.dart';
import 'package:flexi/features/shop/models/product_model.dart';
import 'package:flexi/utils/constants/enums.dart';
import 'package:flexi/utils/local_storage/sorage_utility.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  CartController() {
    loadCartItems();
  }

  // Variables
  RxInt nOfCartItems = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt productQuantityInCart = 0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;
  final variationController = VariationController.instance;

  // Add items in the cart
  void addToCart(ProductModel product) {
    // Quantiy check
    if (productQuantityInCart.value < 0) {
      CustomLoaders.customToast(message: 'Select Quantity');
      return;
    }

    // Variation check for variable products
    if (product.productType == ProductType.variable.toString() &&
        variationController.selectedVariation.value.id.isEmpty) {
      CustomLoaders.customToast(message: 'Select Variation');
      return;
    }

    // Out of stock check
    if (product.productType == ProductType.variable.toString()) {
      if (variationController.selectedVariation.value.stock < 1) {
        CustomLoaders.warningSnackbar(
            title: 'Sorry', message: 'Selected variation is out of stock');

        return;
      }
    } else {
      if (product.stock < 1) {
        CustomLoaders.warningSnackbar(
            title: 'Sorry', message: 'Selected Product is out of stock');

        return;
      }
    }

    final selectedCartItem =
        convertToCartItem(product, productQuantityInCart.value);

    int index = cartItems.indexWhere((cartItem) =>
        cartItem.productId == selectedCartItem.productId &&
        cartItem.variationId == selectedCartItem.variationId);

    if (index >= 0) {
      cartItems[index].quantity = selectedCartItem.quantity;
    } else {
      cartItems.add(selectedCartItem);
    }

    updateCart();
    CustomLoaders.customToast(
        message: 'Your product has been added to the cart.');
  }

  // Add single type product
  void addOneToCart(CartItemModel item) {
    int index = cartItems.indexWhere((element) =>
        element.productId == item.productId &&
        element.variationId == item.variationId);

    if (index >= 0) {
      cartItems[index].quantity += 1;
    } else {
      cartItems.add(item);
    }

    updateCart();
  }

  void removeOneFromCart(CartItemModel item) {
    int index = cartItems.indexWhere((element) =>
        element.productId == item.productId &&
        element.variationId == item.variationId);

    if (index >= 0) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity -= 1;
      } else {
        cartItems[index].quantity == 1
            ? removeFromCartDialog(index)
            : cartItems.removeAt(index);
      }

      updateCart();
    }
  }

  // Popup
  void removeFromCartDialog(int index) {
    Get.defaultDialog(
      title: 'Remove Product',
      middleText: 'Are you sure you want to remove this product?',
      onConfirm: () {
        cartItems.removeAt(index);
        updateCart();
        CustomLoaders.customToast(message: 'Product removed from the cart');
        Get.back();
      },
      onCancel: () => () => Get.back(),
    );
  }

  // Convert a Product model to a cart item
  CartItemModel convertToCartItem(ProductModel product, int quantity) {
    if (product.productType == ProductType.single.toString()) {
      variationController.resetSelectedAttributes();
    }

    final variation = variationController.selectedVariation.value;
    final isVariation = variation.id.isNotEmpty;
    final price = isVariation
        ? variation.salePrice > 0.0
            ? variation.salePrice
            : variation.price
        : product.salePrice > 0.0
            ? product.salePrice
            : product.price;

    return CartItemModel(
        productId: product.id,
        title: product.title,
        price: price,
        quantity: quantity,
        variationId: variation.id,
        image: isVariation ? variation.image : product.thumbnail,
        brandName: product.brand != null ? product.brand!.name : '',
        selectedVariaition: isVariation ? variation.attributeValues : null);
  }

  // Update cart values
  void updateCart() {
    updateCartTotals();
    saveCartItems();
    cartItems.refresh();
  }

  void updateCartTotals() {
    double calculatedTotalPrice = 0.0;
    int calculatedNOItems = 0;

    for (var item in cartItems) {
      calculatedTotalPrice += (item.price) * item.quantity.toDouble();
      calculatedNOItems += item.quantity;
    }

    totalCartPrice.value = calculatedTotalPrice;
    nOfCartItems.value = calculatedNOItems;
  }

  void saveCartItems() {
    final cartItemsStrings =
        cartItems.map((element) => element.toJson()).toList();

    ULocalStorage.instance().saveData('CartItems', cartItemsStrings);
  }

  void loadCartItems() {
    final cartItemsStrings =
        ULocalStorage.instance().readData<List<dynamic>>('CartItems');

    if (cartItemsStrings != null) {
      cartItems.assignAll(cartItemsStrings.map((item) =>
          CartItemModel.instanceFromDocumentSnapshot(
              item as Map<String, dynamic>)));
      updateCartTotals();
    }
  }

  int getProductQuantityInCart(String productId) {
    final foundItem = cartItems
        .where((item) => item.productId == productId)
        .fold(0, (previousValue, element) => previousValue + element.quantity);

    return foundItem;
  }

  int getVariationQuantityInCart(String productId, String variationId) {
    final foundItem = cartItems.firstWhere(
      (item) => item.productId == productId && item.variationId == variationId,
      orElse: () => CartItemModel.empty(),
    );

    return foundItem.quantity;
  }

  // Cleart cart
  void clearCart() {
    productQuantityInCart.value = 0;
    cartItems.clear();
    updateCart();
  }

  // Initialize already added item's count in the cart
  void updateAlreadyAddedProductCount(ProductModel product) {
    if (product.productType == ProductType.single.toString()) {
      productQuantityInCart.value = getProductQuantityInCart(product.id);
    } else {
      final variationId = variationController.selectedVariation.value.id;
      if (variationId.isEmpty) {
        productQuantityInCart.value =
            getVariationQuantityInCart(product.id, variationId);
      } else {
        productQuantityInCart.value = 0;
      }
    }
  }

  //
}
