import 'package:flexi/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:flexi/utils/constants/colors.dart';
import 'package:flexi/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CustomChoiceChip extends StatelessWidget {
  const CustomChoiceChip(
      {super.key, required this.text, required this.selected, this.onSelected});

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final bool isColor = UHelperFunctions.getColor(text) != null;
    return Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
        child: ChoiceChip(
          label: isColor ? const SizedBox() : Text(text),
          selected: selected,
          onSelected: onSelected,
          labelStyle: TextStyle(color: selected ? CColors.white : null),
          avatar: isColor
              ? CustomCircularContainer(
                  width: 50,
                  height: 50,
                  backgroundColor: UHelperFunctions.getColor(text)!,
                )
              : null,
          labelPadding: isColor ? const EdgeInsets.all(0) : null,
          padding: isColor ? const EdgeInsets.all(0) : null,
          shape: isColor ? const CircleBorder() : null,
          backgroundColor: isColor ? UHelperFunctions.getColor(text)! : null,
        ));
  }
}
