import 'package:flexi/utils/constants/sizes.dart';
import 'package:flexi/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class ImageColumn extends StatelessWidget {
  final String imageString;
  final String title;
  final String subTitle;

  const ImageColumn(
      {super.key,
      required this.imageString,
      required this.title,
      required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(CSizes.defaultSpace),
      child: Column(
        children: [
          // Image
          Image(
              width: UHelperFunctions.screenWidth() * 0.8,
              height: UHelperFunctions.screenHeight() * 0.6,
              image: AssetImage(imageString)),

          // Title
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),

          // Space Between
          const SizedBox(
            height: CSizes.spaceBtwItems,
          ),

          // Subtitle
          Text(
            subTitle,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
