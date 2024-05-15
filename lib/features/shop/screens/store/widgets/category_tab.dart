import 'package:flexi/common/widgets/layouts/grid_layout.dart';
import 'package:flexi/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:flexi/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:flexi/common/widgets/texts/section_header.dart';
import 'package:flexi/features/shop/controllers/category_controllers/category_controller.dart';
import 'package:flexi/features/shop/models/category_model.dart';
import 'package:flexi/features/shop/screens/all_products/all_products.dart';
import 'package:flexi/features/shop/screens/store/widgets/category_brands.dart';
import 'package:flexi/utils/constants/sizes.dart';
import 'package:flexi/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class StoreCategoryTab extends StatelessWidget {
  const StoreCategoryTab({super.key, this.images, required this.category});

  final List<String>? images;
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    final catController = CategoryController.instance;
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: Column(
            children: [
              // Brands
              CategoryBrands(category: category),

              const SizedBox(
                height: CSizes.spaceBtwItems,
              ),

              // Products
              FutureBuilder(
                  future: catController.getCategoryProducts(
                      categoryId: category.id),
                  builder: (context, snapshot) {
                    // Handle Function, Loader
                    final response =
                        UCloudHelperFunctions.checkMultiRecordState(
                            snapshot: snapshot,
                            loader: const CustomVerticalProductShimmer());

                    if (response != null) return response;

                    // Products Found
                    final products = snapshot.data!;

                    return Column(children: [
                      // Header
                      CustomSectionHeader(
                        title: 'You might like',
                        onPressed: () => Get.to(() {
                          return AllProductsScreen(
                            title: category.name,
                            futureMethod: catController.getCategoryProducts(
                                categoryId: category.id, limit: -1),
                          );
                        }),
                      ),
                      const SizedBox(
                        height: CSizes.spaceBtwItems,
                      ),

                      // Products
                      CustomGridLayout(
                          itemCount: products.length,
                          itemBuilder: (_, index) => CustomProductCardVertical(
                              product: products[index])),
                    ]);
                  }),

              const SizedBox(
                height: CSizes.spaceBtwItems,
              ),
            ],
          ),
        )
      ],
    );
  }
}
