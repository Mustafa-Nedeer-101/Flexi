import 'package:flexi/features/authentication/controllers/login/login_controller.dart';
import 'package:flexi/utils/constants/texts.dart';
import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          LoginController.instance.login();
        },
        child: const Text(CTexts.signIn),
      ),
    );
  }
}
