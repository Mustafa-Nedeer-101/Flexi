import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flexi/common/widgets/loaders/loaders.dart';
import 'package:flexi/common/widgets/succes_screen/success_screen.dart';
import 'package:flexi/data/repositories/authentication/authentication_repo.dart';
import 'package:flexi/utils/constants/image_strings.dart';
import 'package:flexi/utils/constants/texts.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  // Send email verification on init
  @override
  void onInit() {
    sendVerificationEmail();
    setTimerForAutoRedirect();
    super.onInit();
  }

  // Send email verification link
  sendVerificationEmail() async {
    try {
      await AuthenticationRepo.instance.sendEmailVerification();
      CustomLoaders.successSnackbar(
          title: 'Email Sent',
          message: 'Please check your inbox and verify your email');
    } catch (e) {
      CustomLoaders.errorSnackbar(title: 'Oh Snap!', message: e.toString());
    }
  }

  // timer to automatically redirect on email verification
  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(() => CustomSuccessScreen(
            image: CImages.success,
            title: CTexts.yourAccountCreatedTitle,
            subTitle: CTexts.yourAccountCreatedSubTitle,
            onPressed: () => AuthenticationRepo.instance.screenRedirect()));
      }
    });
  }

  // manually check if email verified
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(() => CustomSuccessScreen(
          image: CImages.success,
          title: CTexts.yourAccountCreatedTitle,
          subTitle: CTexts.yourAccountCreatedSubTitle,
          onPressed: () => AuthenticationRepo.instance.screenRedirect()));
    }
  }
}
