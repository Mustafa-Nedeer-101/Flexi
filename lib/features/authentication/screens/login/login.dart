import 'package:flexi/common/styles/spacing_styles.dart';
import 'package:flexi/common/widgets/signup_login/divider.dart';
import 'package:flexi/features/authentication/controllers/login/login_controller.dart';
import 'package:flexi/features/authentication/screens/login/widgets/form_section.dart';
import 'package:flexi/features/authentication/screens/login/widgets/header_section.dart';
import 'package:flexi/features/authentication/screens/login/widgets/social_media.dart';
import 'package:flexi/utils/constants/sizes.dart';
import 'package:flexi/utils/constants/texts.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final controller = Get.put(LoginController());

    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: CSpacingStyles.paddingWithAppBarHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              HeaderSection(),

              // From Section
              FormSection(),

              // Divider
              CustomDivider(
                dividerText: CTexts.orSignInWith,
              ),

              SizedBox(
                height: CSizes.spaceBtwSections,
              ),

              // Social Media
              CustomSocialMedia(),
            ],
          ),
        ),
      ),
    );
  }
}
