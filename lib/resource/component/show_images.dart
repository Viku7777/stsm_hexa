import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget showNetworkImage(String url) {
  return CachedNetworkImage(
    imageUrl: "http://via.placeholder.com/350x150",
    placeholder: (context, url) => const CircularProgressIndicator(),
    errorWidget: (context, url, error) => const Icon(Icons.error),
  );
}
