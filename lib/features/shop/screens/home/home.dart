import 'package:flexi/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:flexi/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:flexi/common/widgets/layouts/grid_layout.dart';
import 'package:flexi/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:flexi/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:flexi/common/widgets/texts/section_header.dart';
import 'package:flexi/features/shop/controllers/brand_controller.dart';
import 'package:flexi/features/shop/controllers/product_controllers/product_controller.dart';
import 'package:flexi/features/shop/controllers/product_controllers/wishlist_controller.dart';
import 'package:flexi/features/shop/screens/all_products/all_products.dart';
import 'package:flexi/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:flexi/features/shop/screens/home/widgets/home_categories.dart';
import 'package:flexi/features/shop/screens/home/widgets/promo_slidder.dart';
import 'package:flexi/utils/constants/colors.dart';
import 'package:flexi/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    Get.put(BrandController());
    Get.put(WishlistController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const PrimaryHeaderContainer(
              // The header
              child: Column(
                children: [
                  // CustomAppBar
                  HomeAppBar(),
                  // Space
                  SizedBox(
                    height: CSizes.spaceBtwSections,
                  ),
                  // Search Bar
                  CustomSearchContainer(
                    text: 'Search in store',
                  ),

                  // Space
                  SizedBox(
                    height: CSizes.spaceBtwSections,
                  ),

                  // Categories
                  Padding(
                    padding: EdgeInsets.only(left: CSizes.defaultSpace),
                    child: Column(
                      children: [
                        CustomSectionHeader(
                          title: "Categories",
                          showActionButton: false,
                          textColor: CColors.white,
                        ),
                        // space
                        SizedBox(
                          height: CSizes.spaceBtwItems,
                        ),
                        HomeCategories(),
                      ],
                    ),
                  ),

                  // Padding at bottom
                  SizedBox(
                    height: CSizes.spaceBtwSections,
                  )
                ],
              ),
            ),

            // The Body
            Padding(
              padding: const EdgeInsets.all(CSizes.defaultSpace),
              child: Column(
                children: [
                  // Promo Slider
                  const HomePromoSlider(),

                  // Space
                  const SizedBox(
                    height: CSizes.spaceBtwSections,
                  ),

                  // Heading
                  CustomSectionHeader(
                    title: 'Popular Products',
                    onPressed: () => Get.to(() => AllProductsScreen(
                          title: 'Popular Products',
                          futureMethod: controller.getAllFeaturedProducts(),
                        )),
                  ),
                  const SizedBox(height: CSizes.spaceBtwItems),

                  // Grid of products
                  Obx(() {
                    if (controller.isLoading.value) {
                      return const CustomVerticalProductShimmer();
                    }

                    if (controller.featuredProducts.isEmpty) {
                      return const Center(
                        child: Icon(
                          Iconsax.shop,
                          color: CColors.primary,
                          size: 44,
                        ),
                      );
                    }
                    // Products Fetched
                    return CustomGridLayout(
                        itemCount: controller.featuredProducts.length,
                        itemBuilder: (_, index) => CustomProductCardVertical(
                            product: controller.featuredProducts[index]));
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
