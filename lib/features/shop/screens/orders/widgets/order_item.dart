import 'package:flexi/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flexi/features/shop/models/order_model.dart';
import 'package:flexi/utils/constants/colors.dart';
import 'package:flexi/utils/constants/sizes.dart';
import 'package:flexi/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key, required this.order});

  final OrderModel order;
  @override
  Widget build(BuildContext context) {
    final bool dark = UHelperFunctions.isDarkMode(context);
    return CustomRoundedContainer(
      showBorder: true,
      padding: const EdgeInsets.all(CSizes.md),
      backgroundColor: dark ? CColors.dark : CColors.light,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // First Row
          Row(
            children: [
              const Icon(Iconsax.ship),

              const SizedBox(
                width: CSizes.spaceBtwItems / 2,
              ),

              // Status and Date
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      order.orderStatusText,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .apply(color: CColors.primary, fontWeightDelta: 1),
                    ),
                    Text(
                      order.formattedOrderDate,
                      style: Theme.of(context).textTheme.headlineSmall,
                    )
                  ],
                ),
              ),

              // Icon
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Iconsax.arrow_right_34,
                    size: CSizes.iconSm,
                  )),
            ],
          ),

          const SizedBox(
            height: CSizes.spaceBtwItems,
          ),

          // Second Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    const Icon(Iconsax.tag),

                    const SizedBox(
                      width: CSizes.spaceBtwItems / 2,
                    ),

                    // Order
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Order',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            order.id,
                            style: Theme.of(context).textTheme.labelMedium,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Iconsax.calendar),

                    const SizedBox(
                      width: CSizes.spaceBtwItems / 2,
                    ),

                    // Shipping Date
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Shipping Date',
                              style: Theme.of(context).textTheme.titleMedium),
                          Text(
                            order.formattedDeliveryDate,
                            style: Theme.of(context).textTheme.labelMedium,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
