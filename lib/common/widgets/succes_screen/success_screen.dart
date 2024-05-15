import 'package:flexi/common/styles/spacing_styles.dart';
import 'package:flexi/utils/constants/sizes.dart';
import 'package:flexi/utils/constants/texts.dart';
import 'package:flexi/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CustomSuccessScreen extends StatelessWidget {
  const CustomSuccessScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.subTitle,
      required this.onPressed});

  final String image, title, subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: CSpacingStyles.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              // Image
              Image(
                width: UHelperFunctions.screenWidth() * 0.6,
                image: AssetImage(image),
              ),

              // Space
              const SizedBox(
                height: CSizes.spaceBtwSections,
              ),

              // Title SubTitle
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(
                height: CSizes.spaceBtwItems,
              ),

              // SubTitle
              Text(
                subTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),

              // Space
              const SizedBox(
                height: CSizes.spaceBtwSections,
              ),

              // Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: onPressed,
                    child: const Text(CTexts.continueButton)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
