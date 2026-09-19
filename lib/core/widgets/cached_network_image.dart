import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    super.key,
    required this.imageUrl,
    this.fit,
    this.loadingWidget,
    this.errorWidget,
    this.width,
    this.height,
    this.borderRadius,
  });

  final String imageUrl;
  final BoxFit? fit;
  final Widget? loadingWidget;
  final Widget? errorWidget;
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: fit ?? BoxFit.cover,
      imageUrl: imageUrl,
      width: width,
      height: height,
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          loadingWidget ??
          Skeletonizer(
            child: SizedBox(width: width, height: height),
          ),
      errorWidget: (context, url, error) => errorWidget ?? Icon(Icons.error),
      imageBuilder: borderRadius != null
          ? (context, imageProvider) => ClipRRect(
              borderRadius: borderRadius!,
              child: Image(
                image: imageProvider,
                fit: fit ?? BoxFit.cover,
                width: width,
                height: height,
              ),
            )
          : null,
    );
  }
}
