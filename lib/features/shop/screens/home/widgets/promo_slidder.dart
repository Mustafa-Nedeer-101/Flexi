import 'package:carousel_slider/carousel_slider.dart';
import 'package:flexi/common/widgets/shimmers/shimmer.dart';
import 'package:flexi/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:flexi/common/widgets/images/rounded_image.dart';
import 'package:flexi/features/shop/controllers/banner_controller.dart';
import 'package:flexi/utils/constants/colors.dart';
import 'package:flexi/utils/constants/image_strings.dart';
import 'package:flexi/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePromoSlider extends StatelessWidget {
  const HomePromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final BannerController controller = Get.put(BannerController());
    return Obx(() {
      // Loading
      if (controller.isLoading.value) {
        return const CustomShimmerEffect(
          width: double.infinity,
          height: 190,
        );
      }

      // No Banners Found
      if (controller.banners.isEmpty) {
        return const Center(
            child: CustomRoundedImage(imageUrl: CImages.promoBannerOne));
      }

      // There exists banners
      return Column(
        children: [
          CarouselSlider(
              items: controller.banners
                  .map((banner) => CustomRoundedImage(
                        fit: BoxFit.fill,
                        imageUrl: banner.image,
                        isNetworkImage: true,
                        onPressed: () => Get.toNamed(banner.targetScreen),
                      ))
                  .toList(),
              options: CarouselOptions(
                  viewportFraction: 1,
                  onPageChanged: (index, _) =>
                      controller.updatePageIndicator(index))),
          // Space
          const SizedBox(
            height: CSizes.spaceBtwItems,
          ),

          Obx(() => Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                for (int i = 0; i < controller.banners.length; i++)
                  CustomCircularContainer(
                    backgroundColor: i == controller.carouselCurrentIndex.value
                        ? CColors.primary
                        : CColors.grey,
                    width: 20,
                    height: 4,
                    margin: const EdgeInsets.only(right: CSizes.spaceBtwItems),
                  ),
              ])),
        ],
      );
    });
  }
}
