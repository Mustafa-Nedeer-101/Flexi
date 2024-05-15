import 'package:flexi/common/widgets/icons/circular_icon.dart';
import 'package:flexi/features/shop/controllers/product_controllers/wishlist_controller.dart';
import 'package:flexi/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CustomFavouriteIcon extends StatelessWidget {
  const CustomFavouriteIcon({super.key, required this.productId});

  final String productId;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(WishlistController());
    return Obx(() {
      final inFavourits = controller.isInFavourites(productId);
      return CustomCircularIcon(
        onPressed: () {
          controller.toggleFavouriteProduct(productId);
        },
        icon: inFavourits ? Iconsax.heart5 : Iconsax.heart,
        color: inFavourits ? CColors.error : null,
      );
    });
  }
}
