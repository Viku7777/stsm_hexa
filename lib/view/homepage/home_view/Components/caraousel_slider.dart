import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget showcarouselslider(List<String> images) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10.w),
    child: CarouselSlider(
        items: images
            .map((e) => Image.network(
                  e,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.error),
                ))
            .toList(),
        options: CarouselOptions(
          height: 150.h,
          aspectRatio: 13 / 12,
          viewportFraction: 1,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          onPageChanged: (index, reason) {},
          scrollDirection: Axis.horizontal,
        )),
  );
}
