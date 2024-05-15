import 'package:flexi/common/widgets/images/circular_image.dart';
import 'package:flexi/common/widgets/shimmers/shimmer.dart';
import 'package:flexi/features/personalization/controllers/user_controller.dart';
import 'package:flexi/utils/constants/colors.dart';
import 'package:flexi/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CustomUserProfileTile extends StatelessWidget {
  const CustomUserProfileTile({super.key, this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading: // Circular Image => Profile picture
          Obx(() {
        final networkImage = controller.user.value.profilePicture;
        final image = networkImage.isNotEmpty ? networkImage : CImages.user;
        return controller.imageUploading.value
            ? const CustomShimmerEffect(width: 50, height: 50)
            : CustomCircularImage(
                width: 50,
                height: 50,
                image: image,
                padding: 0,
                isNetworkImage: networkImage.isNotEmpty,
              );
      }),
      title: Obx(
        () => Text(
          controller.user.value.fullName,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: CColors.white),
        ),
      ),
      subtitle: Obx(
        () => Text(
          controller.user.value.email,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .apply(color: CColors.white),
        ),
      ),
      trailing: IconButton(
        onPressed: onPressed,
        icon: const Icon(
          Iconsax.edit,
          color: CColors.white,
        ),
      ),
    );
  }
}
