import 'package:flexi/common/widgets/loaders/loaders.dart';
import 'package:flexi/data/repositories/brands/brands_repo.dart';
import 'package:flexi/features/shop/models/brand_model.dart';
import 'package:get/get.dart';

class BrandController extends GetxController {
  static BrandController get instance => Get.find();

  // Variables
  final brandsRepo = Get.put(BrandsRepo());
  RxBool isLoading = true.obs;
  final RxList<BrandModel> featuredBrands = <BrandModel>[].obs;
  final RxList<BrandModel> allBrands = <BrandModel>[].obs;

  @override
  void onInit() {
    fetchAllBrands();
    super.onInit();
  }

  // Get Brands for Category
  Future<List<BrandModel>> getBrandsForCategory(String categoryId) async {
    try {
      // call brand repository
      final brands = brandsRepo.getBrandsForCategory(categoryId);

      return brands;
    } catch (e) {
      CustomLoaders.errorSnackbar(title: 'Oh Snap');
      return Future(() => []);
    }
  }

  // Load All Brands
  Future<void> fetchAllBrands() async {
    try {
      // Start Loading
      isLoading.value = true;

      // Fetch Brands
      final List<BrandModel> brands = await brandsRepo.getAllBrands();

      // Store All Brands
      allBrands.assignAll(brands);

      // Store featured brands
      featuredBrands
          .assignAll(allBrands.where((brand) => brand.isFeatured ?? false));
    } catch (e) {
      // Show Some Generic Error To The User
      CustomLoaders.errorSnackbar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
