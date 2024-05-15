import 'package:flexi/utils/constants/colors.dart';
import 'package:flexi/utils/constants/sizes.dart';
import 'package:flexi/utils/device/device_utility.dart';
import 'package:flexi/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {super.key,
      this.title,
      this.showBackArrow = false,
      this.leadingIcon,
      this.leadingOnpressed,
      this.actions});

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final VoidCallback? leadingOnpressed;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    final bool dark = UHelperFunctions.isDarkMode(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: CSizes.md),
      child: AppBar(
        title: title,
        titleTextStyle: Theme.of(context).textTheme.headlineMedium,
        automaticallyImplyLeading: false,
        leading: showBackArrow
            ? IconButton(
                onPressed: () => Get.back(),
                icon: Icon(
                  Iconsax.arrow_left,
                  color: dark ? CColors.white : CColors.dark,
                ))
            : leadingIcon != null
                ? IconButton(
                    onPressed: leadingOnpressed, icon: Icon(leadingIcon))
                : null,
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(UDeviceUtils.getAppBarHeight());
}
