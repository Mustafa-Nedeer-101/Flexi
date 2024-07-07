import 'package:flexi/common/widgets/appbar/appbar.dart';
import 'package:flexi/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:flexi/common/widgets/list_tiles/setting_menu_tile.dart';
import 'package:flexi/common/widgets/list_tiles/user_profile_tile.dart';
import 'package:flexi/common/widgets/texts/section_header.dart';
import 'package:flexi/data/repositories/authentication/authentication_repo.dart';
import 'package:flexi/features/authentication/screens/login/login.dart';
import 'package:flexi/features/personalization/screens/address/address.dart';
import 'package:flexi/features/personalization/screens/profile/profile.dart';
import 'package:flexi/features/personalization/screens/upload_data/upload_data.dart';
import 'package:flexi/features/shop/screens/cart/cart.dart';
import 'package:flexi/features/shop/screens/orders/orders.dart';
import 'package:flexi/utils/constants/colors.dart';
import 'package:flexi/utils/constants/sizes.dart';
import 'package:flexi/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            PrimaryHeaderContainer(
              child: Column(
                children: [
                  // appbar
                  CustomAppBar(
                    title: Text(
                      CTexts.account,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: CColors.white),
                    ),
                  ),

                  // User Profile Card
                  CustomUserProfileTile(
                    onPressed: () => Get.to(() => const ProfileScreen()),
                  ),
                  // Padding
                  const SizedBox(
                    height: CSizes.spaceBtwSections,
                  )
                ],
              ),
            ),

            // Body
            Padding(
              padding: const EdgeInsets.all(CSizes.defaultSpace),
              child: Column(
                children: [
                  // Heading
                  const CustomSectionHeader(
                    title: "Account Settings",
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: CSizes.spaceBtwItems,
                  ),

                  // Address Settings
                  CustomSettingMenuTile(
                    icon: Iconsax.safe_home,
                    title: CTexts.myAddressesTitle,
                    subTitle: CTexts.myAddressesSubTitle,
                    onTap: () => Get.to(() => const AddressScreen()),
                  ),

                  // My Cart
                  CustomSettingMenuTile(
                    icon: Iconsax.shopping_cart,
                    title: CTexts.myCartTitle,
                    subTitle: CTexts.myCartSubTitle,
                    onTap: () => Get.to(() => const CartScreen()),
                  ),

                  // My Orders
                  CustomSettingMenuTile(
                    icon: Iconsax.bag_tick,
                    title: CTexts.myOrdersTitle,
                    subTitle: CTexts.myOrdersSubTitle,
                    onTap: () => Get.to(() => const OrdersScreen()),
                  ),

                  // My Back Account
                  const CustomSettingMenuTile(
                      icon: Iconsax.bank,
                      title: CTexts.myBankAccountTitle,
                      subTitle: CTexts.myBankAccountSubTitle),

                  // My Coupones
                  const CustomSettingMenuTile(
                      icon: Iconsax.discount_shape,
                      title: CTexts.myCouponsTitle,
                      subTitle: CTexts.myCouponsSubTitle),

                  // My Notification
                  const CustomSettingMenuTile(
                      icon: Iconsax.notification,
                      title: CTexts.myNotificationsTitle,
                      subTitle: CTexts.myAccountPrivacySubTitle),

                  // My Account Privacy
                  const CustomSettingMenuTile(
                      icon: Iconsax.security_card,
                      title: CTexts.myAccountPrivacyTitle,
                      subTitle: CTexts.myAccountPrivacySubTitle),

                  const SizedBox(
                    height: CSizes.spaceBtwSections,
                  ),
                  const CustomSectionHeader(
                    title: "AppSettings",
                    showActionButton: false,
                  ),

                  const SizedBox(
                    height: CSizes.spaceBtwItems,
                  ),

                  // AppSettings

                  // Upload Dummy Data
                  CustomSettingMenuTile(
                    icon: Iconsax.document_upload,
                    title: CTexts.loadDataTitle,
                    subTitle: CTexts.loadDataSubTitle,
                    onTap: () {
                      Get.to(() => const UploadDataScreen());
                    },
                  ),
                  CustomSettingMenuTile(
                      icon: Iconsax.location,
                      title: CTexts.geolocationTitle,
                      subTitle: CTexts.geolocationSubTitle,
                      trailing: Switch(value: false, onChanged: (value) {})),
                  CustomSettingMenuTile(
                      icon: Iconsax.security_user,
                      title: CTexts.safeModeTitle,
                      subTitle: CTexts.safeModeSubTitle,
                      trailing: Switch(value: true, onChanged: (value) {})),
                  CustomSettingMenuTile(
                      icon: Iconsax.image,
                      title: CTexts.hdImageTitle,
                      subTitle: CTexts.hdImageSubTitle,
                      trailing: Switch(value: false, onChanged: (value) {})),

                  const SizedBox(
                    height: CSizes.spaceBtwSections,
                  ),

                  // Logout Button
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                        onPressed: () {
                          AuthenticationRepo.instance.logout();
                          Get.offAll(() => const Login());
                        },
                        child: const Text("Logout")),
                  ),

                  const SizedBox(
                    height: CSizes.spaceBtwSections * 2.5,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
