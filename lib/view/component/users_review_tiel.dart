import 'package:cattel_feed/Helper/textstyle.dart';
import 'package:cattel_feed/backend/dummyData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:velocity_x/velocity_x.dart';

Widget customersReviewtile(int index, {bool isViewAll = false}) {
  return Container(
    width: Get.width,
    padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
    constraints: BoxConstraints(
      minHeight: 115.h,
    ),
    decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: const Color(0xffEAFDE1),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.person_outlined),
                  color: Colors.black),
            ),
            10.w.widthBox,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  availableReview[index].username,
                  style: GetTextTheme.fs14_bold,
                ),
                RatingBar.builder(
                  initialRating: availableReview[index].rating,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 13.sp,
                  itemPadding: EdgeInsets.symmetric(horizontal: 1.w),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {},
                ),
              ],
            )
          ],
        ),
        Align(
          alignment: Alignment.topLeft,
          child: isViewAll
              ? Text(
                  availableReview[index].discription,
                  style: GetTextTheme.fs14_regular
                      .copyWith(color: Colors.grey.shade500),
                )
              : Text(
                  availableReview[index].discription,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GetTextTheme.fs14_regular
                      .copyWith(color: Colors.grey.shade500),
                ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Text(
            "21 min ago",
            style:
                GetTextTheme.fs14_regular.copyWith(color: Colors.grey.shade500),
          ),
        )
      ],
    ),
  );
}
