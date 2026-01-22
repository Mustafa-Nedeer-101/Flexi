import 'package:flexi/common/widgets/loaders/animation_loader.dart';
import 'package:flexi/utils/constants/colors.dart';
import 'package:flexi/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UFullScreenLoader {
  // Open Loading Dialog
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (context) {
        final dark = UHelperFunctions.isDarkMode(Get.context!);
        return PopScope(
          canPop: false,
          child: Container(
            color: dark ? CColors.dark : CColors.white,
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                // AnimatedLoaderWidget
                Flexible(
                    child: CustomAnimationLoaderWidget(
                  text: text,
                  animation: animation,
                ))
              ],
            ),
          ),
        );
      },
    );
  }

  // Stop Loading Dialog
  static void stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
