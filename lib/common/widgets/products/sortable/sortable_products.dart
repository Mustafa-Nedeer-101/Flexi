import 'package:flexi/common/widgets/layouts/grid_layout.dart';
import 'package:flexi/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:flexi/features/shop/controllers/product_controllers/all_products_controller.dart';
import 'package:flexi/features/shop/models/product_model.dart';
import 'package:flexi/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSortableProducts extends StatelessWidget {
  const CustomSortableProducts({
    super.key,
    required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());
    controller.assignProducts(products);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: CSizes.defaultSpace),
        child: Column(
          children: [
            // Drop Down
            DropdownButtonFormField(
                onChanged: (value) {
                  controller.sortProducts(value ?? 'Name');
                },
                value: controller.selectedSortOption.value,
                items: [
                  'Name',
                  'Higher Price',
                  'Lower Price',
                  'Sale',
                  'Newest',
                  'Popularity'
                ]
                    .map(
                      (option) => DropdownMenuItem(
                        value: option,
                        child: Text(option),
                      ),
                    )
                    .toList()),

            const SizedBox(
              height: CSizes.spaceBtwSections,
            ),
            // Grid View
            Obx(
              () => CustomGridLayout(
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) => CustomProductCardVertical(
                        product: controller.products[index],
                      )),
            ),
          ],
        ),
      ),
    );
  }
}
