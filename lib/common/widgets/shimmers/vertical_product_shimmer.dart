import 'package:flexi/common/widgets/layouts/grid_layout.dart';
import 'package:flexi/common/widgets/shimmers/shimmer.dart';
import 'package:flexi/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CustomVerticalProductShimmer extends StatelessWidget {
  const CustomVerticalProductShimmer({super.key, this.itemCount = 4});

  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return CustomGridLayout(
      itemCount: itemCount,
      itemBuilder: (_, __) => const SizedBox(
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            CustomShimmerEffect(width: 180, height: 180),
            SizedBox(
              height: CSizes.spaceBtwItems,
            ),

            // Text
            CustomShimmerEffect(width: 160, height: 15),
            SizedBox(
              height: CSizes.spaceBtwItems / 2,
            ),
            CustomShimmerEffect(width: 110, height: 15),
          ],
        ),
      ),
    );
  }
}
