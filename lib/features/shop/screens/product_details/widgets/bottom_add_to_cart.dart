import 'package:flexi/common/widgets/icons/circular_icon.dart';
import 'package:flexi/features/shop/controllers/product_controllers/cart_controller.dart';
import 'package:flexi/features/shop/models/product_model.dart';
import 'package:flexi/utils/constants/colors.dart';
import 'package:flexi/utils/constants/sizes.dart';
import 'package:flexi/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProductDetailBottomAddToCart extends StatelessWidget {
  const ProductDetailBottomAddToCart({super.key, required this.product});

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    controller.updateAlreadyAddedProductCount(product);
    final bool dark = UHelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: CSizes.defaultSpace, vertical: CSizes.defaultSpace / 2),
      decoration: BoxDecoration(
          color: dark ? CColors.darkerGrey : CColors.light,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(CSizes.cardRadiusLg),
            topRight: Radius.circular(CSizes.cardRadiusLg),
          )),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Plus and minus
            Row(
              children: [
                // Remove
                CustomCircularIcon(
                  icon: Iconsax.minus,
                  backgroundColor: CColors.darkGrey,
                  width: 40,
                  height: 40,
                  color: CColors.white,
                  onPressed: () => controller.productQuantityInCart.value < 1
                      ? null
                      : controller.productQuantityInCart.value -= 1,
                ),
                const SizedBox(
                  width: CSizes.spaceBtwItems,
                ),
                Text(
                  controller.productQuantityInCart.value.toString(),
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(
                  width: CSizes.spaceBtwItems,
                ),

                // Add
                CustomCircularIcon(
                  icon: Iconsax.add,
                  backgroundColor: CColors.black,
                  width: 40,
                  height: 40,
                  color: CColors.white,
                  onPressed: () => controller.productQuantityInCart += 1,
                ),
              ],
            ),

            // Add to Cart
            ElevatedButton(
              onPressed: controller.productQuantityInCart.value < 1
                  ? null
                  : () => controller.addToCart(product),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(CSizes.md),
                backgroundColor: CColors.black,
                side: const BorderSide(color: CColors.black),
              ),
              child: const Text(
                'Add to Cart',
                style: TextStyle(color: CColors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
