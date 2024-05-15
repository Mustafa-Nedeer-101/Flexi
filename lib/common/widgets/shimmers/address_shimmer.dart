import 'package:flexi/common/widgets/shimmers/shimmer.dart';
import 'package:flexi/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CustomAddressShimmer extends StatelessWidget {
  const CustomAddressShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomShimmerEffect(width: 100, height: 15),
                SizedBox(
                  height: CSizes.spaceBtwItems / 2,
                ),
                CustomShimmerEffect(width: 120, height: 12),
                SizedBox(
                  height: CSizes.spaceBtwItems / 2,
                ),
                CustomShimmerEffect(width: 160, height: 12),
              ],
            )
          ],
        )
      ],
    );
  }
}
