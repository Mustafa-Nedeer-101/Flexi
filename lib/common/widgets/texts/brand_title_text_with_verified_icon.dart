import 'package:flexi/common/widgets/texts/brand_title_text.dart';
import 'package:flexi/utils/constants/colors.dart';
import 'package:flexi/utils/constants/enums.dart';
import 'package:flexi/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CustomBrandTitleTextWithVerifiedIcon extends StatelessWidget {
  const CustomBrandTitleTextWithVerifiedIcon(
      {super.key,
      required this.title,
      this.maxLines = 1,
      this.textColor,
      this.iconColor = CColors.primary,
      this.textAlign = TextAlign.center,
      this.brandTextSizes = TextSizes.small});

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSizes;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
            child: CustomBrandTitleText(
                title: title,
                color: textColor,
                maxLines: maxLines,
                textAlign: textAlign,
                brandTextSizes: brandTextSizes)),
        const SizedBox(
          width: CSizes.xs,
        ),
        Icon(
          Iconsax.verify5,
          color: iconColor,
          size: CSizes.iconXs,
        )
      ],
    );
  }
}
