import 'package:flexi/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:flexi/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:flexi/utils/constants/colors.dart';
import 'package:flutter/material.dart';

// The primary Blue container with the two circles in the background
class PrimaryHeaderContainer extends StatelessWidget {
  const PrimaryHeaderContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CustomCurvedEdgesWidget(
      child: Container(
        color: CColors.primary,
        // if (size.isFinite: is not true.in stack) error occured
        child: Stack(
          children: [
            // Background custom Shapes
            Positioned(
              top: -150,
              right: -250,
              child: CustomCircularContainer(
                backgroundColor: CColors.textWhite.withOpacity(0.1),
              ),
            ),
            Positioned(
              top: 100,
              right: -300,
              child: CustomCircularContainer(
                backgroundColor: CColors.textWhite.withOpacity(0.1),
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
