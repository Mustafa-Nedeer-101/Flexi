import 'package:flexi/common/styles/spacing_styles.dart';
import 'package:flexi/features/authentication/controllers/password_configuration/forgot_password_controller.dart';
import 'package:flexi/features/authentication/screens/login/login.dart';
import 'package:flexi/utils/constants/image_strings.dart';
import 'package:flexi/utils/constants/sizes.dart';
import 'package:flexi/utils/constants/texts.dart';
import 'package:flexi/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: CSpacingStyles.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              // Image
              Image(
                width: UHelperFunctions.screenWidth() * 0.6,
                image: const AssetImage(CImages.emailSent),
              ),

              // Space
              const SizedBox(
                height: CSizes.spaceBtwSections,
              ),

              // Title SubTitle
              Text(
                CTexts.changePasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(
                height: CSizes.spaceBtwItems,
              ),

              // SubTitle
              Text(
                CTexts.changePasswordSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),

              // Space
              const SizedBox(
                height: CSizes.spaceBtwSections,
              ),

              // Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Get.offAll(() => const Login());
                    },
                    child: const Text(CTexts.done)),
              ),

              // Space
              const SizedBox(
                height: CSizes.spaceBtwItems,
              ),

              // Resend Email
              SizedBox(
                width: double.infinity,
                child: TextButton(
                    onPressed: () {
                      ForgotPasswordController.instance
                          .resendPasswordResetEmail();
                    },
                    child: const Text(CTexts.resendEmail)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
