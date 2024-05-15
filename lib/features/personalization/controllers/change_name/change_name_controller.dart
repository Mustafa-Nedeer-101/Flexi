import 'package:flexi/common/widgets/loaders/loaders.dart';
import 'package:flexi/data/repositories/user/user_repo.dart';
import 'package:flexi/features/personalization/controllers/user_controller.dart';
import 'package:flexi/utils/constants/image_strings.dart';
import 'package:flexi/utils/controllers/network_manager.dart';
import 'package:flexi/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeNameController extends GetxController {
  static ChangeNameController get instance => Get.find();

  // variable
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  GlobalKey<FormState> saveFormKey = GlobalKey<FormState>();

  final userController = UserController.instance;
  final userRepo = UserRepo.instance;

  @override
  onInit() {
    initializeNames();

    super.onInit();
  }

  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  // Google Login
  Future<void> saveNewName() async {
    try {
      // Start Loading
      UFullSreenLoader.openLoadingDialog(
          'Updating your data...', CImages.loading);

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

      // Validation
      if (!saveFormKey.currentState!.validate()) {
        // Remove Loader
        UFullSreenLoader.stopLoading();

        return;
      }

      // Save Changes in Firestore
      await userRepo.updateUserRecordField({
        'FirstName': firstName.text.trim(),
        'LastName': lastName.text.trim()
      });

      // Update Rx user value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      //Remove Loader
      UFullSreenLoader.stopLoading();

      CustomLoaders.successSnackbar(
          title: 'Done', message: 'Your name has been updated.');

      Get.back();
    } catch (e) {
      // Remove Loader
      UFullSreenLoader.stopLoading();

      // Show Some Generic Error To The User
      CustomLoaders.errorSnackbar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
