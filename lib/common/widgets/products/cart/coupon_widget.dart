import 'package:flexi/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flexi/utils/constants/colors.dart';
import 'package:flexi/utils/constants/sizes.dart';
import 'package:flexi/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CustomCouponCode extends StatelessWidget {
  const CustomCouponCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool dark = UHelperFunctions.isDarkMode(context);
    return CustomRoundedContainer(
      showBorder: true,
      backgroundColor: dark ? CColors.dark : CColors.white,
      padding: const EdgeInsets.only(
          top: CSizes.sm, bottom: CSizes.sm, right: CSizes.sm, left: CSizes.md),
      child: Row(children: [
        Flexible(
          child: TextFormField(
            decoration: const InputDecoration(
              hintText: 'Have a Promo code? Enter here',
              focusedBorder: InputBorder.none,
              border: InputBorder.none,
              disabledBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
            ),
          ),
        ),
        SizedBox(
            width: 80,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: dark
                      ? CColors.white.withOpacity(0.5)
                      : CColors.dark.withOpacity(0.5),
                  backgroundColor: Colors.grey.withOpacity(0.2),
                  side: BorderSide(color: Colors.grey.withOpacity(0.1)),
                ),
                onPressed: () {},
                child: const Text('Apply')))
      ]),
    );
  }
}
