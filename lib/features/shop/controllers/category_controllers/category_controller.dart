import 'package:flexi/common/widgets/loaders/loaders.dart';
import 'package:flexi/data/repositories/categories/category_repo.dart';
import 'package:flexi/data/repositories/products/products_repo.dart';
import 'package:flexi/features/shop/models/category_model.dart';
import 'package:flexi/features/shop/models/product_model.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  // Variables
  final RxBool isLoading = false.obs;
  final _categoryRepo = Get.put(CategoryRepo());
  final RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  final RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() async {
    await fetchCategories();
    super.onInit();
  }

  // Load category data
  Future<void> fetchCategories() async {
    try {
      // Start Loading
      isLoading.value = true;

      // Fetch categories from data source (Firebase, API, etc.)
      final categories = await _categoryRepo.getAllCategories();

      // Update the categories list
      allCategories.assignAll(categories);

      // Filter featured categories
      featuredCategories.assignAll(categories
          .where((category) => category.isFeatured && category.parentId.isEmpty)
          .take(8)
          .toList());

      return;
    } catch (e) {
      // Show Some Generic Error To The User
      CustomLoaders.errorSnackbar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // Load selected category data
  Future<List<CategoryModel>> getSubCategories(String categoryId) async {
    try {
      return await CategoryRepo.instance.getSubCategories(categoryId);
    } catch (e) {
      CustomLoaders.errorSnackbar(title: "Oh Snap", message: e.toString());
      return Future(() => []);
    }
  }

  // Get category or Sub-category products
  Future<List<ProductModel>> getCategoryProducts(
      {required String categoryId, int limit = 4}) async {
    try {
      // Return 4 produts against each subCategory
      final products = await ProductRepo.instance
          .getProductsforCategory(categoryId: categoryId, limit: limit);

      return products;
    } catch (e) {
      CustomLoaders.errorSnackbar(title: "Oh Snap", message: e.toString());
      return Future(() => []);
    }
  }
}
