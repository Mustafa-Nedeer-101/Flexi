import 'dart:convert';

import 'package:flexi/common/widgets/loaders/loaders.dart';
import 'package:flexi/data/repositories/products/products_repo.dart';
import 'package:flexi/features/shop/models/product_model.dart';
import 'package:flexi/utils/local_storage/sorage_utility.dart';
import 'package:get/get.dart';

class WishlistController extends GetxController {
  static WishlistController get instance => Get.find();

  // Vraibles
  final favourites = <String, bool>{}.obs;

  @override
  void onInit() {
    initFavourites();
    super.onInit();
  }

  // Initialize favourites by reading from storage
  Future<void> initFavourites() async {
    final json = ULocalStorage.instance().readData("Favourites");

    if (json != null) {
      final storedFavourites = jsonDecode(json) as Map<String, dynamic>;

      favourites.assignAll(
          storedFavourites.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  // Check if product is in favourites
  bool isInFavourites(String productId) {
    return favourites[productId] ?? false;
  }

  // Toggle favourites icon
  void toggleFavouriteProduct(String productId) {
    if (!favourites.containsKey(productId)) {
      favourites[productId] = true;
      saveFavouritesToStorage();
      CustomLoaders.customToast(
          message: 'Product has been added to the Wishlist');
    } else {
      ULocalStorage.instance().removeData(productId);
      favourites.remove(productId);
      saveFavouritesToStorage();
      favourites.refresh();
      CustomLoaders.customToast(
          message: 'Product has been removed from the Wishlist');
    }
  }

  void saveFavouritesToStorage() {
    final encodedFavourites = json.encode(favourites);
    ULocalStorage.instance().saveData("Favourites", encodedFavourites);
  }

  Future<List<ProductModel>> getfavouriteProducts() async {
    return await ProductRepo.instance
        .getFavouritProducts(favourites.keys.toList());
  }
}
