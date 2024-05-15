import 'package:flexi/features/authentication/controllers/signup/signup_controller.dart';
import 'package:flexi/utils/constants/colors.dart';
import 'package:flexi/utils/constants/sizes.dart';
import 'package:flexi/utils/constants/texts.dart';
import 'package:flexi/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TermsAndConditionsCheckbox extends StatelessWidget {
  const TermsAndConditionsCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    final SignupController controller = Get.find();
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Obx(() => Checkbox(
              value: controller.privacyPolicy.value,
              onChanged: (val) {
                controller.privacyPolicy.value =
                    !controller.privacyPolicy.value;
              })),
        ),

        // Space
        const SizedBox(
          height: CSizes.spaceBtwItems,
        ),

        Text.rich(
          TextSpan(children: [
            TextSpan(
              text: " ${CTexts.iAgreeTo} ",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            TextSpan(
              text: "${CTexts.privacyPolicy} ",
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: dark ? CColors.white : CColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: dark ? CColors.white : CColors.primary,
                  ),
            ),
            TextSpan(
              text: "${CTexts.and} ",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            TextSpan(
              text: "${CTexts.termsOfUse} ",
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: dark ? CColors.white : CColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: dark ? CColors.white : CColors.primary,
                  ),
            ),
          ]),
        ),
      ],
    );
  }
}
