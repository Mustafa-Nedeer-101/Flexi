import 'package:flexi/common/widgets/shimmers/shimmer.dart';
import 'package:flexi/common/widgets/images/circular_image.dart';
import 'package:flexi/features/personalization/controllers/user_controller.dart';
import 'package:flexi/utils/constants/image_strings.dart';
import 'package:flexi/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePictureSection extends StatelessWidget {
  const ProfilePictureSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          // Circular Image
          Obx(() {
            final networkImage = controller.user.value.profilePicture;
            final image = networkImage.isNotEmpty ? networkImage : CImages.user;
            return controller.imageUploading.value
                ? const CustomShimmerEffect(width: 80, height: 80)
                : CustomCircularImage(
                    width: 80,
                    height: 80,
                    image: image,
                    isNetworkImage: networkImage.isNotEmpty,
                  );
          }),

          const SizedBox(
            height: CSizes.spaceBtwItems,
          ),

          // change image
          TextButton(
              onPressed: () {
                controller.uploadUserProfilePicture();
              },
              child: const Text("Change Profile Picture"))
        ],
      ),
    );
  }
}
