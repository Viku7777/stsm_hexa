// ignore_for_file: must_be_immutable

import 'package:cattel_feed/resource/const/base_getters.dart';
import 'package:cattel_feed/resource/const/colors.dart';
import 'package:cattel_feed/resource/const/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CategoriesProductTiles extends StatelessWidget {
  String image, title, subtitle;
  CategoriesProductTiles(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(1.1),
            width: Get.width * .35,
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(8.r),
                gradient: AppColors.appGradientColor),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.error),
                ),
              ),
            ),
          ),
        ),
        AppServices.addHeight(5),
        Text(
          title,
          maxLines: 1,
          textAlign: TextAlign.center,
          style: GetTextTheme.fs14_medium,
        ),
        // RichText(
        //   text: TextSpan(
        //     text: "under ",
        //     style: GetTextTheme.fs12_regular,
        //     children: [
        //       TextSpan(
        //         text: subtitle,
        //         style: GetTextTheme.fs14_regular.copyWith(fontSize: 13),
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
