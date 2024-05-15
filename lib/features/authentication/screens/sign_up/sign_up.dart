import 'package:flexi/common/widgets/signup_login/divider.dart';
import 'package:flexi/common/widgets/signup_login/social_media.dart';
import 'package:flexi/features/authentication/screens/sign_up/widgets/sign_up_form.dart';
import 'package:flexi/utils/constants/sizes.dart';
import 'package:flexi/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(CSizes.defaultSpace),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // title
          Text(
            CTexts.signupTitle,
            style: Theme.of(context).textTheme.headlineMedium,
          ),

          // Space
          const SizedBox(
            height: CSizes.spaceBtwSections,
          ),

          // Form
          const SignUpForm(),

          // Space
          const SizedBox(
            height: CSizes.spaceBtwSections,
          ),

          // Divider
          CustomDivider(dividerText: CTexts.orSignUpWith.capitalize!),

          // Space
          const SizedBox(
            height: CSizes.spaceBtwSections,
          ),

          // Social Media
          const CustomSocialMedia(),
        ]),
      )),
    );
  }
}
