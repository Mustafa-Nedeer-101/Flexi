import 'package:flexi/common/widgets/appbar/appbar.dart';
import 'package:flexi/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flexi/common/widgets/loaders/loaders.dart';
import 'package:flexi/common/widgets/products/cart/cart_items.dart';
import 'package:flexi/common/widgets/products/cart/coupon_widget.dart';
import 'package:flexi/features/shop/controllers/product_controllers/cart_controller.dart';
import 'package:flexi/features/shop/controllers/product_controllers/order_controller.dart';
import 'package:flexi/features/shop/screens/checkout/widgets/billing_address_sections.dart';
import 'package:flexi/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:flexi/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:flexi/utils/constants/colors.dart';
import 'package:flexi/utils/constants/sizes.dart';
import 'package:flexi/utils/helpers/helper_functions.dart';
import 'package:flexi/utils/helpers/pricing_calculator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final subTotal = cartController.totalCartPrice.value;
    final orderController = Get.put(OrderController());
    final totalAmout = UPricingCalculator.calculateTotalPrice(subTotal, 'US');

    final bool dark = UHelperFunctions.isDarkMode(context);
    return Scaffold(
      // AppBar
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text(
          'Order Review',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),

      // Buttom
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(CSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: subTotal > 0
                ? () => orderController.processOrder(totalAmout)
                : () => CustomLoaders.warningSnackbar(
                    title: 'Empay Cart',
                    message: 'Add items in the cart in order to proceed'),
            child: Text("Checkout  \$$totalAmout")),
      ),

      // body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: Column(
            children: [
              // Items In Cart
              const CustomCartItems(
                showAddRemoveButtons: false,
              ),
              const SizedBox(
                height: CSizes.spaceBtwSections,
              ),

              const CustomCouponCode(),

              const SizedBox(
                height: CSizes.spaceBtwSections,
              ),

              // Billing Section
              CustomRoundedContainer(
                showBorder: true,
                backgroundColor: dark ? CColors.black : CColors.white,
                padding: const EdgeInsets.all(CSizes.defaultSpace),
                child: const Column(
                  children: [
                    // Pricing
                    CheckoutBillingAmountSection(),

                    SizedBox(
                      height: CSizes.spaceBtwItems,
                    ),

                    // Divider
                    Divider(),
                    SizedBox(
                      height: CSizes.spaceBtwItems,
                    ),

                    // Payment Methods
                    CheckoutBillingPaymentSection(),

                    SizedBox(
                      height: CSizes.spaceBtwItems,
                    ),
                    // Address
                    CheckoutBillingAddressSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
