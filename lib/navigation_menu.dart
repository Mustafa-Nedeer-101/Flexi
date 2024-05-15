import 'package:flexi/features/personalization/screens/settings/settings.dart';
import 'package:flexi/features/shop/screens/home/home.dart';
import 'package:flexi/features/shop/screens/store/store.dart';
import 'package:flexi/features/shop/screens/wishlist/wishlist.dart';
import 'package:flexi/utils/constants/colors.dart';
import 'package:flexi/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    NavigationMenuController controller = Get.put(NavigationMenuController());
    bool dark = UHelperFunctions.isDarkMode(context);

    //
    return Scaffold(
      // Listens to any changes in Cotroller
      bottomNavigationBar: Obx(() => NavigationBar(
            height: 80,
            elevation: 0,
            backgroundColor: dark ? CColors.black : CColors.white,
            indicatorColor: dark
                ? CColors.white.withOpacity(0.1)
                : CColors.black.withOpacity(0.1),
            selectedIndex: controller.index.value,
            onDestinationSelected: controller.updateIndex,
            destinations: const [
              NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
              NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store'),
              NavigationDestination(
                  icon: Icon(Iconsax.heart), label: 'Wishlist'),
              NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
            ],
          )),

      // body
      // also Listens
      body: Obx(() => controller.screens[controller.index.value]),
    );
  }
}

class NavigationMenuController extends GetxController {
  static NavigationMenuController get instance => Get.find();

  // Selected Page Index
  Rx<int> index = 0.obs;

  // Screens
  final screens = const [
    HomeScreen(),
    StoreScreen(),
    WishlistScreen(),
    SettingsScreen(),
  ];

  void updateIndex(val) {
    index.value = val;
  }
}
