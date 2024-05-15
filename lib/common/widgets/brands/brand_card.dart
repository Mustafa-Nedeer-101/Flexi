import 'package:flexi/common/widgets/brands/brand_products.dart';
import 'package:flexi/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flexi/common/widgets/images/circular_image.dart';
import 'package:flexi/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:flexi/features/shop/models/brand_model.dart';
import 'package:flexi/utils/constants/colors.dart';
import 'package:flexi/utils/constants/enums.dart';
import 'package:flexi/utils/constants/sizes.dart';
import 'package:flexi/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBrandCard extends StatelessWidget {
  const CustomBrandCard(
      {super.key,
      this.onTap,
      this.padding = const EdgeInsets.all(CSizes.sm),
      this.showBorder = true,
      this.backgroundColor = Colors.transparent,
      required this.brand});

  final BrandModel brand;
  final void Function()? onTap;
  final EdgeInsetsGeometry? padding;
  final bool showBorder;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Get.to(
            () => BrandProductsScreen(
              title: "${brand.name}'s Popular Products",
              brand: brand,
            ),
          );
        },
        child: CustomRoundedContainer(
          padding: padding,
          showBorder: showBorder,
          backgroundColor: backgroundColor,
          child: Row(children: [
            // Icon
            Flexible(
              child: CustomCircularImage(
                isNetworkImage: true,
                image: brand.image,
                backgroundColor: Colors.transparent,
                overlayColor: UHelperFunctions.isDarkMode(context)
                    ? CColors.white
                    : CColors.black,
              ),
            ),

            // Space
            const SizedBox(
              width: CSizes.spaceBtwItems / 2,
            ),

            // Text
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomBrandTitleTextWithVerifiedIcon(
                    title: brand.name,
                    brandTextSizes: TextSizes.large,
                  ),
                  Text(
                    '${brand.productsCount ?? 0} Products',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ),
          ]),
        ));
  }
}
