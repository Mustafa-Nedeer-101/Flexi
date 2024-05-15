import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flexi/common/widgets/appbar/appbar.dart';
import 'package:flexi/common/widgets/products/sortable/sortable_products.dart';
import 'package:flexi/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:flexi/features/shop/controllers/product_controllers/all_products_controller.dart';
import 'package:flexi/features/shop/models/product_model.dart';
import 'package:flexi/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen(
      {super.key, required this.title, this.query, this.futureMethod});

  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          title,
        ),
        showBackArrow: true,
      ),

      // Body
      body: FutureBuilder(
        future: futureMethod ?? controller.fetchProductsByQuery(query),
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
      ),
    );
  }
}
