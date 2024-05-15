import 'package:flexi/utils/constants/colors.dart';
import 'package:flexi/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key, required this.dividerText});

  final String dividerText;

  @override
  Widget build(BuildContext context) {
    bool dark = UHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
            child: Divider(
          color: dark ? CColors.darkGrey : CColors.grey,
          thickness: 0.5,
          indent: 60,
          endIndent: 5,
        )),
        Text(dividerText),
        Flexible(
            child: Divider(
          color: dark ? CColors.darkGrey : CColors.grey,
          thickness: 0.5,
          indent: 5,
          endIndent: 60,
        )),
      ],
    );
  }
}
