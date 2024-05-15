import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flexi/common/widgets/loaders/loaders.dart';
import 'package:flexi/data/repositories/products/products_repo.dart';
import 'package:flexi/features/shop/models/product_model.dart';
import 'package:flexi/utils/constants/enums.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  // Variables
  final RxBool isLoading = false.obs;
  final _productRepo = Get.put(ProductRepo());
  final RxList<ProductModel> featuredProducts = <ProductModel>[].obs;

  @override
  void onInit() async {
    await fetchFeaturedProducts();
    super.onInit();
  }

  // Load 4 Products data
  Future<void> fetchFeaturedProducts() async {
    try {
      // Start Loading
      isLoading.value = true;

      // Fetch Products from data source (Firebase, API, etc.)
      final products = await _productRepo.getfeaturedProducts();

      // Assign Products
      featuredProducts.assignAll(products);

      return;
    } catch (e) {
      // Show Some Generic Error To The User
      CustomLoaders.errorSnackbar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // Return All featured products data
  Future<List<ProductModel>> getAllFeaturedProducts() async {
    try {
      // Fetch Products from data source (Firebase, API, etc.)
      final products = await _productRepo.getAllfeaturedProducts();

      return products;
    } catch (e) {
      // Show Some Generic Error To The User
      CustomLoaders.errorSnackbar(title: 'Oh Snap!', message: e.toString());
      return Future(() => []);
    }
  }

  // Return All featured products data
  Future<List<ProductModel>> getProductsOfABrand(
      {required String brandId, int limit = -1}) async {
    try {
      // Fetch Products from data source (Firebase, API, etc.)
      final products = limit == -1
          ? await _productRepo.getProductsByQuery(FirebaseFirestore.instance
              .collection('Products')
              .where('Brand.Id', isEqualTo: brandId))
          : await _productRepo.getProductsByQuery(FirebaseFirestore.instance
              .collection('Products')
              .where('Brand.Id', isEqualTo: brandId)
              .limit(limit));

      return products;
    } catch (e) {
      // Show Some Generic Error To The User
      CustomLoaders.errorSnackbar(title: 'Oh Snap!', message: e.toString());
      return Future(() => []);
    }
  }

  // Get the product price or price range for variations.
  String getProductPrice(ProductModel product) {
    double smallestPrice = double.infinity;
    double largetPrice = 0.0;

    // if no variabtion exist, return the simple price or sale price
    if (product.productType == ProductType.single.toString()) {
      return (product.salePrice > 0 ? product.salePrice : product.price)
          .toString();
    } else {
      // Calculate the smallest and largest prices among variations
      for (var variation in product.productVariations!) {
        // Determine the price to consider (sale price or regular)
        double priceToConsider =
            variation.salePrice > 0.0 ? variation.salePrice : variation.price;

        // Update smallest and largest
        if (priceToConsider < smallestPrice) {
          smallestPrice = priceToConsider;
        }

        if (priceToConsider > largetPrice) {
          largetPrice = priceToConsider;
        }
      }

      // smallest and largest are the same
      if (smallestPrice.isEqual(largetPrice)) {
        return largetPrice.toString();
      } else {
        return '$smallestPrice - \$$largetPrice';
      }
    }
  }

  // Calculate discount percentage
  String? calculateSalePersentage(double originalPrice, double? salePrice) {
    if (salePrice == null || salePrice <= 0.0) return null;
    if (originalPrice <= 0) return null;

    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;

    return percentage.toStringAsFixed(0);
  }

  // Check product stock status
  String getProductStockStatus(int stock) {
    return stock > 0 ? 'In Stock' : 'Out of Stock';
  }
}
