// ignore_for_file: file_names

import 'package:cattel_feed/resource/const/colors.dart';
import 'package:cattel_feed/resource/const/textstyle.dart';
import 'package:cattel_feed/backend/dummyData.dart';

import 'package:cattel_feed/resource/component/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class ShowRatingTile extends StatelessWidget {
  const ShowRatingTile({super.key});

  @override
  Widget build(BuildContext context) {
    double rating = 0;

    for (var element in availableReview) {
      rating += element.rating;
    }
    rating = rating / availableReview.length;

    return Container(
      height: 100.h,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 100.w,
            decoration: BoxDecoration(
                color: AppColors.greythinColor, shape: BoxShape.circle),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.star,
                  color: AppColors.orange,
                  size: 25.sp,
                ),
                5.h.heightBox,
                Text(
                  rating.toDoubleStringAsFixed(digit: 1),
                  style: GetTextTheme.fs18_bold,
                )
              ],
            ),
          ),
          10.w.widthBox,
          Expanded(
            child: Column(
              children: [
                ratingLines("Excellent", AppColors.primaryColor, 5),
                ratingLines("Very Good", AppColors.orange, 4),
                ratingLines("Good", Colors.lightBlueAccent, 3),
                ratingLines("Average", Colors.pinkAccent, 2),
                ratingLines("Poor", AppColors.redColor, 1),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget ratingLines(String title, Color clr, int rate) {
    double rating0 = 0;

    for (var element in availableReview) {
      if (rate >= element.rating && element.rating > rate - 1) {
        rating0 += element.rating;
      }
    }
    rating0 = (rating0 / (availableReview.length * 5));
    return Expanded(
      child: Row(
        children: [
          Expanded(flex: 1, child: customText(title, GetTextTheme.fs10_medium)),
          10.w.widthBox,
          Expanded(
            flex: 3,
            child: Container(
                height: 8.h,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.greythinColor),
                child: LayoutBuilder(builder: (context, constraints) {
                  double width = constraints.maxWidth * rating0;
                  return Container(
                    width: width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), color: clr),
                  );
                })),
          )
        ],
      ),
    );
  }
}
