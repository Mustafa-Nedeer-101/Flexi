import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flexi/common/widgets/loaders/loaders.dart';
import 'package:flexi/data/repositories/products/products_repo.dart';
import 'package:flexi/features/shop/models/product_model.dart';
import 'package:get/get.dart';

class AllProductsController extends GetxController {
  static AllProductsController get instance => Get.find();

  // Variables
  final productRepo = ProductRepo.instance;
  final RxString selectedSortOption = 'Name'.obs;
  RxList<ProductModel> products = <ProductModel>[].obs;

  // Fetch products by query
  Future<List<ProductModel>> fetchProductsByQuery(Query? query) async {
    try {
      // Query is null
      if (query == null) {
        return Future(
          () => [],
        );
      }

      // Excute query
      List<ProductModel> productList =
          await productRepo.getProductsByQuery(query);

      return productList;
    } catch (e) {
      CustomLoaders.errorSnackbar(title: 'Oh Snap!', message: e.toString());
      return Future(() => []);
    }
  }

  // Sort products by a sort option
  void sortProducts(String sortOption) {
    selectedSortOption.value = sortOption;

    // ['Name', 'Higher Price', 'Lower Price', 'Sale', 'Newest', 'Popularity']

    switch (sortOption) {
      case 'Name':
        products.sort((a, b) => a.title.compareTo(b.title));
        break;
      case 'Higher Price':
        products.sort((a, b) => b.price.compareTo(a.price));
        break;
      case 'Lower Price':
        products.sort((a, b) => a.price.compareTo(b.price));
        break;
      case 'Newest':
        products.sort((a, b) => a.date!.compareTo(b.date!));
        break;
      case 'Sale':
        products.sort((a, b) {
          if (b.salePrice > 0) {
            return b.salePrice.compareTo(a.salePrice);
          } else if (a.salePrice > 0) {
            return -1;
          } else {
            return 1;
          }
        });
        break;
      default:
        // Default sorting option: Name
        products.sort((a, b) => a.title.compareTo(b.title));
    }
  }

  // Assign Products
  void assignProducts(List<ProductModel> products) {
    this.products.assignAll(products);
    sortProducts('Name');
  }
}
