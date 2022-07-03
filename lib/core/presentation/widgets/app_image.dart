// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:octo_image/octo_image.dart';

class AppImage extends StatelessWidget {
  AppImage(
    this.image, {
    Key? key,
    this.height,
    this.width,
    this.borderRadius,
    this.semanticsLabel,
    this.color,
    this.fit = BoxFit.contain,
  }) : super(key: key);
  final String image;
  double? height;
  double? width;
  String? semanticsLabel;
  Color? color;
  BoxFit? fit;
  double? borderRadius;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius ?? 0),
        child: _getImage(),
      ),
    );
  }

  _getImage() {
    if (image.startsWith("http") && image.endsWith(".svg")) {
      return SvgPicture.network(
        image,
        height: height,
        width: width,
        color: color,
        fit: fit!,
        semanticsLabel: semanticsLabel,
      );
    } else if (image.endsWith(".svg")) {
      return SvgPicture.asset(
        image,
        height: height,
        width: width,
        color: color,
        fit: fit!,
        semanticsLabel: semanticsLabel,
      );
    } else if (image.startsWith("http")) {
      return OctoImage(
        image: CachedNetworkImageProvider(
          image,
        ),

        progressIndicatorBuilder: (context, downloadProgress) => Center(
          child: CircularProgressIndicator(
            value: downloadProgress?.cumulativeBytesLoaded.toDouble(),
            backgroundColor: Theme.of(context).colorScheme.secondary,
          ),
        ),
        // placeholderBuilder: OctoPlaceholder.blurHash(
        //   'L6Pj0^i_.AyE_3t7t7R**0o#DgR4',
        // ),

        errorBuilder: OctoError.icon(color: Colors.red),
        color: color,
        fit: fit,
        height: height,
        width: width,
      );
    } else if (image.startsWith('asset')) {
      return Image.asset(
        image,
        height: height,
        width: width,
        color: color,
        fit: fit,
      );
    } else {
      return Container(
        width: width ?? 0,
        height: height ?? 0,
      );
    }
  }
}
