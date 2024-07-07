import 'package:flexi/common/widgets/appbar/appbar.dart';
import 'package:flexi/common/widgets/images/rounded_image.dart';
import 'package:flexi/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:flexi/common/widgets/shimmers/horizontal_product_shimmer.dart';
import 'package:flexi/common/widgets/texts/section_header.dart';
import 'package:flexi/features/shop/controllers/category_controllers/category_controller.dart';
import 'package:flexi/features/shop/models/category_model.dart';
import 'package:flexi/features/shop/screens/all_products/all_products.dart';
import 'package:flexi/utils/constants/image_strings.dart';
import 'package:flexi/utils/constants/sizes.dart';
import 'package:flexi/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return Scaffold(
      // AppBar
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text(category.name),
      ),

      // Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: Column(
            children: [
              // Banner
              const CustomRoundEdgesImage(
                imageUrl: CImages.promoBannerFour,
                fit: BoxFit.cover,
                width: double.infinity,
                height: CSizes.imageCarouselHeight,
                applyImageRadius: true,
                borderRadius: CSizes.lg,
              ),

              const SizedBox(
                height: CSizes.spaceBtwSections,
              ),

              // Sub Category
              FutureBuilder(
                  future: controller.getSubCategories(category.id),
                  builder: (context, snapshot) {
                    // Handle Waiting and Error
                    const loader = CustomHorizontalProductShimmer();
                    final widget = UCloudHelperFunctions.checkMultiRecordState(
                        snapshot: snapshot, loader: loader);
                    if (widget != null) return widget;

                    // Found SubCategories
                    final subCategories = snapshot.data!;

                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: subCategories.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final subCategory = subCategories[index];

                        return FutureBuilder(
                          future: controller.getCategoryProducts(
                            categoryId: subCategory.id,
                          ),
                          builder: (context, snapshot) {
                            // Handle Waiting and Error
                            final widget =
                                UCloudHelperFunctions.checkMultiRecordState(
                                    snapshot: snapshot, loader: loader);
                            if (widget != null) return widget;

                            // Found SubCategory Products
                            final productsOfSubCategory = snapshot.data!;

                            return Column(
                              children: [
                                // Heading
                                CustomSectionHeader(
                                  title: subCategory.name,
                                  showActionButton: true,
                                  onPressed: () {
                                    Get.to(() => AllProductsScreen(
                                          title: subCategory.name,
                                          futureMethod:
                                              controller.getCategoryProducts(
                                                  categoryId: subCategory.id,
                                                  limit: -1),
                                        ));
                                  },
                                ),
                                const SizedBox(
                                  height: CSizes.spaceBtwItems / 2,
                                ),

                                // ListView
                                SizedBox(
                                  height: 120,
                                  child: ListView.separated(
                                    itemCount: productsOfSubCategory.length,
                                    scrollDirection: Axis.horizontal,
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(
                                      width: CSizes.spaceBtwItems,
                                    ),
                                    itemBuilder: (context, index) =>
                                        CustomProductCardHorizontal(
                                      product: productsOfSubCategory[index],
                                    ),
                                  ),
                                ),

                                const SizedBox(
                                  height: CSizes.spaceBtwSections,
                                )
                              ],
                            );
                          },
                        );
                      },
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
