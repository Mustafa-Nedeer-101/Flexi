import 'package:flexi/features/authentication/controllers/signup/signup_controller.dart';
import 'package:flexi/features/authentication/screens/sign_up/widgets/terms_and_conditions_checkbox.dart';
import 'package:flexi/utils/constants/sizes.dart';
import 'package:flexi/utils/constants/texts.dart';
import 'package:flexi/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    SignupController controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          Row(
            children: [
              // Firs Name
              Expanded(
                child: TextFormField(
                  expands: false,
                  validator: UValidator.validateFirstName,
                  controller: controller.firstName,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    labelText: CTexts.firstName,
                  ),
                ),
              ),

              // Space
              const SizedBox(
                width: CSizes.spaceBtwInputFields,
              ),

              // Last Name
              Expanded(
                child: TextFormField(
                  expands: false,
                  validator: UValidator.validateLastName,
                  controller: controller.lastName,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    labelText: CTexts.lastName,
                  ),
                ),
              ),
            ],
          ),

          // Space Between
          const SizedBox(
            height: CSizes.spaceBtwInputFields,
          ),

          // User Name
          TextFormField(
            expands: false,
            controller: controller.userName,
            validator: UValidator.validateUsername,
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.user_edit),
              labelText: CTexts.username,
            ),
          ),

          // Space Between Input Fields
          const SizedBox(
            height: CSizes.spaceBtwInputFields,
          ),

          // Email
          TextFormField(
            controller: controller.email,
            validator: UValidator.validateEmail,
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.direct),
              labelText: CTexts.email,
            ),
          ),

          // Space Between Input Fields
          const SizedBox(
            height: CSizes.spaceBtwInputFields,
          ),

          // Phone Number
          TextFormField(
            controller: controller.phoneNumber,
            validator: UValidator.validatePhoneNumber,
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.call),
              labelText: CTexts.phoneNumber,
            ),
          ),

          // Space Between Input Fields
          const SizedBox(
            height: CSizes.spaceBtwInputFields,
          ),

          // password
          Obx(
            () => TextFormField(
              obscureText: controller.hidePassword.value,
              controller: controller.password,
              validator: UValidator.validatePassword,
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

          // Space
          const SizedBox(
            height: CSizes.spaceBtwSections,
          ),

          // Terms and Conditions
          const TermsAndConditionsCheckbox(),

          const SizedBox(
            height: CSizes.spaceBtwSections,
          ),

          // Sign Up Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {
                  controller.signup();
                },
                child: const Text(CTexts.createAccount)),
          ),
        ],
      ),
    );
  }
}
