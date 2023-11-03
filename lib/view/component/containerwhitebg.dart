import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget containerwithwhitebg(dynamic widget,double height) => Container(
      // height: height,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12.sp)),
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      
      child: widget,
      );