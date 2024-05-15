import 'package:flexi/utils/constants/colors.dart';
import 'package:flexi/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CustomLoaders {
  static hideSnackbar() =>
      ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();

  static customToast({required message}) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
      elevation: 0,
      duration: const Duration(
        seconds: 2,
      ),
      backgroundColor: Colors.transparent,
      content: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: UHelperFunctions.isDarkMode(Get.context!)
                ? CColors.darkerGrey.withOpacity(0.9)
                : CColors.grey.withOpacity(0.9)),
        child: Center(
          child: Text(
            message,
            style: Theme.of(Get.context!).textTheme.labelLarge,
          ),
        ),
      ),
    ));
  }

  static successSnackbar({required title, message = '', duration = 3}) {
    Get.snackbar(title, message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: CColors.white,
        backgroundColor: CColors.primary,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: duration),
        margin: const EdgeInsets.all(10),
        icon: const Icon(
          Iconsax.check,
          color: CColors.white,
        ));
  }

  static warningSnackbar({required title, message = ''}) {
    Get.snackbar(title, message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: CColors.white,
        backgroundColor: CColors.warning,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(20),
        icon: const Icon(
          Iconsax.warning_2,
          color: CColors.white,
        ));
  }

  static errorSnackbar({required title, message = ''}) {
    Get.snackbar(title, message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: CColors.white,
        backgroundColor: CColors.error,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 4),
        margin: const EdgeInsets.all(20),
        icon: const Icon(
          Iconsax.warning_2,
          color: CColors.white,
        ));
  }
}
