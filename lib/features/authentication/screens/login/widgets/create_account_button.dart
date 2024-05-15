import 'package:flexi/features/authentication/screens/sign_up/sign_up.dart';
import 'package:flexi/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateAccountButton extends StatelessWidget {
  const CreateAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
          onPressed: () {
            Get.to(
              () => const SignUp(),
            );
          },
          child: const Text(CTexts.createAccount)),
    );
  }
}
