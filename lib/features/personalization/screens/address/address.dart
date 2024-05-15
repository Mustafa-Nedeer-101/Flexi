import 'package:flexi/common/widgets/appbar/appbar.dart';
import 'package:flexi/common/widgets/loaders/animation_loader.dart';
import 'package:flexi/common/widgets/shimmers/address_shimmer.dart';
import 'package:flexi/features/personalization/controllers/address/address_controller.dart';
import 'package:flexi/features/personalization/screens/address/add_new_address.dart';
import 'package:flexi/features/personalization/screens/address/widgets/single_address.dart';
import 'package:flexi/utils/constants/colors.dart';
import 'package:flexi/utils/constants/image_strings.dart';
import 'package:flexi/utils/constants/sizes.dart';
import 'package:flexi/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());
    // ignore: unused_local_variable

    return Scaffold(
      // Add Address
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => const AddNewAddressScree()),
        backgroundColor: CColors.primary,
        child: const Icon(
          Iconsax.add,
          color: CColors.white,
        ),
      ),

      // App Bar
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text(
          'Addresses',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: Column(children: [
            Obx(() {
              final refresh = controller.refreshData;
              if (refresh.value) {} // Just use an obs variable to rebuild
              return FutureBuilder(
                future: AddressController.instance.getUserAddresses(),
                builder: (context, snapshot) {
                  // Handle Waiting and Nothing Found
                  // Nothig found widget
                  const emptyAddress = CustomAnimationLoaderWidget(
                    text: "Okaay! No Address yet",
                    animation: CImages.emptyWishlist,
                  );

                  // loader
                  const loader = CustomAddressShimmer();

                  final widget = UCloudHelperFunctions.checkMultiRecordState(
                      snapshot: snapshot,
                      loader: loader,
                      nothingFound: emptyAddress);

                  if (widget != null) {
                    return widget;
                  }

                  final addresses = snapshot.data!;
                  return ListView.builder(
                    itemCount: addresses.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final address = addresses[index];
                      return SingleAddress(
                        address: address,
                        onTap: () {
                          controller.selectAddress(addresses[index]);
                        },
                      );
                    },
                  );
                },
              );
            }),
          ]),
        ),
      ),
    );
  }
}
