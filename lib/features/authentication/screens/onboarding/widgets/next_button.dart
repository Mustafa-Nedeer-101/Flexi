import 'package:flexi/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:flexi/utils/constants/colors.dart';
import 'package:flexi/utils/constants/sizes.dart';
import 'package:flexi/utils/device/device_utility.dart';
import 'package:flexi/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key});

  @override
  Widget build(BuildContext context) {
    // Find and Dark Mode
    OnBoardingController controller = OnBoardingController.instance;
    final bool dark = UHelperFunctions.isDarkMode(context);

    return Positioned(
      bottom: UDeviceUtils.getBottomNavigationBarHeight(),
      right: CSizes.defaultSpace,
      child: ElevatedButton(
        onPressed: () {
          controller.nextPage();
        },
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: dark ? CColors.primary : CColors.dark,
        ),
        child: const Icon(
          Iconsax.arrow_right_3,
          color: CColors.white,
        ),
      ),
    );
  }
}
