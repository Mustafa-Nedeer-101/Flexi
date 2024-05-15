import 'package:flexi/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flexi/common/widgets/texts/section_header.dart';
import 'package:flexi/features/shop/controllers/product_controllers/checkout_controller.dart';
import 'package:flexi/utils/constants/colors.dart';
import 'package:flexi/utils/constants/sizes.dart';
import 'package:flexi/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutBillingPaymentSection extends StatelessWidget {
  const CheckoutBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CheckoutController.instance;

    final bool dark = UHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        CustomSectionHeader(
          title: 'Payment Method',
          buttonTitle: 'Change',
          showActionButton: true,
          onPressed: () => controller.selectPaymentMothod(context),
        ),
        const SizedBox(
          height: CSizes.spaceBtwItems / 2,
        ),

        //
        Obx(
          () => Row(
            children: [
              CustomRoundedContainer(
                width: 60,
                height: 35,
                backgroundColor: dark ? CColors.light : CColors.white,
                padding: const EdgeInsets.all(CSizes.sm),
                child: Image(
                  image:
                      AssetImage(controller.selectedPaymentMethod.value.image),
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(
                width: CSizes.spaceBtwItems / 2,
              ),
              Text(controller.selectedPaymentMethod.value.name,
                  style: Theme.of(context).textTheme.bodyLarge),
            ],
          ),
        ),
      ],
    );
  }
}
