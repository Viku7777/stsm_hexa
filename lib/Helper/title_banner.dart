import 'package:cattel_feed/Helper/colors.dart';
import 'package:cattel_feed/Helper/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget bannerWithTitle(String name,
        {Color? color, bool isCategoires = false}) =>
    Container(
      height: isCategoires ? 28.h : 40.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          gradient: color == null ? titleWidgetGradient : null, color: color),
      child: Text(
        name,
        style: GetTextTheme.fs14_bold.copyWith(color: Colors.white),
      ),
    );
