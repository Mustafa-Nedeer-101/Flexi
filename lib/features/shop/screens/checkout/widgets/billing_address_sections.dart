import 'package:flexi/common/widgets/texts/section_header.dart';
import 'package:flexi/features/personalization/controllers/address/address_controller.dart';
import 'package:flexi/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutBillingAddressSection extends StatelessWidget {
  const CheckoutBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final addressController = AddressController.instance;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomSectionHeader(
          title: 'Shipping Address',
          buttonTitle: 'Change',
          showActionButton: true,
          onPressed: () => addressController.selectNewAddressPopup(context),
        ),

        // Address Information if There
        Obx(() {
          final isEmptyAddress =
              addressController.selectedAddress.value.id.isEmpty;

          return isEmptyAddress
              ? Text(
                  'Select Address',
                  style: Theme.of(context).textTheme.bodyMedium,
                )
              : Obx(() {
                  final fullAddress = addressController.toString();
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Name
                      Text(
                        addressController.selectedAddress.value.name,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(height: CSizes.spaceBtwItems / 2),

                      //
                      Row(
                        children: [
                          const Icon(Icons.phone, color: Colors.grey, size: 16),
                          const SizedBox(
                            width: CSizes.spaceBtwItems,
                          ),

                          // Phone Number
                          Text(
                            addressController.selectedAddress.value.phoneNumber,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      const SizedBox(height: CSizes.spaceBtwItems / 2),

                      //
                      Row(
                        children: [
                          const Icon(Icons.location_history,
                              color: Colors.grey, size: 16),
                          const SizedBox(
                            width: CSizes.spaceBtwItems,
                          ),

                          // Information
                          Text(
                            fullAddress,
                            style: Theme.of(context).textTheme.bodyMedium,
                            softWrap: true,
                          ),
                        ],
                      ),
                    ],
                  );
                });
        }),
      ],
    );
  }
}
