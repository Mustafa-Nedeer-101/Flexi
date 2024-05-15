import 'package:flexi/features/authentication/screens/login/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  // All Variables
  final RxInt numberOfPages = 3.obs;
  RxInt currentPageIndex = 0.obs;
  PageController pageController = PageController();

  // The Next Button
  void nextPage() {
    if (currentPageIndex.value == numberOfPages.value - 1) {
      // Jump to Login page
      Get.offAll(const Login());
    } else {
      currentPageIndex.value = currentPageIndex.value + 1;
      pageController.animateToPage(currentPageIndex.value,
          duration: const Duration(milliseconds: 600), curve: Curves.ease);
    }
  }

  // When Specific Dot Called
  void goToPage(index) {
    currentPageIndex.value = index;
    pageController.animateToPage(currentPageIndex.value,
        duration: const Duration(milliseconds: 600), curve: Curves.ease);
  }

  // The Skip Button
  void skipPages() {
    if (currentPageIndex.value == numberOfPages.value - 1) {
      // Jump the Login Page
      Get.offAll(const Login());
    } else {
      currentPageIndex.value = numberOfPages.value - 1;
      pageController.animateToPage(currentPageIndex.value,
          duration: const Duration(milliseconds: 600), curve: Curves.ease);
    }
  }

  // Done by the Scrolling
  void scrollPage(int index) {
    currentPageIndex.value = index;
  }
}
