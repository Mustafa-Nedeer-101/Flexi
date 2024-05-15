import 'package:flexi/features/shop/controllers/product_controllers/cart_controller.dart';
import 'package:flexi/features/shop/models/product_model.dart';
import 'package:flexi/features/shop/screens/product_details/product_detail.dart';
import 'package:flexi/utils/constants/colors.dart';
import 'package:flexi/utils/constants/enums.dart';
import 'package:flexi/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProductCardAddToCartButton extends StatelessWidget {
  const ProductCardAddToCartButton({
    super.key,
    required this.product,
  });

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;

    return InkWell(
      onTap: () {
        if (product.productType == ProductType.single.toString()) {
          final cartItem = cartController.convertToCartItem(product, 1);
          cartController.addOneToCart(cartItem);
        } else {
          Get.to(() => ProductDetailScreen(product: product));
        }
      },
      child: Obx(() {
        final productQuantityInCart =
            cartController.getProductQuantityInCart(product.id);

        return Container(
          decoration: BoxDecoration(
              color: productQuantityInCart > 0 ? CColors.primary : CColors.dark,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(CSizes.cardRadiusMd),
                bottomRight: Radius.circular(CSizes.productImageRadius),
              )),
          child: SizedBox(
            width: CSizes.iconLg * 1.2,
            height: CSizes.iconLg * 1.2,
            child: Center(
              child: productQuantityInCart > 0
                  ? Text(
                      productQuantityInCart.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .apply(color: CColors.white),
                    )
                  : const Icon(
                      Iconsax.add,
                      color: CColors.white,
                    ),
            ),
          ),
        );
      }),
    );
  }
}
