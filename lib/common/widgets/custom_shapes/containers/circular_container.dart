import 'package:flexi/utils/constants/colors.dart';
import 'package:flutter/material.dart';

// The circle in the background
class CustomCircularContainer extends StatelessWidget {
  const CustomCircularContainer({
    super.key,
    this.width = 400,
    this.height = 400,
    this.padding = 0,
    this.margin,
    this.radius = 400,
    this.backgroundColor = CColors.white,
    this.child,
  });

  final double? width;
  final double? height;
  final double padding;
  final EdgeInsets? margin;
  final double radius;
  final Widget? child;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
      ),
      child: child,
    );
  }
}
