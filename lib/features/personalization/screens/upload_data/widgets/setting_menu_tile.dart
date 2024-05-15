import 'package:flexi/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomSettingMenuTile extends StatelessWidget {
  const CustomSettingMenuTile(
      {super.key,
      required this.icon,
      required this.title,
      this.trailing,
      this.onTap});

  final IconData icon;
  final String title;
  final Widget? trailing;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        size: 28,
        color: CColors.primary,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      trailing: trailing,
    );
  }
}
