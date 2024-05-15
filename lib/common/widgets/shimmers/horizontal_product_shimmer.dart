import 'package:flexi/common/widgets/shimmers/shimmer.dart';
import 'package:flexi/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CustomHorizontalProductShimmer extends StatelessWidget {
  const CustomHorizontalProductShimmer({super.key, this.itemCount = 4});

  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: CSizes.spaceBtwSections),
      height: 120,
      child: ListView.separated(
        itemCount: itemCount,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(
          width: CSizes.spaceBtwItems,
        ),
        itemBuilder: (context, index) => const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Image
            CustomShimmerEffect(width: 120, height: 120),
            SizedBox(
              width: CSizes.spaceBtwItems,
            ),

            // Text
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: CSizes.spaceBtwItems / 2,
                ),
                CustomShimmerEffect(width: 160, height: 15),
                SizedBox(
                  height: CSizes.spaceBtwItems / 2,
                ),
                CustomShimmerEffect(width: 110, height: 15),
                SizedBox(
                  height: CSizes.spaceBtwItems / 2,
                ),
                CustomShimmerEffect(width: 80, height: 15),
                Spacer()
              ],
            )
          ],
        ),
      ),
    );
  }
}
