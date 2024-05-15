import 'package:flexi/common/widgets/loaders/loaders.dart';
import 'package:flexi/common/widgets/texts/section_header.dart';
import 'package:flexi/data/repositories/address/address_repo.dart';
import 'package:flexi/features/personalization/models/address_model.dart';
import 'package:flexi/features/personalization/screens/address/add_new_address.dart';
import 'package:flexi/features/personalization/screens/address/widgets/single_address.dart';
import 'package:flexi/utils/constants/colors.dart';
import 'package:flexi/utils/constants/image_strings.dart';
import 'package:flexi/utils/constants/sizes.dart';
import 'package:flexi/utils/controllers/network_manager.dart';
import 'package:flexi/utils/helpers/cloud_helper_functions.dart';
import 'package:flexi/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  // Variables
  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final street = TextEditingController();
  final postalCode = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final country = TextEditingController();
  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();

  RxBool refreshData = true.obs;
  final addressRepo = Get.put(AddressRepo());
  final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;

  // Return all user specific addresses
  Future<List<AddressModel>> getUserAddresses() async {
    try {
      final addresses = await addressRepo.getUserAddresses();
      selectedAddress.value = addresses.firstWhere(
        (element) => element.isSelectedAddress,
        orElse: () => AddressModel.empty(),
      );
      return addresses;
    } catch (e) {
      CustomLoaders.errorSnackbar(
          title: 'Address Not Found', message: e.toString());
      return Future(() => []);
    }
  }

  // Select the current address
  Future selectAddress(AddressModel newSelectedAddress) async {
    try {
      // Loader
      Get.defaultDialog(
          title: '',
          onWillPop: () async {
            return false;
          },
          barrierDismissible: false,
          backgroundColor: Colors.transparent,
          content: const CircularProgressIndicator(
            backgroundColor: CColors.primary,
            color: CColors.white,
          ));

      // clear the selected field
      if (selectedAddress.value.id.isNotEmpty) {
        await addressRepo.updateSelectedField(selectedAddress.value.id, false);
      }

      // Assign selected address
      newSelectedAddress.isSelectedAddress = true;
      selectedAddress.value = newSelectedAddress;

      // Set isSelected Field to true for the newly selected address
      await addressRepo.updateSelectedField(newSelectedAddress.id, true);

      Navigator.of(Get.overlayContext!).pop();
    } catch (e) {
      Navigator.of(Get.overlayContext!).pop();
      CustomLoaders.errorSnackbar(
          title: 'Error in selection', message: e.toString());
    }
  }

  // Add new address to collection of address
  Future addNewAddress() async {
    try {
      // Start Loading
      UFullSreenLoader.openLoadingDialog('Storing Address...', CImages.loading);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        UFullSreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!addressFormKey.currentState!.validate()) {
        UFullSreenLoader.stopLoading();
        return;
      }

      // Store address
      final address = AddressModel(
          id: '',
          name: name.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          street: street.text.trim(),
          postalCode: postalCode.text.trim(),
          city: city.text.trim(),
          state: state.text.trim(),
          country: country.text.trim(),
          isSelectedAddress: true);
      final addressId = await addressRepo.addNewAddress(address);

      address.id = addressId;

      await addressRepo.updateIdOfAddress(addressId);

      await selectAddress(address);

      // Remove Loader
      UFullSreenLoader.stopLoading();

      // Display success message
      CustomLoaders.successSnackbar(
          title: "Done", message: 'Your address has been saved successfully.');

      // Refresh addresses data
      refreshData.toggle();

      // Reset fields
      resetFormFields();

      Get.back();
      Navigator.of(Get.context!).pop();
    } catch (e) {
      UFullSreenLoader.stopLoading();
      CustomLoaders.errorSnackbar(
          title: 'Address not found', message: e.toString());
    }
  }

  // Reset
  void resetFormFields() {
    name.clear();
    phoneNumber.clear();
    state.clear();
    postalCode.clear();
    city.clear();
    state.clear();
    country.clear();
    addressFormKey.currentState?.reset();
  }

  // Show addresses modalbottomsheer at checkout
  Future<dynamic> selectNewAddressPopup(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) => SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(CSizes.lg),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomSectionHeader(
                        title: 'Select Address',
                        showActionButton: false,
                      ),
                      FutureBuilder(
                        future: getUserAddresses(),
                        builder: (context, snapshot) {
                          // Handle Error and loader
                          final widget =
                              UCloudHelperFunctions.checkMultiRecordState(
                                  snapshot: snapshot);
                          if (widget != null) return widget;

                          // Found Address
                          final addresses = snapshot.data!;
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: addresses.length,
                            itemBuilder: (context, index) => SingleAddress(
                                address: addresses[index],
                                onTap: () async {
                                  await selectAddress(addresses[index]);
                                  Get.back();
                                }),
                          );
                        },
                      ),
                      const SizedBox(
                        height: CSizes.defaultSpace * 2,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () =>
                                Get.to(() => const AddNewAddressScree()),
                            child: const Text('Add new address')),
                      )
                    ]),
              ),
            ));
  }

  // Address String
  @override
  String toString() {
    return "${selectedAddress.value.street}, ${selectedAddress.value.city}, ${selectedAddress.value.state}, ${selectedAddress.value.country}";
  }
}
