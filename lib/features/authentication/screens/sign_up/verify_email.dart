import 'package:flexi/common/widgets/succes_screen/success_screen.dart';
import 'package:flexi/data/repositories/authentication/authentication_repo.dart';
import 'package:flexi/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:flexi/utils/constants/image_strings.dart';
import 'package:flexi/utils/constants/sizes.dart';
import 'package:flexi/utils/constants/texts.dart';
import 'package:flexi/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmail extends StatelessWidget {
  const VerifyEmail({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final controller = Get.put(VerifyEmailController());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                AuthenticationRepo.instance.logout(); // Will Get Modified
              },
              icon: const Icon(CupertinoIcons.clear)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: Column(
            children: [
              // Image
              Image(
                width: UHelperFunctions.screenWidth() * 0.6,
                image: const AssetImage(CImages.verigyEmail),
              ),

              // Space
              const SizedBox(
                height: CSizes.spaceBtwSections,
              ),

              // Title and Subtitle
              Text(
                CTexts.confirmEmailTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),

              // Space
              const SizedBox(
                height: CSizes.spaceBtwItems,
              ),

              // Email ==> Backend
              Text(
                email ?? '',
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),

              // Space
              const SizedBox(
                height: CSizes.spaceBtwItems,
              ),

              // SubTitle
              Text(
                CTexts.confirmEmailSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),

              // Space
              const SizedBox(
                height: CSizes.spaceBtwSections,
              ),

              // Buttons

              // Continue Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => CustomSuccessScreen(
                            image: CImages.success,
                            title: CTexts.yourAccountCreatedTitle,
                            subTitle: CTexts.yourAccountCreatedSubTitle,
                            onPressed: () {
                              controller.checkEmailVerificationStatus();
                            },
                          ));
                    },
                    child: const Text(CTexts.continueButton)),
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
                      controller.sendVerificationEmail();
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
