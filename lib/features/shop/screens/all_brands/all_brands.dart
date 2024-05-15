import 'package:flexi/common/widgets/appbar/appbar.dart';
import 'package:flexi/common/widgets/brands/brand_card.dart';
import 'package:flexi/common/widgets/layouts/grid_layout.dart';
import 'package:flexi/common/widgets/shimmers/brand_shimmer.dart';
import 'package:flexi/common/widgets/texts/section_header.dart';
import 'package:flexi/features/shop/controllers/brand_controller.dart';
import 'package:flexi/utils/constants/colors.dart';
import 'package:flexi/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;

    return Scaffold(
      appBar: const CustomAppBar(
        title: Text('Featured Brands'),
        showBackArrow: true,
      ),

      // Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: Column(
            children: [
              const CustomSectionHeader(
                title: 'Brands',
                showActionButton: false,
              ),
              const SizedBox(
                height: CSizes.spaceBtwItems,
              ),

              // Grid
              Obx(
                () {
                  // Still waiting
                  if (controller.isLoading.value) {
                    return const CustomBrandShimmer();
                  }

                  // No brands found
                  if (controller.allBrands.isEmpty) {
                    return Center(
                      child: Text(
                        'No Data Found',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .apply(color: CColors.black),
                      ),
                    );
                  }

                  // Brands exist
                  return CustomGridLayout(
                    itemCount: controller.allBrands.length,
                    mainAxisExtent: 90,
                    itemBuilder: (context, index) {
                      final thisBrand = controller.allBrands[index];
                      return CustomBrandCard(
                        brand: thisBrand,
                        showBorder: true,
                      );
                    },
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
