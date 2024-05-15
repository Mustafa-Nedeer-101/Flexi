import 'package:firebase_auth/firebase_auth.dart';
import 'package:flexi/common/widgets/loaders/loaders.dart';
import 'package:flexi/data/repositories/authentication/authentication_repo.dart';
import 'package:flexi/data/repositories/user/user_repo.dart';
import 'package:flexi/features/authentication/screens/sign_up/verify_email.dart';
import 'package:flexi/features/personalization/models/user_model.dart';
import 'package:flexi/utils/constants/image_strings.dart';
import 'package:flexi/utils/controllers/network_manager.dart';
import 'package:flexi/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  // Variables
  RxBool hidePassword = true.obs;
  RxBool privacyPolicy = false.obs;
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController userName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  // Signup
  Future<void> signup() async {
    try {
      // Start Loading
      UFullSreenLoader.openLoadingDialog(
          'We are processing your information...', CImages.loading);

      //Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // show warning
        CustomLoaders.warningSnackbar(
            title: 'No Internet Connection',
            message: 'Please check your internet connection and try again');
        UFullSreenLoader.stopLoading();
        return;
      }

      //Form Validation
      if (!signupFormKey.currentState!.validate()) {
        UFullSreenLoader.stopLoading();
        return;
      }

      //Privacy Policy check
      if (!privacyPolicy.value) {
        CustomLoaders.warningSnackbar(
            title: 'Accept Privacy Plicy',
            message:
                'In order to create an acount, you have to accept privacy policy & terms of use.');

        UFullSreenLoader.stopLoading();
        return;
      }

      //Register User
      UserCredential userCredential = await AuthenticationRepo.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      //Save User Data => No need to call user controller
      final userRepo = Get.put(UserRepo());
      final newUser = UserModel(
          id: userCredential.user!.uid,
          username: userName.text.trim(),
          email: email.text.trim(),
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: '');
      await userRepo.saveUserRecord(newUser);

      //Remove Loader
      UFullSreenLoader.stopLoading();

      // Show Success Message
      CustomLoaders.successSnackbar(
          title: 'Congratulations',
          message: 'Your account has been created! Verify email to continue.');

      // Move To Verify Email Screen
      Get.to(VerifyEmail(
        email: email.text.trim(),
      ));
    } catch (e) {
      // Remove Loader
      UFullSreenLoader.stopLoading();

      // Show Some Generic Error To The User
      CustomLoaders.errorSnackbar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
