import 'package:flexi/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:flexi/utils/constants/sizes.dart';
import 'package:flexi/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    OnBoardingController controller = OnBoardingController.instance;
    return Positioned(
        top: UDeviceUtils.getAppBarHeight(),
        right: CSizes.defaultSpace,
        child: TextButton(
            onPressed: () {
              controller.skipPages();
            },
            child: const Text("skip")));
  }
}
