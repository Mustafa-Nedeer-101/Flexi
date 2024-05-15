import 'package:flexi/features/shop/controllers/product_controllers/cart_controller.dart';
import 'package:flexi/features/shop/screens/cart/cart.dart';
import 'package:flexi/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CustomCartCounterIcon extends StatelessWidget {
  const CustomCartCounterIcon({super.key, this.iconColor = CColors.white});

  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());

    return Stack(
      children: [
        IconButton(
            onPressed: () => Get.to(() => const CartScreen()),
            icon: Icon(
              Iconsax.shopping_bag,
              color: iconColor,
            )),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: CColors.black,
              borderRadius: BorderRadiusDirectional.circular(100),
            ),
            child: Center(
              child: Obx(
                () => Text(
                  controller.nOfCartItems.value.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(color: CColors.white, fontSizeFactor: 0.8),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
