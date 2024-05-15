import 'package:flexi/common/widgets/brands/brand_show_case.dart';
import 'package:flexi/common/widgets/shimmers/boxes_shimmer.dart';
import 'package:flexi/common/widgets/shimmers/list_tile_shimmer.dart';
import 'package:flexi/features/shop/controllers/brand_controller.dart';
import 'package:flexi/features/shop/controllers/product_controllers/product_controller.dart';
import 'package:flexi/features/shop/models/category_model.dart';
import 'package:flexi/utils/constants/sizes.dart';
import 'package:flexi/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({super.key, required this.category});

  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return FutureBuilder(
      future: controller.getBrandsForCategory(category.id),
      builder: (context, snapshot) {
        // Handle Loader
        const loader = Column(
          children: [
            CustomListTileShimmer(),
            SizedBox(
              height: CSizes.spaceBtwItems,
            ),
            CustomBoxesShimmer(),
            SizedBox(
              height: CSizes.spaceBtwItems,
            ),
          ],
        );

        final widget = UCloudHelperFunctions.checkMultiRecordState(
            snapshot: snapshot, loader: loader);

        if (widget != null) return widget;

        // Brands found
        final brands = snapshot.data!;
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: brands.length,
          itemBuilder: (context, index) {
            final brand = brands[index];
            return FutureBuilder(
              future: ProductController.instance
                  .getProductsOfABrand(brandId: brand.id, limit: 3),
              builder: (context, snapshot) {
                // Handle waiting and error
                final widget = UCloudHelperFunctions.checkMultiRecordState(
                    snapshot: snapshot, loader: loader);

                if (widget != null) {
                  return widget;
                }

                // Found images of this brand
                final images = // map each product to its thumbnail
                    snapshot.data!.map((product) => product.thumbnail).toList();
                return CustomBrandShowCase(images: images, brand: brand);
              },
            );
          },
        );
      },
    );
  }
}
