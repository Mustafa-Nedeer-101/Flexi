import 'package:flexi/common/widgets/icons/circular_icon.dart';
import 'package:flexi/utils/constants/colors.dart';
import 'package:flexi/utils/constants/sizes.dart';
import 'package:flexi/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CustomProductQuantityWithPlusAndMinus extends StatelessWidget {
  const CustomProductQuantityWithPlusAndMinus(
      {super.key,
      required this.add,
      required this.remove,
      required this.quantity});

  final int quantity;
  final VoidCallback add, remove;
  @override
  Widget build(BuildContext context) {
    final bool dark = UHelperFunctions.isDarkMode(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Minus
        CustomCircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: CSizes.md,
          color: dark ? CColors.white : CColors.black,
          backgroundColor: dark ? CColors.darkerGrey : CColors.lightGrey,
          onPressed: remove,
        ),

        const SizedBox(
          width: CSizes.spaceBtwItems,
        ),

        Text(
          quantity.toString(),
          style: Theme.of(context).textTheme.titleSmall,
        ),

        const SizedBox(
          width: CSizes.spaceBtwItems,
        ),

        // Plus
        CustomCircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: CSizes.md,
          color: CColors.white,
          backgroundColor: CColors.primary,
          onPressed: add,
        ),
      ],
    );
  }
}
