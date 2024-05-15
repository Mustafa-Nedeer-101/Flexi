import 'package:flexi/features/personalization/controllers/address/address_controller.dart';
import 'package:flexi/features/shop/controllers/product_controllers/checkout_controller.dart';
import 'package:flexi/features/shop/controllers/product_controllers/variation_controller.dart';
import 'package:flexi/utils/controllers/network_manager.dart';
import 'package:get/get.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(VariationController());
    Get.put(AddressController());
    Get.put(CheckoutController());
  }
}
