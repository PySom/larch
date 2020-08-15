import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lagosarchdiocese/utils/constants.dart';

class CircleImage extends StatelessWidget {
  final String url;
  final String defaultImage;
  final double radius;
  const CircleImage(
      {this.url, this.defaultImage = kDefaultUserImage, this.radius = 50});
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.transparent,
      backgroundImage: url != null
          ? CachedNetworkImageProvider(url)
          : AssetImage('$kImageUrl$defaultImage'),
    );
  }
}
