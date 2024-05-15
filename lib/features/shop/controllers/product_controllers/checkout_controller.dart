import 'package:flexi/common/widgets/texts/section_header.dart';
import 'package:flexi/features/shop/models/payment_method_model.dart';
import 'package:flexi/features/shop/screens/checkout/widgets/payment_tile.dart';
import 'package:flexi/utils/constants/image_strings.dart';
import 'package:flexi/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find();

  // Observable payment method model
  final Rx<PaymentMethodModel> selectedPaymentMethod =
      PaymentMethodModel.empty().obs;

  @override
  void onInit() {
    selectedPaymentMethod.value =
        PaymentMethodModel(name: 'Visa', image: CImages.visa);
    super.onInit();
  }

  Future<dynamic> selectPaymentMothod(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(CSizes.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomSectionHeader(
                title: 'Select Payment Method',
                showActionButton: false,
              ),
              const SizedBox(
                height: CSizes.spaceBtwSections,
              ),
              CustomPaymentTile(
                paymentMethod: PaymentMethodModel(name: 'Paypal', image: ''),
              ),
              const SizedBox(
                height: CSizes.spaceBtwItems / 2,
              ),
              CustomPaymentTile(
                  paymentMethod: PaymentMethodModel(
                      name: 'Google Pay', image: CImages.googlePay)),
              const SizedBox(
                height: CSizes.spaceBtwItems / 2,
              ),
              CustomPaymentTile(
                  paymentMethod: PaymentMethodModel(
                      name: 'Apple Pay', image: CImages.applePay)),
              const SizedBox(
                height: CSizes.spaceBtwItems / 2,
              ),
              CustomPaymentTile(
                  paymentMethod:
                      PaymentMethodModel(name: 'VISA', image: CImages.visa)),
              const SizedBox(
                height: CSizes.spaceBtwItems / 2,
              ),
              CustomPaymentTile(
                  paymentMethod: PaymentMethodModel(
                      name: 'Master Card', image: CImages.masterCard)),
              const SizedBox(
                height: CSizes.spaceBtwItems / 2,
              ),
              CustomPaymentTile(
                  paymentMethod:
                      PaymentMethodModel(name: 'Paytm', image: CImages.paytm)),
              const SizedBox(
                height: CSizes.spaceBtwItems / 2,
              ),
              CustomPaymentTile(
                  paymentMethod: PaymentMethodModel(
                      name: 'Paystack', image: CImages.payStack)),
              const SizedBox(
                height: CSizes.spaceBtwItems / 2,
              ),
              CustomPaymentTile(
                  paymentMethod: PaymentMethodModel(
                      name: 'CreditCard', image: CImages.creditCard)),
              const SizedBox(
                height: CSizes.spaceBtwItems / 2,
              ),
              const SizedBox(
                height: CSizes.spaceBtwSections,
              )
            ],
          ),
        ),
      ),
    );
  }

  //
}
