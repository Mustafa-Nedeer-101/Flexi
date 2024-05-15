import 'package:flexi/common/widgets/appbar/appbar.dart';
import 'package:flexi/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:flexi/features/personalization/controllers/user_controller.dart';
import 'package:flexi/utils/constants/colors.dart';
import 'package:flexi/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());

    return CustomAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            CTexts.homeAppbarTitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: CColors.grey),
          ),

          // SubTitle
          Obx(
            () => Text(
              controller.user.value.fullName,
              style: Theme.of(context)
                  .textTheme
                  .labelSmall!
                  .apply(color: CColors.white),
            ),
          ),
        ],
      ),
      actions: const [CustomCartCounterIcon(iconColor: CColors.white)],
    );
  }
}
