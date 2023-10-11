import 'package:cattel_feed/Helper/textstyle.dart';
import 'package:cattel_feed/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:velocity_x/velocity_x.dart';

Widget customText(String text, TextStyle style) => Text(
      text,
      style: style,
    );
Widget customtextWithGradentColor(String text,TextStyle style ) =>
    GradientText(text, style:style , colors: const [
      Color(0xff8A2387),
      Color(0xffE94057),
      Color(0xffF27121),
    ]);

Widget customButtonWithGradent(String text, Function()? onTap) => InkWell(
      onTap: onTap,
      child: Container(
          height: 44.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.sp),
              gradient: titleWidgetGradient),
          child: Text(
            text,
            style: GetTextTheme.fs16_regular.copyWith(color: Colors.white),
          )),
    );
