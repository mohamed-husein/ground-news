import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_sizes.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    Key? key,
    required this.path,
    this.height,
    this.width,
    this.radius,
  }) : super(key: key);

  CustomNetworkImage.square({
    Key? key,
    required String path,
  }) : this(
          key: key,
          radius: BorderRadius.circular(AppSizes.br8),
          path: path,
          height: AppSizes.imageHeightMedium,
          width: AppSizes.imageWidthMedium,
        );

  final String path;
  final double? height;
  final double? width;

  final BorderRadius? radius;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      path,
      height: height ?? AppSizes.imageHeightLarge,
      width: width ?? AppSizes.widthFullScreen,
      fit: BoxFit.fill,
      // errorBuilder: (context, url, error) => const Icon(Icons.error),
      // imageBuilder: (context, imageProvider) => Container(
      //   decoration: BoxDecoration(
      //     borderRadius: radius,
      //     image: DecorationImage(
      //       image: imageProvider,
      //       fit: BoxFit.contain,
      //     ),
      //   ),
      // ),
      // loadingBuilder: (context, url) =>
      //     const Center(child: CircularProgressIndicator()),
    );
  }
}
