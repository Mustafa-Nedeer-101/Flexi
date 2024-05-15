import 'package:flexi/common/widgets/appbar/appbar.dart';
import 'package:flexi/common/widgets/texts/section_header.dart';
import 'package:flexi/features/personalization/controllers/user_controller.dart';
import 'package:flexi/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:flexi/features/personalization/screens/profile/widgets/profile_picture.dart';
import 'package:flexi/utils/constants/sizes.dart';
import 'package:flexi/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/state_manager.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text("Profile"),
        showBackArrow: true,
      ),

      // body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: Column(children: [
            // Profile Picture Section
            const ProfilePictureSection(),

            const SizedBox(
              height: CSizes.spaceBtwItems / 2,
            ),
            // Divider
            const Divider(),
            const SizedBox(
              height: CSizes.spaceBtwItems,
            ),

            // Profile Information
            const CustomSectionHeader(
              title: "Profile Information",
              showActionButton: false,
            ),
            const SizedBox(
              height: CSizes.spaceBtwItems,
            ),
            Obx(
              () => ProfileMenu(
                onPressed: () {},
                title: "Name",
                value: controller.user.value.fullName,
              ),
            ),
            Obx(
              () => ProfileMenu(
                onPressed: () {},
                title: "Username",
                value: controller.user.value.username,
              ),
            ),

            const SizedBox(
              height: CSizes.spaceBtwItems,
            ),
            const Divider(),
            const SizedBox(
              height: CSizes.spaceBtwItems,
            ),
            // Personal Information
            const CustomSectionHeader(
              title: "Personal Information",
              showActionButton: false,
            ),
            const SizedBox(
              height: CSizes.spaceBtwItems,
            ),

            Obx(
              () => ProfileMenu(
                onPressed: () {},
                title: "User ID",
                value: controller.user.value.id,
                icon: Iconsax.copy,
              ),
            ),
            Obx(
              () => ProfileMenu(
                  onPressed: () {},
                  title: "E-Mail",
                  value: controller.user.value.email),
            ),
            Obx(
              () => ProfileMenu(
                  onPressed: () {},
                  title: "Phone Number",
                  value: controller.user.value.phoneNumber),
            ),
            ProfileMenu(
              onPressed: () {},
              title: "Gender",
              value: 'Male',
            ),

            ProfileMenu(
                onPressed: () {},
                title: "Date Of Birth",
                value: CTexts.dateOfBirthInfo),

            const Divider(),
            const SizedBox(
              height: CSizes.spaceBtwItems,
            ),

            Center(
              child: TextButton(
                onPressed: controller.deleteAccountWarningPopup,
                child: const Text(
                  "Close Acount",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
