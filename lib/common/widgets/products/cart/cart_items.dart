import 'package:flexi/common/widgets/products/cart/add_remove_product_buttons.dart';
import 'package:flexi/common/widgets/products/cart/cart_item.dart';
import 'package:flexi/common/widgets/texts/product_price_text.dart';
import 'package:flexi/features/shop/controllers/product_controllers/cart_controller.dart';
import 'package:flexi/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCartItems extends StatelessWidget {
  const CustomCartItems({
    super.key,
    this.showAddRemoveButtons = true,
  });

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;

    return Obx(
      () => ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) => const SizedBox(
          height: CSizes.spaceBtwSections,
        ),
        itemCount: cartController.cartItems.length,
        itemBuilder: (context, index) => Obx(() {
          final item = cartController.cartItems[index];

          return Column(
            children: [
              CustomCartItem(
                item: item,
              ),
              if (showAddRemoveButtons)
                const SizedBox(
                  height: CSizes.spaceBtwItems,
                ),

              //
              if (showAddRemoveButtons)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const SizedBox(
                          width: 70,
                        ),
                        CustomProductQuantityWithPlusAndMinus(
                          quantity: item.quantity,
                          add: () => cartController.addOneToCart(item),
                          remove: () => cartController.removeOneFromCart(item),
                        ),
                      ],
                    ),

                    // Total Price
                    HomeProductPriceText(
                        price: (item.price * item.quantity).toStringAsFixed(1)),
                  ],
                ),
            ],
          );
        }),
      ),
    );
  }
}
