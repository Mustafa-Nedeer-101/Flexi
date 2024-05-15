import 'package:flexi/common/styles/shadows.dart';
import 'package:flexi/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flexi/common/widgets/images/rounded_image.dart';
import 'package:flexi/common/widgets/products/buttons/add_to_cart_button.dart';
import 'package:flexi/common/widgets/products/favourite_icon/favourite_icon.dart';
import 'package:flexi/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:flexi/common/widgets/texts/product_title_text.dart';
import 'package:flexi/common/widgets/texts/product_price_text.dart';
import 'package:flexi/features/shop/controllers/product_controllers/product_controller.dart';
import 'package:flexi/features/shop/models/product_model.dart';
import 'package:flexi/features/shop/screens/product_details/product_detail.dart';
import 'package:flexi/utils/constants/colors.dart';
import 'package:flexi/utils/constants/enums.dart';
import 'package:flexi/utils/constants/sizes.dart';
import 'package:flexi/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomProductCardVertical extends StatelessWidget {
  const CustomProductCardVertical(
      {super.key, this.onTap, required this.product});

  final void Function()? onTap;
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculateSalePersentage(product.price, product.salePrice);
    bool dark = UHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {
        Get.to(() => ProductDetailScreen(
              product: product,
            ));
      },
      child: Container(
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [CShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(CSizes.productImageRadius),
          color: dark ? CColors.darkerGrey : CColors.white,
        ),
        child: Column(
          children: [
            // Thumbnail
            CustomRoundedContainer(
              height: 180,
              width: double.infinity,
              padding: const EdgeInsets.all(CSizes.sm),
              backgroundColor: dark ? CColors.dark : CColors.light,
              child: Stack(
                children: [
                  // Thumbnail Image
                  Center(
                    child: CustomRoundedImage(
                      imageUrl: product.thumbnail,
                      isNetworkImage: true,
                      applyImageRadius: true,
                      fit: BoxFit.contain,
                      width: double.infinity,
                    ),
                  ),

                  // Sale Tag
                  if (salePercentage != null)
                    Positioned(
                      top: 10,
                      child: CustomRoundedContainer(
                        radius: CSizes.sm,
                        padding: const EdgeInsets.symmetric(
                            horizontal: CSizes.sm, vertical: CSizes.xs),
                        backgroundColor: CColors.secondary.withOpacity(0.8),
                        child: Text(
                          "$salePercentage%",
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .apply(color: CColors.black),
                        ),
                      ),
                    ),

                  // Favorite Icon
                  Positioned(
                      top: 0,
                      right: 0,
                      child: CustomFavouriteIcon(productId: product.id)),
                ],
              ),
            ),

            // Space Between Items
            const SizedBox(
              height: CSizes.spaceBtwItems / 2,
            ),

            // Details
            Padding(
                padding: const EdgeInsets.only(left: CSizes.sm),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Product Name
                      CustomProductTitleText(
                        title: product.title,
                        smallSize: true,
                      ),
                      const SizedBox(
                        height: CSizes.spaceBtwItems / 2,
                      ),
                      // Brand Row
                      CustomBrandTitleTextWithVerifiedIcon(
                          title: product.brand!.name),
                    ],
                  ),
                )),

            // Spacer to keep the height of each box same
            const Spacer(),

            // Price & Add Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Price
                Flexible(
                  child: Column(children: [
                    if (product.productType == ProductType.single.toString() &&
                        product.salePrice > 0)
                      Padding(
                        padding: const EdgeInsets.only(left: CSizes.sm),
                        child: Text(
                          product.price.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .apply(decoration: TextDecoration.lineThrough),
                        ),
                      ),

                    // Price, show sale price as main price if sale exist
                    Padding(
                      padding: const EdgeInsets.only(left: CSizes.sm),
                      child: HomeProductPriceText(
                        price: controller.getProductPrice(product),
                      ),
                    ),
                  ]),
                ),

                // Add To Card
                ProductCardAddToCartButton(
                  product: product,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
