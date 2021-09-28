import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  String image;
  double? radius;

  CustomCachedNetworkImage({
    required this.image,
     this.radius = 0,
  });

  @override
  Widget build(BuildContext context) {
    return      CachedNetworkImage(
      imageUrl: image,
      placeholder: (context, url) => CircularProgressIndicator(),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
