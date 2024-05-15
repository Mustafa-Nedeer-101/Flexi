import 'package:flexi/utils/constants/image_strings.dart';
import 'package:flexi/utils/constants/sizes.dart';
import 'package:flexi/utils/constants/texts.dart';
import 'package:flexi/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    bool dark = UHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
            height: 140,
            image:
                AssetImage(dark ? CImages.lightAppLogo : CImages.darkAppLogo)),
        Text(
          CTexts.loginTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(
          height: CSizes.sm,
        ),
        Text(
          CTexts.loginSubTitle,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
