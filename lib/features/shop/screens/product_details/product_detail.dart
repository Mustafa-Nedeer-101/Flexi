import 'package:flexi/common/widgets/texts/section_header.dart';
import 'package:flexi/features/shop/models/product_model.dart';
import 'package:flexi/features/shop/screens/cart/cart.dart';
import 'package:flexi/features/shop/screens/product_details/widgets/bottom_add_to_cart.dart';
import 'package:flexi/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:flexi/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:flexi/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:flexi/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:flexi/features/shop/screens/reviews_ratings/reviews_ratings.dart';
import 'package:flexi/utils/constants/colors.dart';
import 'package:flexi/utils/constants/enums.dart';
import 'package:flexi/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Bottom
      bottomNavigationBar: ProductDetailBottomAddToCart(
        product: product,
      ),
      // body
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Image Slider Section
            ProductDetailImageSlider(
              product: product,
            ),

            // Product Details Section
            Padding(
              padding: const EdgeInsets.only(
                  right: CSizes.defaultSpace,
                  left: CSizes.defaultSpace,
                  bottom: CSizes.defaultSpace),
              child: Column(
                children: [
                  // Rating and share button
                  const ProductDetailRatingAndShare(),

                  // price title stock brand
                  ProductDetailMetaData(
                    product: product,
                  ),

                  // attributes
                  if (product.productType == ProductType.variable.toString())
                    ProductDetailAttributes(product: product),

                  if (product.productType == ProductType.variable.toString())
                    const SizedBox(
                      height: CSizes.spaceBtwSections,
                    ),

                  // Checkout Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          Get.to(() => const CartScreen());
                        },
                        child: const Text('Checkout')),
                  ),

                  const SizedBox(
                    height: CSizes.spaceBtwItems,
                  ),

                  // Description
                  const CustomSectionHeader(
                    title: 'Description',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: CSizes.spaceBtwItems / 2,
                  ),
                  ReadMoreText(
                    product.description ?? '',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: ' Less',
                    moreStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: CColors.primary),
                    lessStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: CColors.primary),
                  ),

                  const Divider(),

                  // Review
                  const SizedBox(
                    height: CSizes.spaceBtwItems,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomSectionHeader(
                        title: 'Reviews (261)',
                        showActionButton: false,
                      ),
                      IconButton(
                          onPressed: () {
                            Get.to(() => const ReviewsRatingsScreen());
                          },
                          icon: const Icon(
                            Iconsax.arrow_right_3,
                            size: 18,
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: CSizes.spaceBtwSections,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
