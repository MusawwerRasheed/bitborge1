import 'dart:ui';

import 'package:bitborge/Data/DataSource/Static/color_pallets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AssetImageWidget extends StatelessWidget {
  final String url;
  final double? scale;
  final double? width;
  final double? height;
  final Color? color;
  final bool? isCircle;
  final double? radius;
  final int? margin;

  const AssetImageWidget({
    Key? key,
    required this.url,
    this.scale = 1,
    this.width = 25,
    this.margin = 2,
    this.height = 25,
    this.color,
    this.isCircle,
    this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isCircle != null) {
      return CircleAvatar(
        radius: radius,
        backgroundImage: AssetImage(url),
      );
    } else {
      if (url.endsWith('.svg')) {
        return SvgPicture.asset(
          url,
          fit: BoxFit.fill,
          color: color,
          width: width! * scale!,
          height: height! * scale!,
        );
      } else {
        return Image.asset(
          url,
          fit: BoxFit.fill,
          color: color,
          width: width! * scale!,
          height: height! * scale!,
        );
      }
    }
  }
}

class CachedImage extends StatelessWidget {
  final String url;
  final double? scale;
  final double? radius;
  final bool? isCircle;
  final double? containerRadius;
  final double? bottomRadius;
  final double? topRadius;
  final BoxFit? fit;
  final double? width;
  final double? height;

  const CachedImage({
    super.key,
    required this.url,
    this.scale = 1,
    this.radius = 50,
    this.isCircle = true,
    this.containerRadius = 0,
    this.topRadius,
    this.bottomRadius,
    this.fit = BoxFit.fill,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      placeholder: (context, url) => isCircle!
          ? Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.primarycolor,
                ),
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primarycolor,
                ),
              ),
            )
          : Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: AppColors.whitecolor,
                borderRadius: BorderRadius.circular(containerRadius!),
              ),
              child: const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primarycolor,
                ),
              ),
            ),
      errorWidget: (context, url, error) {
        if (error.statusCode == 500) {
          return isCircle!
              ? CircleAvatar(
                  radius: radius,
                  backgroundImage: const NetworkImage(
                      "https://e7.pngegg.com/pngimages/799/987/png-clipart-computer-icons-avatar-icon-design-avatar-heroes-computer-wallpaper.png"))
              : Image.network(
                  "https://e7.pngegg.com/pngimages/799/987/png-clipart-computer-icons-avatar-icon-design-avatar-heroes-computer-wallpaper.png");
        } else {
          return const Icon(Icons.error);
        }
      },
      imageBuilder: (context, imageProvider) => isCircle!
          ? CircleAvatar(
              radius: radius,
              backgroundImage: imageProvider,
            )
          : ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(topRadius ?? containerRadius!),
                topLeft: Radius.circular(topRadius ?? containerRadius!),
                bottomLeft: Radius.circular(bottomRadius ?? containerRadius!),
                bottomRight: Radius.circular(bottomRadius ?? containerRadius!),
              ),
              child: Image(
                image: imageProvider,
                width: width,
                height: height,
                fit: fit,
              ),
            ),
    );
  }
}
