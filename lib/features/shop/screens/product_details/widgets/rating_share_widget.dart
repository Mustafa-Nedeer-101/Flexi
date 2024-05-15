import 'package:flexi/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProductDetailRatingAndShare extends StatelessWidget {
  const ProductDetailRatingAndShare({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Rating
        Row(
          children: [
            const Icon(
              Iconsax.star5,
              color: Colors.amber,
              size: 24,
            ),
            const SizedBox(
              width: CSizes.spaceBtwItems / 2,
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: '3.9 ',
                      style: Theme.of(context).textTheme.bodyLarge),
                  const TextSpan(text: '(261)'),
                ],
              ),
            ),
          ],
        ),

        // Share
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share,
              size: CSizes.iconMd,
            )),
      ],
    );
  }
}
