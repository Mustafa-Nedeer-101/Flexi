import 'package:cached_network_image/cached_network_image.dart';
import 'package:flexi/common/widgets/shimmers/shimmer.dart';
import 'package:flexi/utils/constants/colors.dart';
import 'package:flexi/utils/constants/image_strings.dart';
import 'package:flexi/utils/constants/sizes.dart';
import 'package:flexi/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CustomCircularImage extends StatelessWidget {
  const CustomCircularImage(
      {super.key,
      this.fit = BoxFit.fill,
      required this.image,
      this.isNetworkImage = false,
      this.overlayColor,
      this.backgroundColor,
      this.width = 56,
      this.height = 56,
      this.padding = CSizes.sm});

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor, backgroundColor;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor ??
            (UHelperFunctions.isDarkMode(context)
                ? CColors.black
                : CColors.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Center(
            child: image.isEmpty // Image string is empty
                ? Image(
                    fit: fit,
                    image: const AssetImage(CImages.defaultLogo),
                    color: overlayColor,
                  )
                : (isNetworkImage
                    ? CachedNetworkImage(
                        fit: fit,
                        color: overlayColor,
                        imageUrl: image,
                        progressIndicatorBuilder: (context, url, progress) =>
                            const CustomShimmerEffect(
                          width: 55,
                          height: 55,
                          radius: 55,
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      )
                    : Image(
                        fit: fit,
                        image: AssetImage(image),
                        color: overlayColor,
                      ))),
      ),
    );
  }
}
