import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lagosarchdiocese/utils/constants.dart';

ImageProvider<dynamic> networkImageCache({String url}) {
  return url != null
      ? CachedNetworkImageProvider(url)
      : AssetImage('${kImageUrl}laap_church_default.jpg');
}
