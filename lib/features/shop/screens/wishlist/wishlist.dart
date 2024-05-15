import 'package:flexi/common/widgets/appbar/appbar.dart';
import 'package:flexi/common/widgets/icons/circular_icon.dart';
import 'package:flexi/common/widgets/layouts/grid_layout.dart';
import 'package:flexi/common/widgets/loaders/animation_loader.dart';
import 'package:flexi/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:flexi/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:flexi/features/shop/controllers/product_controllers/product_controller.dart';
import 'package:flexi/features/shop/controllers/product_controllers/wishlist_controller.dart';
import 'package:flexi/features/shop/screens/all_products/all_products.dart';
import 'package:flexi/navigation_menu.dart';
import 'package:flexi/utils/constants/image_strings.dart';
import 'package:flexi/utils/constants/sizes.dart';
import 'package:flexi/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = WishlistController.instance;

    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: false,
        title: Text(
          "Wishlist",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          CustomCircularIcon(
            icon: Iconsax.add,
            onPressed: () {
              Get.to(() => AllProductsScreen(
                    title: 'All Products',
                    futureMethod:
                        ProductController.instance.getAllFeaturedProducts(),
                  ));
            },
          )
        ],
      ),

      // body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: Column(
            children: [
              // Future builder
              Obx(
                () => FutureBuilder(
                  future: controller.getfavouriteProducts(),
                  builder: (context, snapshot) {
                    /// ...Handling Error and Waiting

                    // Nothig found widget
                    final emptyWishlist = CustomAnimationLoaderWidget(
                        text: "Whoops! Wishlist is Empty",
                        animation: CImages.emptyWishlist,
                        showAction: true,
                        actionText: "Lets's add some",
                        onActionPressed: () {
                          NavigationMenuController.instance.updateIndex(0);
                          Get.off(() => const NavigationMenu());
                        });

                    // loader
                    const loader = CustomVerticalProductShimmer(
                      itemCount: 6,
                    );

                    final widget = UCloudHelperFunctions.checkMultiRecordState(
                        snapshot: snapshot,
                        loader: loader,
                        nothingFound: emptyWishlist);

                    if (widget != null) return widget;

                    // Products Found
                    final products = snapshot.data!;
                    return CustomGridLayout(
                        itemCount: controller.favourites.length,
                        itemBuilder: (_, index) => CustomProductCardVertical(
                            product: products[index]));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
