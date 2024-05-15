import 'package:flexi/common/widgets/appbar/appbar.dart';
import 'package:flexi/features/personalization/controllers/address/address_controller.dart';
import 'package:flexi/utils/constants/sizes.dart';
import 'package:flexi/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AddNewAddressScree extends StatelessWidget {
  const AddNewAddressScree({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    return Scaffold(
      // App Bar
      appBar: const CustomAppBar(
        showBackArrow: true,
        title: Text("Add New Address"),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: Form(
            key: controller.addressFormKey,
            child: Column(
              children: [
                // Name
                TextFormField(
                  controller: controller.name,
                  validator: (value) {
                    return UValidator.validateEmptyText('Name', value);
                  },
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Iconsax.user,
                      ),
                      labelText: 'Name'),
                ),
                const SizedBox(
                  height: CSizes.spaceBtwInputFields,
                ),

                // Phone Number
                TextFormField(
                  controller: controller.phoneNumber,
                  validator: UValidator.validatePhoneNumber,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Iconsax.mobile,
                      ),
                      labelText: 'Phone Number'),
                ),
                const SizedBox(
                  height: CSizes.spaceBtwInputFields,
                ),

                // Street and Code
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: controller.street,
                        validator: (value) {
                          return UValidator.validateEmptyText('Street', value);
                        },
                        decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Iconsax.building_31,
                            ),
                            labelText: 'Street'),
                      ),
                    ),
                    const SizedBox(
                      width: CSizes.spaceBtwInputFields,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: controller.postalCode,
                        validator: (value) {
                          return UValidator.validateEmptyText(
                              'Postal Code', value);
                        },
                        decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Iconsax.code,
                            ),
                            labelText: 'Postal Code'),
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  height: CSizes.spaceBtwInputFields,
                ),

                // City and State
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: controller.city,
                        validator: (value) {
                          return UValidator.validateEmptyText('City', value);
                        },
                        decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Iconsax.building,
                            ),
                            labelText: 'City'),
                      ),
                    ),
                    const SizedBox(
                      width: CSizes.spaceBtwInputFields,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: controller.state,
                        validator: (value) {
                          return UValidator.validateEmptyText('State', value);
                        },
                        decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Iconsax.activity,
                            ),
                            labelText: 'State'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: CSizes.spaceBtwInputFields,
                ),

                // country
                TextFormField(
                  controller: controller.country,
                  validator: (value) {
                    return UValidator.validateEmptyText('Country', value);
                  },
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Iconsax.global,
                      ),
                      labelText: 'Country'),
                ),

                const SizedBox(
                  height: CSizes.defaultSpace,
                ),

                // Save Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        controller.addNewAddress();
                      },
                      child: const Text('Save')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
