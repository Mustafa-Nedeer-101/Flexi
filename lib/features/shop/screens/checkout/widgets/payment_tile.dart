import 'package:flexi/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flexi/features/shop/controllers/product_controllers/checkout_controller.dart';
import 'package:flexi/features/shop/models/payment_method_model.dart';
import 'package:flexi/utils/constants/colors.dart';
import 'package:flexi/utils/constants/sizes.dart';
import 'package:flexi/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CustomPaymentTile extends StatelessWidget {
  const CustomPaymentTile({super.key, required this.paymentMethod});

  final PaymentMethodModel paymentMethod;
  @override
  Widget build(BuildContext context) {
    final controller = CheckoutController.instance;

    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      onTap: () {
        controller.selectedPaymentMethod.value = paymentMethod;
        Get.back();
      },
      leading: CustomRoundedContainer(
        width: 60,
        height: 40,
        backgroundColor: UHelperFunctions.isDarkMode(context)
            ? CColors.light
            : CColors.white,
        padding: const EdgeInsets.all(CSizes.sm),
        child: Image(
          image: AssetImage(paymentMethod.image),
          fit: BoxFit.contain,
        ),
      ),
      title: Text(paymentMethod.name),
      trailing: const Icon(Iconsax.arrow_right_34),
    );
  }
}
