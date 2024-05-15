import 'package:flexi/features/authentication/controllers/login/login_controller.dart';
import 'package:flexi/features/authentication/screens/password_configuration/forgot_password.dart';
import 'package:flexi/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RememberForgot extends StatelessWidget {
  const RememberForgot({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.find();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Obx(() => Checkbox(
                value: controller.rememberMe.value,
                onChanged: (val) {
                  controller.rememberMe.value = !controller.rememberMe.value;
                })),
            const Text(CTexts.rememberMe)
          ],
        ),
        TextButton(
            onPressed: () {
              Get.to(() => const ForgotPassword());
            },
            child: const Text(CTexts.forgotPassword)),
      ],
    );
  }
}
