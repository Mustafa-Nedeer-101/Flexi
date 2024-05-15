import 'package:cached_network_image/cached_network_image.dart';
import 'package:flexi/common/widgets/brands/brand_card.dart';
import 'package:flexi/common/widgets/brands/brand_products.dart';
import 'package:flexi/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flexi/common/widgets/shimmers/shimmer.dart';
import 'package:flexi/features/shop/models/brand_model.dart';
import 'package:flexi/utils/constants/colors.dart';
import 'package:flexi/utils/constants/sizes.dart';
import 'package:flexi/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBrandShowCase extends StatelessWidget {
  const CustomBrandShowCase(
      {super.key, required this.images, required this.brand});

  final BrandModel brand;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(BrandProductsScreen(brand: brand)),
      child: CustomRoundedContainer(
        showBorder: true,
        borderColor: CColors.darkGrey,
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.all(CSizes.md),
        margin: const EdgeInsets.only(bottom: CSizes.spaceBtwItems),
        child: Column(
          children: [
            // Brand with Product Count
            CustomBrandCard(
              brand: brand,
              showBorder: false,
            ),

            // Brand Tab 3 Product Images
            Row(
              children: images
                  .map((e) => brandToProductImageWidget(e, context))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

Widget brandToProductImageWidget(String image, BuildContext context) {
  return Expanded(
    child: CustomRoundedContainer(
      height: 150,
      backgroundColor: UHelperFunctions.isDarkMode(context)
          ? CColors.darkerGrey
          : CColors.light,
      margin: const EdgeInsets.only(right: CSizes.sm),
      padding: const EdgeInsets.all(CSizes.md),
      child: CachedNetworkImage(
        fit: BoxFit.contain,
        imageUrl: image,
        progressIndicatorBuilder: (context, url, progress) =>
            const CustomShimmerEffect(width: 100, height: 10),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    ),
  );
}
