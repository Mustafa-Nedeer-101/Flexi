import 'package:flexi/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:flexi/utils/constants/colors.dart';
import 'package:flexi/utils/constants/sizes.dart';
import 'package:flexi/utils/device/device_utility.dart';
import 'package:flexi/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SmoothIndicator extends StatelessWidget {
  const SmoothIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    OnBoardingController controller = OnBoardingController.instance;
    final bool dark = UHelperFunctions.isDarkMode(context);
    return Positioned(
      bottom: UDeviceUtils.getBottomNavigationBarHeight() + 25,
      left: CSizes.defaultSpace,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        onDotClicked: controller.goToPage,
        count: 3,
        effect: ExpandingDotsEffect(
            activeDotColor: dark ? CColors.light : CColors.dark, dotHeight: 6),
      ),
    );
  }
}
