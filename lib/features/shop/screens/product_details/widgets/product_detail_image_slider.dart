import 'package:cached_network_image/cached_network_image.dart';
import 'package:flexi/common/widgets/appbar/appbar.dart';
import 'package:flexi/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:flexi/common/widgets/images/rounded_image.dart';
import 'package:flexi/common/widgets/products/favourite_icon/favourite_icon.dart';
import 'package:flexi/features/shop/controllers/product_controllers/images_controller.dart';
import 'package:flexi/features/shop/models/product_model.dart';
import 'package:flexi/utils/constants/colors.dart';
import 'package:flexi/utils/constants/sizes.dart';
import 'package:flexi/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailImageSlider extends StatelessWidget {
  const ProductDetailImageSlider({super.key, required this.product});

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    bool dark = UHelperFunctions.isDarkMode(context);
    final ImagesController controller = Get.put(ImagesController());
    final images = controller.getAllProductImages(product);
    return CustomCurvedEdgesWidget(
      child: Container(
        color:
            dark ? CColors.darkerGrey : const Color.fromRGBO(246, 246, 246, 1),
        child: Stack(
          children: [
            // Main Large Image
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(CSizes.productImageRadius * 2),
                child: Center(
                  child: Obx(() {
                    final image = controller.selectedProductImage.value;
                    return GestureDetector(
                      onTap: () => controller.showEnlaredImage(image),
                      child: CachedNetworkImage(
                        imageUrl: image,
                        progressIndicatorBuilder: (context, url, progress) =>
                            CircularProgressIndicator(
                          value: progress.progress,
                          color: CColors.primary,
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),

            // Image Slider
            Positioned(
              right: 0,
              bottom: 30,
              left: CSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) => const SizedBox(
                    width: CSizes.spaceBtwItems,
                  ),
                  itemCount: images.length,
                  itemBuilder: (_, index) => Obx(() {
                    // if this Image is the selected one
                    final isImageSelected =
                        controller.selectedProductImage.value == images[index];
                    return CustomRoundedImage(
                      width: 80,
                      isNetworkImage: true,
                      backgroundColor: dark ? CColors.dark : CColors.white,
                      border: Border.all(
                          color: isImageSelected
                              ? CColors.primary
                              : Colors.transparent),
                      padding: const EdgeInsets.all(CSizes.sm),
                      imageUrl: images[index],
                      onPressed: () =>
                          controller.selectedProductImage.value = images[index],
                    );
                  }),
                ),
              ),
            ),

            // AppBar icons
            CustomAppBar(
              showBackArrow: true,
              actions: [
                CustomFavouriteIcon(
                  productId: product.id,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
