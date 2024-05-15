import 'package:cached_network_image/cached_network_image.dart';
import 'package:flexi/common/widgets/shimmers/shimmer.dart';
import 'package:flexi/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CustomRoundedImage extends StatelessWidget {
  const CustomRoundedImage({
    super.key,
    this.width,
    this.height,
    this.border,
    this.padding,
    this.onPressed,
    required this.imageUrl,
    this.fit = BoxFit.contain,
    this.isNetworkImage = false,
    this.applyImageRadius = true,
    this.borderRadius = CSizes.md,
    this.backgroundColor,
  });

  final double? width, height;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color? backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    //
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          border: border,
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: isNetworkImage
            ? CachedNetworkImage(
                fit: fit,
                imageUrl: imageUrl,
                progressIndicatorBuilder: (context, url, progress) =>
                    CustomShimmerEffect(
                        width: width ?? double.infinity, height: height ?? 158),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              )
            : Image(fit: fit, image: AssetImage(imageUrl)),
      ),
    );
  }
}

// My Custom Round Edges Image
class CustomRoundEdgesImage extends StatelessWidget {
  const CustomRoundEdgesImage({
    super.key,
    this.width,
    this.height,
    this.border,
    this.padding,
    this.onPressed,
    required this.imageUrl,
    this.fit = BoxFit.contain,
    this.isNetworkImage = false,
    this.applyImageRadius = true,
    this.borderRadius = CSizes.md,
    this.backgroundColor,
  });

  final double? width, height;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color? backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    //
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          width: width,
          height: height,
          padding: padding,
          decoration: BoxDecoration(
            border: border,
            color: backgroundColor,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: isNetworkImage
                ? CachedNetworkImage(
                    fit: fit,
                    imageUrl: imageUrl,
                    progressIndicatorBuilder: (context, url, progress) =>
                        CustomShimmerEffect(
                            width: width ?? double.infinity,
                            height: height ?? 158),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  )
                : Image(fit: fit, image: AssetImage(imageUrl)),
          )),
    );
  }
}
