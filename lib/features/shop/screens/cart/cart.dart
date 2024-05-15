import 'package:flexi/common/widgets/appbar/appbar.dart';
import 'package:flexi/common/widgets/loaders/animation_loader.dart';
import 'package:flexi/common/widgets/products/cart/cart_items.dart';
import 'package:flexi/features/shop/controllers/product_controllers/cart_controller.dart';
import 'package:flexi/features/shop/screens/checkout/checkout.dart';
import 'package:flexi/utils/constants/image_strings.dart';
import 'package:flexi/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text(
          "Cart",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),

      // body
      body: Obx(() {
        // Nothing Found
        final emptyWidget = CustomAnimationLoaderWidget(
            text: 'Whoops!, Cart is empty',
            animation: CImages.emptyCart,
            showAction: true,
            actionText: "Let's fill it",
            onActionPressed: () => Get.back());

        return controller.cartItems.isEmpty
            ? emptyWidget
            : const SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(CSizes.defaultSpace),
                  child: CustomCartItems(),
                ),
              );
      }),

      // Bottom
      bottomNavigationBar: Obx(() {
        final isEmpty = controller.cartItems.isEmpty;
        return isEmpty
            ? const SizedBox()
            : Padding(
                padding: const EdgeInsets.all(CSizes.defaultSpace),
                child: ElevatedButton(
                    onPressed: () => Get.to(() => const CheckoutScreen()),
                    child: Obx(() => Text(
                        "Checkout  \$${controller.totalCartPrice.value}"))),
              );
      }),
    );
  }
}
