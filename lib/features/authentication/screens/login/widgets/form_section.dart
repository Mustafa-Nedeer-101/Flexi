import 'package:flexi/features/authentication/controllers/login/login_controller.dart';
import 'package:flexi/features/authentication/screens/login/widgets/create_account_button.dart';
import 'package:flexi/features/authentication/screens/login/widgets/remember_forgot.dart';
import 'package:flexi/features/authentication/screens/login/widgets/signin_button.dart';
import 'package:flexi/utils/constants/sizes.dart';
import 'package:flexi/utils/constants/texts.dart';
import 'package:flexi/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class FormSection extends StatelessWidget {
  const FormSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = LoginController.instance;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: CSizes.spaceBtwSections),
      child: Form(
        key: controller.loginFormKey,
        child: Column(
          children: [
            // Email
            TextFormField(
              controller: controller.email,
              validator: UValidator.validateEmail,
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: CTexts.email,
              ),
            ),

            // Space Between
            const SizedBox(
              height: CSizes.spaceBtwInputFields,
            ),

            // Password
            Obx(
              () => TextFormField(
                obscureText: controller.hidePassword.value,
                controller: controller.password,
                validator: (value) =>
                    UValidator.validateEmptyText('Password', value),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                    icon: Icon(controller.hidePassword.value
                        ? Iconsax.eye_slash
                        : Iconsax.eye),
                    onPressed: () => controller.hidePassword.value =
                        !controller.hidePassword.value,
                  ),
                  labelText: CTexts.password,
                ),
              ),
            ),

            const SizedBox(
              height: CSizes.spaceBtwInputFields / 2,
            ),

            // Remember Forgot Row
            const RememberForgot(),

            // Space
            const SizedBox(
              height: CSizes.spaceBtwSections,
            ),

            // SignIn Button
            const SignInButton(),

            const SizedBox(
              height: CSizes.spaceBtwItems,
            ),

            // Create Account
            const CreateAccountButton(),
          ],
        ),
      ),
    );
  }
}
