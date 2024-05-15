import 'package:firebase_auth/firebase_auth.dart';
import 'package:flexi/common/widgets/loaders/loaders.dart';
import 'package:flexi/data/repositories/authentication/authentication_repo.dart';
import 'package:flexi/data/repositories/user/user_repo.dart';
import 'package:flexi/features/authentication/screens/login/login.dart';
import 'package:flexi/features/personalization/models/user_model.dart';
import 'package:flexi/features/personalization/screens/profile/widgets/re_authenticate/re_authenticate.dart';
import 'package:flexi/utils/constants/image_strings.dart';
import 'package:flexi/utils/constants/sizes.dart';
import 'package:flexi/utils/controllers/network_manager.dart';
import 'package:flexi/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  Rx<UserModel> user = UserModel.empty().obs;
  final UserRepo userRepo = Get.put(UserRepo());
  RxBool hidePassword = true.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final reAuthFormKey = GlobalKey<FormState>();

  // Profile Image
  final RxBool imageUploading = false.obs;

  @override
  onInit() {
    super.onInit();
    fetchUserRecord();
  }

  Future<void> reAuthenticateUser() async {
    try {
      // Start Loading
      UFullSreenLoader.openLoadingDialog('Processing...', CImages.loading);

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

      // Validate
      if (!reAuthFormKey.currentState!.validate()) {
        UFullSreenLoader.stopLoading();
        return;
      }

      // ReAuthenticate
      final auth = AuthenticationRepo.instance;
      await auth.reAuthenticateWithEmailAndPassword(
          verifyEmail.text.trim(), verifyPassword.text.trim());

      // Delete Account
      await auth.deleteAccount();

      UFullSreenLoader.stopLoading();
      Get.offAll(() => const Login());
    } catch (e) {
      // Remove Loader
      UFullSreenLoader.stopLoading();

      // Show Some Generic Error To The User
      CustomLoaders.errorSnackbar(title: 'Oh Snap!', message: e.toString());
    }
  }

  Future<void> deleteUserAccount() async {
    try {
      // Start Loading
      UFullSreenLoader.openLoadingDialog('Processing...', CImages.loading);

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

      // re-authenticate user
      final auth = AuthenticationRepo.instance;
      final provider =
          auth.instanceUser!.providerData.map((e) => e.providerId).first;

      if (provider.isNotEmpty) {
        // Re verify email
        if (provider == 'google.com') {
          await auth.signinWithGoogle();
          await auth.deleteAccount();
          UFullSreenLoader.stopLoading();
          Get.offAll(() => const Login());
        } else if (provider == 'password') {
          UFullSreenLoader.stopLoading();
          Get.to(() => const ReAuthLoginForm());
        }
      }
      return;
    } catch (e) {
      // Remove Loader
      UFullSreenLoader.stopLoading();

      // Show Some Generic Error To The User
      CustomLoaders.errorSnackbar(title: 'Oh Snap!', message: e.toString());
    }
  }

  Future<void> deleteAccountWarningPopup() async {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(CSizes.md),
      title: 'Delete Account',
      middleText:
          'Are you sure you want to delete your account permanently? This action is not reversible and all of your data will be removed permanently.',

      // Confirm Action
      confirm: ElevatedButton(
          onPressed: () {
            Navigator.of(Get.overlayContext!).pop();
            deleteUserAccount();
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: CSizes.lg,
            ),
            child: Text("Delete"),
          )),

      // Cancel Action
      cancel: OutlinedButton(
          onPressed: () => Navigator.of(Get.overlayContext!).pop(),
          child: const Text('Cancel')),
    );
  }

  Future<void> fetchUserRecord() async {
    try {
      final user = await userRepo.fetchUserRecord();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    }
  }

  // Save user Record from any Registration provider
  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      // Refresh User Record to see if user already stored
      if (user.value.id.isEmpty) {
        if (userCredential != null) {
          // convert name to first and last name
          final nameParts =
              UserModel.nameParts(userCredential.user!.displayName ?? '');

          final username = UserModel.generateUsername(
              userCredential.user!.displayName ?? '');

          // Map Data
          final user = UserModel(
              id: userCredential.user!.uid,
              username: username,
              email: userCredential.user!.email ?? '',
              firstName: nameParts[0],
              lastName:
                  nameParts.length > 1 ? nameParts.sublist(1).join('') : '',
              phoneNumber: userCredential.user!.phoneNumber ?? '',
              profilePicture: userCredential.user!.photoURL ?? '');

          // Save user data
          await userRepo.saveUserRecord(user);
        }
      }
    } catch (e) {
      // Show Some Generic Error To The User
      CustomLoaders.warningSnackbar(
          title: 'Data not saved',
          message:
              'Something went wrong while saving your information. You can re-save your data in your profile.');
    }
  }

  // Function to upload user profile picture
  uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 70,
          maxHeight: 512,
          maxWidth: 512);

      if (image != null) {
        // Image is now uploading
        imageUploading.value = true;

        // Upload Image
        final imageUrl =
            await userRepo.uploadImage('Users/Images/Profile/', image);

        // Update User Image Record
        Map<String, dynamic> json = {'ProfilePicture': imageUrl};
        await userRepo.updateUserRecordField(json);

        // Update user localy
        user.value.profilePicture = imageUrl;
        user.refresh();

        // Success message
        CustomLoaders.successSnackbar(
            title: 'Goodness', message: 'Your profile image has been updated!');
      }
    } catch (e) {
      CustomLoaders.errorSnackbar(
          title: 'Oh Snap', message: 'Something went wrong: $e');
    } finally {
      // Image Uploaded
      imageUploading.value = false;
    }
  }
}
