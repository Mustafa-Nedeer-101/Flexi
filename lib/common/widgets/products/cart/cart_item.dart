import 'package:flexi/common/widgets/images/rounded_image.dart';
import 'package:flexi/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:flexi/common/widgets/texts/product_title_text.dart';
import 'package:flexi/features/shop/models/cart_item_model.dart';
import 'package:flexi/utils/constants/colors.dart';
import 'package:flexi/utils/constants/sizes.dart';
import 'package:flexi/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CustomCartItem extends StatelessWidget {
  const CustomCartItem({
    super.key,
    required this.item,
  });

  final CartItemModel item;

  @override
  Widget build(BuildContext context) {
    final bool dark = UHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        // image
        CustomRoundedImage(
          isNetworkImage: true,
          imageUrl: item.image ?? '',
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(CSizes.sm),
          backgroundColor: dark ? CColors.darkerGrey : CColors.grey,
        ),

        const SizedBox(
          width: CSizes.spaceBtwItems,
        ),

        // Title, Price, & size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomBrandTitleTextWithVerifiedIcon(title: item.brandName ?? ''),
              Flexible(
                  child: CustomProductTitleText(
                title: item.title,
                maxLines: 1,
              )),

              // Attributes
              Text.rich(
                TextSpan(
                    children: (item.selectedVariaition ?? {})
                        .entries
                        .map((e) => TextSpan(children: [
                              TextSpan(
                                  text: e.key,
                                  style: Theme.of(context).textTheme.bodySmall),
                              TextSpan(
                                  text: e.value,
                                  style: Theme.of(context).textTheme.bodyLarge),
                            ]))
                        .toList()),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
