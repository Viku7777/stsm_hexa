import 'package:cattel_feed/resource/const/icon.dart';
import 'package:cattel_feed/resource/const/textstyle.dart';
import 'package:cattel_feed/resource/component/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

AlertDialog showSuccessDialog(
        String title, String subtitle, List<Widget> action) =>
    AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.sp)),
      contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
      title: Image.asset(
        IconsClass.sucessIcon,
        height: 70.h,
        width: 70.w,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          10.h.heightBox,
          customText(title, GetTextTheme.fs18_bold),
          10.h.heightBox,
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: GetTextTheme.fs14_regular,
          ),
          5.h.heightBox,
          ...action,
          10.h.heightBox,
        ],
      ),
    );
