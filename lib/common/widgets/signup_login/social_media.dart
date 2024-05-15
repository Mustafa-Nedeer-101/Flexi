import 'package:flexi/utils/constants/colors.dart';
import 'package:flexi/utils/constants/image_strings.dart';
import 'package:flexi/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CustomSocialMedia extends StatelessWidget {
  const CustomSocialMedia({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Google
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: CColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
              onPressed: () {},
              icon: const Image(
                width: CSizes.iconMd,
                height: CSizes.iconMd,
                image: AssetImage(CImages.google),
              )),
        ),

        // Space
        const SizedBox(
          width: CSizes.spaceBtwItems,
        ),

        // Facebook
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: CColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
              onPressed: () {},
              icon: const Image(
                width: CSizes.iconMd,
                height: CSizes.iconMd,
                image: AssetImage(CImages.facebook),
              )),
        ),
      ],
    );
  }
}
