import 'package:flexi/common/widgets/loaders/loaders.dart';
import 'package:flexi/data/repositories/authentication/authentication_repo.dart';
import 'package:flexi/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:flexi/utils/constants/image_strings.dart';
import 'package:flexi/utils/controllers/network_manager.dart';
import 'package:flexi/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  static ForgotPasswordController get instance => Get.find();

  // Variables
  final TextEditingController email = TextEditingController();
  final GlobalKey<FormState> forgotPasswordFormKey = GlobalKey<FormState>();

  Future<void> sendPasswordResetEmail() async {
    try {
      // Show Loader
      UFullSreenLoader.openLoadingDialog(
          'Sending you password reset link...', CImages.loading);

      // Check connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader
        UFullSreenLoader.stopLoading();

        // show warning
        CustomLoaders.warningSnackbar(
            title: 'No Internet Connection',
            message: 'Please check your internet connection and try again');

        return;
      }

      // Validation
      if (!forgotPasswordFormKey.currentState!.validate()) {
        // Remove Loader
        UFullSreenLoader.stopLoading();

        return;
      }

      // Send password reset email
      AuthenticationRepo.instance.sendPasswordResetEmail(email.text.trim());

      //Remove Loader
      UFullSreenLoader.stopLoading();

      // Show Success Message
      CustomLoaders.successSnackbar(
          title: 'Alright',
          message:
              'We just sent you the password reset email, Please check your inbox');

      // Move to Submitting Page
      Get.to(() => const ResetPassword());
    } catch (e) {
      // Remove Loader
      UFullSreenLoader.stopLoading();

      // show error
      CustomLoaders.errorSnackbar(title: 'Oh snap!', message: e.toString());
    }
  }

  // Resend Email
  Future<void> resendPasswordResetEmail() async {
    try {
      // Check connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // show warning
        CustomLoaders.warningSnackbar(
            title: 'No Internet Connection',
            message: 'Please check your internet connection and try again');

        return;
      }

      // Send password reset email
      AuthenticationRepo.instance.sendPasswordResetEmail(email.text.trim());

      // Show Success Message
      CustomLoaders.successSnackbar(
          title: 'Alright',
          message:
              'We just resent you the password reset email, Please check your inbox');
    } catch (e) {
      // show error
      CustomLoaders.errorSnackbar(title: 'Oh snap!', message: e.toString());
    }
  }
}
