import 'package:flexi/common/widgets/loaders/loaders.dart';
import 'package:flexi/data/repositories/banners/banners_repo.dart';
import 'package:flexi/features/shop/models/banner_model.dart';
import 'package:get/get.dart';

class BannerController extends GetxController {
  static BannerController get instance => Get.find();

  // onInit
  @override
  void onInit() {
    super.onInit();
    fetchBanners();
  }

  // Variables
  final carouselCurrentIndex = 0.obs;
  final isLoading = false.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;

  // Update page navigation dots
  void updatePageIndicator(index) {
    carouselCurrentIndex.value = index;
  }

  // Fetch banners
  Future<void> fetchBanners() async {
    try {
      // Start Loading
      isLoading.value = true;

      // Fetch banners
      final bannerRepo = Get.put(BannerRepo());
      final banners = await bannerRepo.fetchBanners();

      // Assign Banners
      this.banners.assignAll(banners);

      return;
    } catch (e) {
      // Show Some Generic Error To The User
      CustomLoaders.errorSnackbar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
