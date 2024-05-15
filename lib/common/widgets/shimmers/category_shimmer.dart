import 'package:flexi/common/widgets/shimmers/shimmer.dart';
import 'package:flexi/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CustomCategoryShimmer extends StatelessWidget {
  final int itemCount;

  const CustomCategoryShimmer({
    super.key,
    this.itemCount = 6,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(
          width: CSizes.spaceBtwItems,
        ),
        itemBuilder: (context, index) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image
              CustomShimmerEffect(
                width: 55,
                height: 55,
                radius: 55,
              ),
              SizedBox(
                height: CSizes.spaceBtwItems / 2,
              ),

              // Text
              CustomShimmerEffect(width: 55, height: 8),
            ],
          );
        },
      ),
    );
  }
}
