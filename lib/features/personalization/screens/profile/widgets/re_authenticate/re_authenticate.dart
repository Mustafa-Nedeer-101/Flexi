import 'package:flexi/common/widgets/appbar/appbar.dart';
import 'package:flexi/features/personalization/controllers/user_controller.dart';
import 'package:flexi/utils/constants/sizes.dart';
import 'package:flexi/utils/constants/texts.dart';
import 'package:flexi/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text(
          "Re-Athenticate User",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),

      // Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: Form(
            key: controller.reAuthFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Email
                TextFormField(
                  controller: controller.verifyEmail,
                  validator: UValidator.validateEmail,
                  decoration: const InputDecoration(
                      labelText: CTexts.email,
                      prefixIcon: Icon(Iconsax.direct_right)),
                ),

                const SizedBox(
                  height: CSizes.spaceBtwInputFields,
                ),

                // Password
                Obx(
                  () => TextFormField(
                    obscureText: controller.hidePassword.value,
                    controller: controller.verifyPassword,
                    validator: UValidator.validatePassword,
                    decoration: InputDecoration(
                        labelText: CTexts.password,
                        prefixIcon: const Icon(Iconsax.password_check),
                        suffixIcon: IconButton(
                            onPressed: () {
                              controller.hidePassword.value =
                                  !controller.hidePassword.value;
                            },
                            icon: Icon(controller.hidePassword.value
                                ? Iconsax.eye_slash
                                : Iconsax.eye))),
                  ),
                ),

                const SizedBox(
                  height: CSizes.spaceBtwSections,
                ),

                // Save Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => controller.reAuthenticateUser(),
                    child: const Text("Submit"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
