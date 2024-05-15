import 'package:flexi/common/widgets/loaders/loaders.dart';
import 'package:flexi/common/widgets/succes_screen/success_screen.dart';
import 'package:flexi/data/repositories/authentication/authentication_repo.dart';
import 'package:flexi/data/repositories/order/order_repo.dart';
import 'package:flexi/features/personalization/controllers/address/address_controller.dart';
import 'package:flexi/features/shop/controllers/product_controllers/cart_controller.dart';
import 'package:flexi/features/shop/controllers/product_controllers/checkout_controller.dart';
import 'package:flexi/features/shop/models/order_model.dart';
import 'package:flexi/navigation_menu.dart';
import 'package:flexi/utils/constants/enums.dart';
import 'package:flexi/utils/constants/image_strings.dart';
import 'package:flexi/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  // Variables
  final cartController = CartController.instance;
  final addressController = AddressController.instance;
  final checkoutController = CheckoutController.instance;
  final orderRepo = Get.put(OrderRepo());

  // Fetch user's order history
  Future<List<OrderModel>> getUserOrders() async {
    try {
      final userOrders = await orderRepo.getUserOrders();

      return userOrders;
    } catch (e) {
      CustomLoaders.warningSnackbar(title: 'Oh Snap!', message: e.toString());
      return Future(() => []);
    }
  }

  // Add methods for order processing
  void processOrder(double totalAmount) async {
    try {
      // Start Loader
      UFullSreenLoader.openLoadingDialog(
          'Processing your order', CImages.loading);

      // Get user authentication id
      final userId = AuthenticationRepo.instance.instanceUser?.uid;
      if (userId == null || userId.isEmpty) return;

      // Add Details
      final order = OrderModel(
          id: UniqueKey().toString(),
          userId: userId,
          status: OrderStatus.processing,
          totalAmount: totalAmount,
          orderDate: DateTime.now(),
          paymentMethod: checkoutController.selectedPaymentMethod.value.name,
          address: addressController.selectedAddress.value,
          // Set date as needed

          items: cartController.cartItems.toList());

      // Save the order to database
      await orderRepo.saveOrder(order, userId);

      // Update
      cartController.clearCart();

      // show success screen
      Get.off(() => CustomSuccessScreen(
          image: CImages.orderCompleted,
          title: 'Payment Success!',
          subTitle: 'Your item will be shipped soon!',
          onPressed: () => Get.offAll(() => const NavigationMenu())));
    } catch (e) {
      CustomLoaders.warningSnackbar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
