import 'package:flexi/common/widgets/loaders/animation_loader.dart';
import 'package:flexi/features/shop/controllers/product_controllers/order_controller.dart';
import 'package:flexi/features/shop/screens/orders/widgets/order_item.dart';
import 'package:flexi/navigation_menu.dart';
import 'package:flexi/utils/constants/image_strings.dart';
import 'package:flexi/utils/constants/sizes.dart';
import 'package:flexi/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderListItems extends StatelessWidget {
  const OrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderController());

    return FutureBuilder(
        future: controller.getUserOrders(),
        builder: (context, snapshot) {
          // Handle Nothing
          final widget = CustomAnimationLoaderWidget(
            text: 'Whoops! No orders yet!',
            animation: CImages.orderCompleted,
            showAction: true,
            actionText: "Let's fill it",
            onActionPressed: () => Get.off(() => const NavigationMenu()),
          );

          final response = UCloudHelperFunctions.checkMultiRecordState(
              snapshot: snapshot, nothingFound: widget);
          if (response != null) return response;

          // Found Data
          final orders = snapshot.data!;
          return ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: orders.length,
            separatorBuilder: (context, index) => const SizedBox(
              height: CSizes.spaceBtwItems,
            ),
            itemBuilder: (context, index) {
              final order = orders[index];

              return OrderItem(order: order);
            },
          );
        });
  }
}
