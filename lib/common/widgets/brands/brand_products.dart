import 'package:flexi/common/widgets/appbar/appbar.dart';
import 'package:flexi/common/widgets/brands/brand_card.dart';
import 'package:flexi/common/widgets/products/sortable/sortable_products.dart';
import 'package:flexi/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:flexi/features/shop/controllers/product_controllers/product_controller.dart';
import 'package:flexi/features/shop/models/brand_model.dart';
import 'package:flexi/utils/constants/sizes.dart';
import 'package:flexi/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';

class BrandProductsScreen extends StatelessWidget {
  const BrandProductsScreen({super.key, this.title, required this.brand});

  final String? title;
  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(title ?? brand.name),
        showBackArrow: true,
      ),

      // Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: Column(
            children: [
              // Card
              CustomBrandCard(
                brand: brand,
              ),

              const SizedBox(
                height: CSizes.spaceBtwSections,
              ),

              // Brand Products
              FutureBuilder(
                // Get all products of this brand
                future: ProductController.instance
                    .getProductsOfABrand(brandId: brand.id),
                builder: (context, snapshot) {
                  const loader = CustomVerticalProductShimmer();

                  final widget = UCloudHelperFunctions.checkMultiRecordState(
                      snapshot: snapshot, loader: loader);

                  if (widget != null) return widget;

                  // Products Found
                  return CustomSortableProducts(
                    products: snapshot.data!,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
