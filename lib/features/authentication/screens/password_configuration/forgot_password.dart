import 'package:flexi/features/authentication/controllers/password_configuration/forgot_password_controller.dart';
import 'package:flexi/utils/constants/sizes.dart';
import 'package:flexi/utils/constants/texts.dart';
import 'package:flexi/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final ForgotPasswordController controller =
        Get.put(ForgotPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(
            CSizes.defaultSpace,
          ),
          child: Column(children: [
            // Headings
            Text(
              CTexts.forgotPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: CSizes.spaceBtwItems,
            ),
            Text(
              CTexts.forgotPasswordSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
            ),

            // Space
            const SizedBox(
              height: CSizes.spaceBtwSections * 2,
            ),

            Form(
              key: controller.forgotPasswordFormKey,
              child: // TextField
                  TextFormField(
                      controller: controller.email,
                      validator: UValidator.validateEmail,
                      decoration: const InputDecoration(
                        labelText: CTexts.email,
                        suffixIcon: Icon(Iconsax.direct_right),
                      )),
            ),

            // Space
            const SizedBox(
              height: CSizes.spaceBtwSections,
            ),

            // Submit Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    controller.sendPasswordResetEmail();
                  },
                  child: const Text(CTexts.submit)),
            ),
          ]),
        ),
      ),
    );
  }
}
