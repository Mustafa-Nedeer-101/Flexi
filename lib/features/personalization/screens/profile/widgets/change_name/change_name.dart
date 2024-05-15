import 'package:flexi/common/widgets/appbar/appbar.dart';
import 'package:flexi/features/personalization/controllers/change_name/change_name_controller.dart';
import 'package:flexi/utils/constants/sizes.dart';
import 'package:flexi/utils/constants/texts.dart';
import 'package:flexi/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ChangeNameScreen extends StatelessWidget {
  const ChangeNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChangeNameController());
    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text(
          "Change Name",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),

      // Body
      body: Padding(
        padding: const EdgeInsets.all(CSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Heading
            Text(
              'Use real name for easy verification. this name will appear on several pages.',
              style: Theme.of(context).textTheme.labelMedium,
            ),

            const SizedBox(
              height: CSizes.spaceBtwSections,
            ),

            Form(
              key: controller.saveFormKey,
              child: Column(
                children: [
                  // First name
                  TextFormField(
                    controller: controller.firstName,
                    validator: UValidator.validateFirstName,
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: CTexts.lastName,
                        prefixIcon: Icon(Iconsax.user)),
                  ),

                  // Last name
                  TextFormField(
                    controller: controller.lastName,
                    validator: UValidator.validateLastName,
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: CTexts.lastName,
                        prefixIcon: Icon(Iconsax.user)),
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: CSizes.spaceBtwSections,
            ),

            // Save Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.saveNewName(),
                child: const Text("Save"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
