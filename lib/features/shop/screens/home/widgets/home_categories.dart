import 'package:flexi/common/widgets/shimmers/category_shimmer.dart';
import 'package:flexi/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:flexi/features/shop/controllers/category_controllers/category_controller.dart';
import 'package:flexi/features/shop/screens/sub_category/sub_category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());

    return Obx(() {
      if (categoryController.isLoading.value) {
        return const CustomCategoryShimmer();
      }

      if (categoryController.featuredCategories.isEmpty) {
        return Center(
          child: Text(
            'No Data Found',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .apply(color: Colors.white),
          ),
        );
      }

      return SizedBox(
        height: 80,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: categoryController.featuredCategories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final category = categoryController.featuredCategories[index];

            return CustomVerticalImageText(
              image: category.image,
              title: category.name,
              isNetworkImage: true,
              onTap: () => Get.to(() => SubCategoryScreen(
                    category: category,
                  )),
            );
          },
        ),
      );
    });
  }
}
