import 'package:cattel_feed/Helper/colors.dart';
import 'package:cattel_feed/Helper/textstyle.dart';
import 'package:cattel_feed/view/component/icon_with_gradinet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:velocity_x/velocity_x.dart';

Widget customText(String text, TextStyle style) => Text(
      text,
      style: style,
    );
Widget customtextWithGradentColor(String text, TextStyle style) =>
    GradientText(text, style: style, colors: const [
      Color(0xff01BBBD),
      Color(0xffFFAE00),
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

Widget customTextButtonWithGradent(String name, IconData icon) {
  final kInnerDecoration = BoxDecoration(
    color: Colors.white,
    border: Border.all(color: Colors.white),
    borderRadius: BorderRadius.circular(12.sp),
  );

  final kGradientBoxDecoration = BoxDecoration(
    gradient: titleWidgetGradient,
    color: Colors.white,
    borderRadius: BorderRadius.circular(12.sp),
  );
  return Container(
    height: 44.h,
    decoration: kGradientBoxDecoration,
    child: Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
          decoration: kInnerDecoration,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              customIconWithGradient(icon),
              10.w.widthBox,
              customtextWithGradentColor(name, GetTextTheme.fs16_regular),
            ],
          )),
    ),
  );
}
