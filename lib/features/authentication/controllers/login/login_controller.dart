import 'package:firebase_auth/firebase_auth.dart';
import 'package:flexi/common/widgets/loaders/loaders.dart';
import 'package:flexi/data/repositories/authentication/authentication_repo.dart';
import 'package:flexi/features/personalization/controllers/user_controller.dart';
import 'package:flexi/navigation_menu.dart';
import 'package:flexi/utils/constants/image_strings.dart';
import 'package:flexi/utils/controllers/network_manager.dart';
import 'package:flexi/utils/local_storage/sorage_utility.dart';
import 'package:flexi/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final UserController userController = Get.put(UserController());

  // Variables
  RxBool hidePassword = true.obs;
  RxBool rememberMe = false.obs;
  final deviceStorage = GetStorage();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  // onInit
  @override
  void onInit() {
    // If remember user
    if (deviceStorage.read('IS_SECOND_TIME') == true) {
      email.text = deviceStorage.read('REMEMBER_ME_EMAIL');
      password.text = deviceStorage.read('REMEMBER_ME_PASSWORD');
      rememberMe.value = deviceStorage.read('REMEMBER_ME') ?? true;
    }
    super.onInit();
  }

  // Login
  Future<void> login() async {
    try {
      // Start Loading
      UFullScreenLoader.openLoadingDialog('Logging you in...', CImages.loading);

      //Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // show warning
        CustomLoaders.warningSnackbar(
            title: 'No Internet Connection',
            message: 'Please check your internet connection and try again');
        UFullScreenLoader.stopLoading();
        return;
      }

      //Form Validation
      if (!loginFormKey.currentState!.validate()) {
        UFullScreenLoader.stopLoading();
        return;
      }

      //Login User
      await AuthenticationRepo.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Initialize Local Storage
      String uid = FirebaseAuth.instance.currentUser!.uid;
      await ULocalStorage.init(uid);

      // Remember me check
      if (rememberMe.value) {
        await deviceStorage.write(
          'REMEMBER_ME_EMAIL',
          email.text.trim(),
        );
        await deviceStorage.write(
          'REMEMBER_ME_PASSWORD',
          password.text.trim(),
        );
        await deviceStorage.write('IS_SECOND_TIME', true);
        await deviceStorage.write('REMEMBER_ME', true);
      } else {
        await deviceStorage.remove('REMEMBER_ME_EMAIL');
        await deviceStorage.remove('REMEMBER_ME_PASSWORD');
        await deviceStorage.write('REMEMBER_ME', false);
      }

      //Remove Loader
      UFullScreenLoader.stopLoading();

      // Move To Navigation Menu
      FirebaseAuth.instance.currentUser?.emailVerified ?? false
          ? Get.offAll(() => const NavigationMenu())
          : AuthenticationRepo.instance.screenRedirect();
    } catch (e) {
      // Remove Loader
      UFullScreenLoader.stopLoading();

      // Show Some Generic Error To The User
      CustomLoaders.errorSnackbar(title: 'Oh Snap!', message: e.toString());
    }
  }

  // Google Login
  Future<void> googleSignin() async {
    try {
      // Start Loading
      UFullScreenLoader.openLoadingDialog('Logging you in...', CImages.loading);

      //Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // show warning
        CustomLoaders.warningSnackbar(
            title: 'No Internet Connection',
            message: 'Please check your internet connection and try again');
        UFullScreenLoader.stopLoading();
        return;
      }

      // Google Login
      // ignore: unused_local_variable
      UserCredential? userCredential =
          await AuthenticationRepo.instance.signInWithGoogle();

      // Save user record => should call user controller
      await userController.saveUserRecord(userCredential);

      //Remove Loader
      UFullScreenLoader.stopLoading();

      // Move To Navigation Menu
      AuthenticationRepo.instance.screenRedirect();
    } catch (e) {
      // Remove Loader
      UFullScreenLoader.stopLoading();

      // Show Some Generic Error To The User
      CustomLoaders.errorSnackbar(title: 'Oh Snap!', message: e.toString());
    }
  }

  // Forgot password
}
