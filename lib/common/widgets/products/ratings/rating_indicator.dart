import 'package:flexi/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';

class CustomRatingIndicator extends StatelessWidget {
  const CustomRatingIndicator(
      {super.key, required this.rating, this.itemSize = 20});

  final double rating;
  final double itemSize;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rating,
      itemSize: itemSize,
      unratedColor: CColors.grey,
      itemBuilder: (context, index) => const Icon(
        Iconsax.star1,
        color: CColors.primary,
      ),
    );
  }
}
