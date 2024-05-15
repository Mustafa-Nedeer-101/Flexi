import 'package:flexi/utils/constants/colors.dart';
import 'package:flexi/utils/device/device_utility.dart';
import 'package:flexi/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CustomTAbBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomTAbBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final bool dark = UHelperFunctions.isDarkMode(context);
    return Material(
      color: dark ? CColors.black : CColors.white,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        indicatorColor: CColors.primary,
        labelColor: dark ? CColors.white : CColors.primary,
        unselectedLabelColor: CColors.darkGrey,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(UDeviceUtils.getAppBarHeight());
}
