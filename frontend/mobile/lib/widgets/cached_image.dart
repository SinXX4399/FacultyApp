import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
//🔥 Cached Image Widget
Widget buildImage(String url) {
  return CachedNetworkImage(
    imageUrl: url,
    placeholder: (context, url) =>
        const SizedBox(height: 150, child: Center(child: CircularProgressIndicator())),
    errorWidget: (context, url, error) =>
        const Icon(Icons.error),
    fit: BoxFit.cover,
  );
}