// ignore_for_file: prefer_const_constructors, unused_import
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flexi/common/widgets/appbar/appbar.dart';
import 'package:flexi/common/widgets/texts/section_header.dart';
import 'package:flexi/data/dummy_data/dummy_data.dart';
import 'package:flexi/data/repositories/address/address_repo.dart';
import 'package:flexi/data/repositories/authentication/authentication_repo.dart';
import 'package:flexi/data/repositories/banners/banners_repo.dart';
import 'package:flexi/data/repositories/brands/brands_repo.dart';
import 'package:flexi/data/repositories/categories/category_repo.dart';
import 'package:flexi/data/repositories/products/products_repo.dart';
import 'package:flexi/data/repositories/relationships/brand_category_repo.dart';
import 'package:flexi/data/repositories/relationships/product_category_repo.dart';
import 'package:flexi/features/personalization/controllers/address/address_controller.dart';
import 'package:flexi/features/personalization/models/address_model.dart';
import 'package:flexi/features/personalization/screens/upload_data/widgets/setting_menu_tile.dart';
import 'package:flexi/features/shop/models/order_model.dart';
import 'package:flexi/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UploadDataScreen extends StatelessWidget {
  const UploadDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text(
          'Upload Data',
        ),
        showBackArrow: true,
      ),

      // Body
      body: Padding(
        padding: const EdgeInsets.all(CSizes.defaultSpace),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Main Record Section

              // Header
              const CustomSectionHeader(
                title: 'Main Record',
                showActionButton: false,
              ),

              const SizedBox(
                height: CSizes.spaceBtwItems,
              ),

              // Upload Categories
              CustomSettingMenuTile(
                icon: Iconsax.category,
                title: 'Upload Categories',
                trailing: const Icon(Iconsax.arrow_circle_up),
                onTap: () =>
                    CategoryRepo.instance.uploadDummyData(DummyData.categories),
              ),

              // Upload Brands
              CustomSettingMenuTile(
                icon: Iconsax.shop,
                title: 'Upload Brands',
                trailing: const Icon(Iconsax.arrow_circle_up),
                onTap: () async {
                  BrandsRepo.instance.uploadDummyData(DummyData.brands);
                },
              ),

              // Upload Products
              CustomSettingMenuTile(
                icon: Iconsax.shopping_cart,
                title: 'Upload Products',
                trailing: const Icon(Iconsax.arrow_circle_up),
                onTap: () =>
                    ProductRepo.instance.uploadDummyDataTest(DummyData.zara),
              ),

              // Upload Banners
              CustomSettingMenuTile(
                icon: Iconsax.image,
                title: 'Upload Banners',
                trailing: const Icon(Iconsax.arrow_circle_up),
                onTap: () =>
                    BannerRepo.instance.uploadDummyData(DummyData.banners),
              ),

              // Testing
              CustomSettingMenuTile(
                  icon: Iconsax.image,
                  title: 'Test',
                  trailing: const Icon(Iconsax.arrow_circle_up),
                  onTap: () async {}),

              // Relationships Section
              const SizedBox(
                height: CSizes.spaceBtwItems,
              ),
              const CustomSectionHeader(
                title: 'Relationships',
                showActionButton: false,
              ),

              const Text(
                  'Make sure you have already uploaded all the content above.'),

              const SizedBox(
                height: CSizes.spaceBtwItems,
              ),

              // Upload BrandCategory
              CustomSettingMenuTile(
                icon: Iconsax.blend,
                title: 'Upload Brands & Categories Relation Data',
                trailing: Icon(Iconsax.arrow_circle_up),
                onTap: () {
                  Get.put(BrandCategoryRepo());
                  BrandCategoryRepo.instance
                      .uploadDummyData(DummyData.brandCat);
                },
              ),

              // Upload ProductCategory
              CustomSettingMenuTile(
                icon: Iconsax.blend,
                title: 'Upload Product Categories Relation Data',
                trailing: Icon(Iconsax.arrow_circle_up),
                onTap: () => ProductCategoryRepo.instance
                    .uploadDummyData(DummyData.productCat),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
