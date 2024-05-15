import 'package:flexi/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:flexi/features/authentication/screens/onboarding/widgets/image_column.dart';
import 'package:flexi/features/authentication/screens/onboarding/widgets/next_button.dart';
import 'package:flexi/features/authentication/screens/onboarding/widgets/skip_button.dart';
import 'package:flexi/features/authentication/screens/onboarding/widgets/smooth_indicator.dart';
import 'package:flexi/utils/constants/image_strings.dart';
import 'package:flexi/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingController());
    OnBoardingController controller = OnBoardingController.instance;
    return Scaffold(
      body: Stack(
        children: [
          // Scrollable Page View
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.scrollPage,
            children: const [
              ImageColumn(
                  imageString: CImages.onBoardingImageOne,
                  title: CTexts.onBoardingTitle1,
                  subTitle: CTexts.onBoardingSubTitle1),
              ImageColumn(
                  imageString: CImages.onBoardingImageTwo,
                  title: CTexts.onBoardingTitle2,
                  subTitle: CTexts.onBoardingsubTitle2),
              ImageColumn(
                  imageString: CImages.onBoardingImageThree,
                  title: CTexts.onBoardingTitle3,
                  subTitle: CTexts.onBoardingSubTitle3),
            ],
          ),

          // Skip Button
          const SkipButton(),

          // Dot Navigation SmoothPageIndicator
          const SmoothIndicator(),

          // Next Button
          const NextButton(),
        ],
      ),
    );
  }
}
