import 'package:flexi/common/widgets/images/circular_image.dart';
import 'package:flexi/utils/constants/colors.dart';
import 'package:flexi/utils/constants/sizes.dart';
import 'package:flexi/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CustomVerticalImageText extends StatelessWidget {
  const CustomVerticalImageText(
      {super.key,
      required this.image,
      required this.title,
      this.textColor = CColors.white,
      this.backGroundColor = CColors.white,
      this.onTap,
      this.isNetworkImage = false});

  final String image, title;
  final Color textColor;
  final bool isNetworkImage;
  final Color? backGroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    //bool dark = UHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: CSizes.spaceBtwItems),
        child: Column(
          children: [
            // Icon
            CustomCircularImage(
              image: image,
              fit: BoxFit.fitWidth,
              padding: CSizes.sm * 1.4,
              isNetworkImage: isNetworkImage,
              backgroundColor: backGroundColor,
              overlayColor: UHelperFunctions.isDarkMode(context)
                  ? CColors.light
                  : CColors.dark,
            ),

            // Space
            const SizedBox(
              height: CSizes.spaceBtwItems / 2,
            ),

            // Text
            SizedBox(
              width: 55,
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: textColor),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
