// ignore_for_file: prefer_const_constructors

import 'package:flexi/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flexi/common/widgets/images/circular_image.dart';
import 'package:flexi/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:flexi/common/widgets/texts/product_price_text.dart';
import 'package:flexi/common/widgets/texts/product_title_text.dart';
import 'package:flexi/features/shop/controllers/product_controllers/product_controller.dart';
import 'package:flexi/features/shop/models/product_model.dart';
import 'package:flexi/utils/constants/colors.dart';
import 'package:flexi/utils/constants/enums.dart';
import 'package:flexi/utils/constants/image_strings.dart';
import 'package:flexi/utils/constants/sizes.dart';
import 'package:flexi/utils/helpers/helper_functions.dart';
import 'package:flexi/utils/helpers/pricing_calculator.dart';
import 'package:flutter/material.dart';

class ProductDetailMetaData extends StatelessWidget {
  const ProductDetailMetaData({super.key, required this.product});

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculateSalePersentage(product.price, product.salePrice);
    final bool dark = UHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Price and sale price
        Row(
          children: [
            // Sale Tag
            CustomRoundedContainer(
              radius: CSizes.sm,
              backgroundColor: CColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: CSizes.sm, vertical: CSizes.xs),
              child: Text(
                '$salePercentage%',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: CColors.black),
              ),
            ),

            const SizedBox(
              width: CSizes.spaceBtwItems,
            ),

            // Price
            // if the product is single and there is a price
            if (product.productType == ProductType.single.toString() &&
                product.salePrice > 0)
              Text(
                '\$${product.price}',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .apply(decoration: TextDecoration.lineThrough),
              ),

            // Space
            const SizedBox(
              width: CSizes.spaceBtwItems,
            ),

            HomeProductPriceText(
              price: UPricingCalculator.calculateSalePrice(product).toString(),
              isLarge: true,
              lineThrough: false,
            ),
          ],
        ),

        const SizedBox(
          height: CSizes.spaceBtwItems / 1.5,
        ),
        // title
        CustomProductTitleText(title: product.title),

        const SizedBox(
          height: CSizes.spaceBtwItems / 1.5,
        ),

        // stock status
        Row(
          children: [
            CustomProductTitleText(
              title: "Status",
            ),
            const SizedBox(
              width: CSizes.spaceBtwItems,
            ),
            Text(
              controller.getProductStockStatus(product.stock),
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),

        const SizedBox(
          height: CSizes.spaceBtwItems / 1.5,
        ),

        // brand
        Row(
          children: [
            CustomCircularImage(
              image: product.brand?.image ?? CImages.defaultLogo,
              width: 32,
              height: 32,
              overlayColor: dark ? CColors.white : CColors.black,
            ),
            CustomBrandTitleTextWithVerifiedIcon(
              title: product.brand?.name ?? '',
              brandTextSizes: TextSizes.medium,
            ),
          ],
        )
      ],
    );
  }
}
