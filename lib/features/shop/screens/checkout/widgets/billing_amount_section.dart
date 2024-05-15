import 'package:flexi/features/shop/controllers/product_controllers/cart_controller.dart';
import 'package:flexi/utils/constants/sizes.dart';
import 'package:flexi/utils/helpers/pricing_calculator.dart';
import 'package:flutter/material.dart';

class CheckoutBillingAmountSection extends StatelessWidget {
  const CheckoutBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final subTotal = cartController.totalCartPrice.value;

    return Column(
      children: [
        // Subtotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Subtotal',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              '\$$subTotal',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),

        const SizedBox(
          height: CSizes.spaceBtwItems / 2,
        ),

        // Shipping Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Shipping Fee',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              '\$${UPricingCalculator.calculateShippingCost(subTotal, 'US')}',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),

        const SizedBox(
          height: CSizes.spaceBtwItems / 2,
        ),

        // Tax Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Tax Fee',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              '\$${UPricingCalculator.calculateTax(subTotal, 'US')}',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),

        const SizedBox(
          height: CSizes.spaceBtwItems / 2,
        ),

        // Order Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Order Total',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              '\$${UPricingCalculator.calculateTotalPrice(subTotal, 'US')}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        )
      ],
    );
  }
}
