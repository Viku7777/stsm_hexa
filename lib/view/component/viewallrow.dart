import 'package:cattel_feed/Helper/colors.dart';
import 'package:cattel_feed/Helper/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget viewAllRow(
  String name,
  Function()? onPressed, {
  bool padding = false,
  var textcolor = 0xff000000,
  Icon? icon,
}) =>
    Padding(
      padding: EdgeInsets.symmetric(horizontal: padding ? 10.w : 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: GetTextTheme.fs16_bold.copyWith(color: Color(textcolor)),
          ),
          Row(
            children: [
              TextButton(
                  onPressed: onPressed,
                  child: Text(
                    "View All",
                    style: GetTextTheme.fs16_medium
                        .copyWith(color: AppColors.greenColor),
                  )),
              icon ?? const SizedBox(),
            ],
          )
        ],
      ),
    );

// rounded border

dynamic customroundedBorder(int size) =>
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(size.sp));
