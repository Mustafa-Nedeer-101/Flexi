// ignore_for_file: unused_local_variable

import 'package:flexi/common/widgets/appbar/appbar.dart';
import 'package:flexi/common/widgets/appbar/tabbar.dart';
import 'package:flexi/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:flexi/common/widgets/layouts/grid_layout.dart';
import 'package:flexi/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:flexi/common/widgets/shimmers/brand_shimmer.dart';
import 'package:flexi/common/widgets/texts/section_header.dart';
import 'package:flexi/common/widgets/brands/brand_card.dart';
import 'package:flexi/data/repositories/relationships/brand_category_repo.dart';
import 'package:flexi/data/repositories/relationships/product_category_repo.dart';
import 'package:flexi/features/shop/controllers/brand_controller.dart';
import 'package:flexi/features/shop/controllers/category_controllers/category_controller.dart';
import 'package:flexi/features/shop/screens/all_brands/all_brands.dart';
import 'package:flexi/features/shop/screens/store/widgets/category_tab.dart';
import 'package:flexi/utils/constants/colors.dart';
import 'package:flexi/utils/constants/sizes.dart';
import 'package:flexi/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = UHelperFunctions.isDarkMode(context);
    final categories = CategoryController.instance.featuredCategories;
    final brandController = BrandController.instance;

    final productCategoryRepo = Get.put(ProductCategoryRepo());
    final brandCategoryRepo = Get.put(BrandCategoryRepo());

    return DefaultTabController(
        length: categories.length,
        child: Scaffold(
          appBar: CustomAppBar(
              title: Text('Store',
                  style: Theme.of(context).textTheme.headlineMedium),
              actions: [
                CustomCartCounterIcon(
                  iconColor: dark ? CColors.white : CColors.black,
                )
              ]),
          body: NestedScrollView(
            headerSliverBuilder: (_, isInnerBoxScrolled) {
              return [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: true,
                  floating: true,
                  backgroundColor: UHelperFunctions.isDarkMode(context)
                      ? CColors.dark
                      : CColors.white,
                  expandedHeight: 440,
                  flexibleSpace: Padding(
                      padding: const EdgeInsets.all(CSizes.defaultSpace),
                      child: ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          // Search Bar
                          const SizedBox(
                            height: CSizes.spaceBtwItems,
                          ),
                          const CustomSearchContainer(
                            text: 'Search in Store',
                            showBorder: true,
                            showBackground: false,
                            padding: EdgeInsets.zero,
                          ),
                          const SizedBox(
                            height: CSizes.spaceBtwSections,
                          ),

                          // Featured Brands
                          CustomSectionHeader(
                            title: 'Featured Brands',
                            onPressed: () =>
                                Get.to(() => const AllBrandsScreen()),
                          ),
                          const SizedBox(height: CSizes.spaceBtwSections),

                          // Brands Grid
                          Obx(() {
                            // Still Loading
                            if (brandController.isLoading.value) {
                              return const CustomBrandShimmer();
                            }

                            // No Data
                            if (brandController.featuredBrands.isEmpty) {
                              return Center(
                                child: Text(
                                  'No Data Found',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .apply(color: CColors.white),
                                ),
                              );
                            }

                            // Found Brands
                            return CustomGridLayout(
                                mainAxisExtent: 80,
                                itemCount:
                                    brandController.featuredBrands.length,
                                itemBuilder: (_, index) {
                                  return CustomBrandCard(
                                    brand:
                                        brandController.featuredBrands[index],
                                  );
                                });
                          }),
                        ],
                      )),

                  // Tabbar
                  bottom: CustomTAbBar(
                      tabs: categories
                          .map((element) => Tab(
                                child: Text(element.name),
                              ))
                          .toList()),
                ),
              ];
            },

            // Body
            body: TabBarView(
                children: categories
                    .map((element) => StoreCategoryTab(category: element))
                    .toList()),
          ),
        ));
  }
}
