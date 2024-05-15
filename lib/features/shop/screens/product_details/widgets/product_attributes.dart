import 'package:flexi/common/widgets/chips/choice_chip.dart';
import 'package:flexi/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flexi/common/widgets/texts/product_price_text.dart';
import 'package:flexi/common/widgets/texts/product_title_text.dart';
import 'package:flexi/common/widgets/texts/section_header.dart';
import 'package:flexi/features/shop/controllers/product_controllers/variation_controller.dart';
import 'package:flexi/features/shop/models/product_model.dart';
import 'package:flexi/utils/constants/colors.dart';
import 'package:flexi/utils/constants/sizes.dart';
import 'package:flexi/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailAttributes extends StatelessWidget {
  const ProductDetailAttributes({super.key, required this.product});

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller = VariationController.instance;
    final bool dark = UHelperFunctions.isDarkMode(context);

    return Obx(
      () => Column(
        children: [
          // Selected Attributes Price and Description
          if (controller.selectedVariation.value.id.isNotEmpty)
            CustomRoundedContainer(
              padding: const EdgeInsets.all(CSizes.md),
              backgroundColor: dark ? CColors.darkGrey : CColors.grey,
              child: Column(
                children: [
                  Row(
                    children: [
                      const CustomSectionHeader(
                        title: 'Variation',
                        showActionButton: false,
                      ),
                      const SizedBox(
                        width: CSizes.spaceBtwItems,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Price
                          Row(
                            children: [
                              const CustomProductTitleText(
                                title: 'Price :  ',
                                smallSize: true,
                              ),

                              // Actual price
                              if (controller.selectedVariation.value.salePrice >
                                  0)
                                Text(
                                  '\$${controller.selectedVariation.value.price}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .apply(
                                          decoration:
                                              TextDecoration.lineThrough),
                                ),

                              const SizedBox(
                                width: CSizes.spaceBtwItems,
                              ),
                              // Sale Price
                              HomeProductPriceText(
                                  price: controller.getVariationPrice()),
                            ],
                          ),

                          // Stock
                          Row(
                            children: [
                              const CustomProductTitleText(
                                title: "Stock :  ",
                                smallSize: true,
                              ),
                              Text(
                                controller.variationStockStatus.value,
                                style: Theme.of(context).textTheme.titleMedium,
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),

                  // Description
                  CustomProductTitleText(
                    title: controller.selectedVariation.value.description ?? '',
                    maxLines: 4,
                    smallSize: true,
                  )
                ],
              ),
            ),

          const SizedBox(
            height: CSizes.spaceBtwItems,
          ),

          // Attributes
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: product.productAttributes!
                .map(
                  (attribute) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomSectionHeader(
                        title: attribute.name ?? '',
                        showActionButton: false,
                      ),
                      const SizedBox(
                        height: CSizes.spaceBtwItems / 2,
                      ),
                      Obx(
                        () => Wrap(
                          spacing: 8,
                          children: attribute.values!.map((attributeValue) {
                            final isSelected =
                                controller.selectedAttributes[attribute.name] ==
                                    attributeValue;
                            final available = controller
                                .getAttributesAvailabilityInVariation(
                                    product.productVariations!, attribute.name!)
                                .contains(attributeValue);

                            return CustomChoiceChip(
                              text: attributeValue,
                              selected: isSelected,
                              onSelected: available
                                  ? (selected) {
                                      if (selected && available) {
                                        controller.onAttributeSelected(
                                            product,
                                            attribute.name ?? '',
                                            attributeValue);
                                      }
                                    }
                                  : null,
                            );
                          }).toList(),
                        ),
                      )
                    ],
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
