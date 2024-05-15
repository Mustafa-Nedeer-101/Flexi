import 'package:flexi/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flexi/features/personalization/controllers/address/address_controller.dart';
import 'package:flexi/features/personalization/models/address_model.dart';
import 'package:flexi/utils/constants/colors.dart';
import 'package:flexi/utils/constants/sizes.dart';
import 'package:flexi/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SingleAddress extends StatelessWidget {
  const SingleAddress({super.key, required this.address, required this.onTap});

  final AddressModel address;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    final bool dark = UHelperFunctions.isDarkMode(context);

    return Obx(() {
      final selectedAddressId = controller.selectedAddress.value.id;
      final isSelectedAddress = selectedAddressId == address.id;
      return InkWell(
        onTap: onTap,
        child: CustomRoundedContainer(
          width: double.infinity,
          showBorder: true,
          backgroundColor: isSelectedAddress
              ? CColors.primary.withOpacity(0.5)
              : Colors.transparent,
          borderColor: isSelectedAddress
              ? Colors.transparent
              : dark
                  ? CColors.darkerGrey
                  : CColors.grey,
          margin: const EdgeInsets.only(bottom: CSizes.spaceBtwItems),
          padding: const EdgeInsets.all(CSizes.md),

          // Child
          child: Stack(
            children: [
              // Selected Icon
              if (isSelectedAddress)
                Positioned(
                    top: 0,
                    right: 5,
                    child: Icon(
                      Iconsax.tick_circle5,
                      color: dark ? CColors.light : CColors.dark,
                    )),

              // Information
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    address.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: CSizes.sm / 2,
                  ),
                  Text(
                    address.phoneNumber,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: CSizes.sm / 2,
                  ),
                  Text(
                    address.toString(),
                    softWrap: true,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
