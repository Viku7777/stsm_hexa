import 'package:cattel_feed/Helper/textstyle.dart';
import 'package:cattel_feed/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget bannerWithTitle(String name)=>Container(
  height: 42.h,
  alignment: Alignment.center,
  decoration: BoxDecoration(gradient: titleWidgetGradient),
  child: Text(name,style: GetTextTheme.fs14_bold.copyWith(color: Colors.white),),
);