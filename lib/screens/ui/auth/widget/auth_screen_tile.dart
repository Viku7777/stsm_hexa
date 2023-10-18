import 'package:cattel_feed/const/icon.dart';
import 'package:cattel_feed/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';

Widget authStartScreen(List<Widget> widgets,{double height = 0.50})=>  SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: screenSize.height*.025,
            ),
            Image.asset(
              IconsClass.appIcon,
              height: 120.h,
              width: 120.w,
            ),
            SizedBox(
              height: screenSize.height*.025,
            ),
            SizedBox(
              height: screenSize.height*height,
              width: Get.width,
              child: Card(
                margin: EdgeInsets.symmetric(horizontal: 15.w),
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Column(
                    children:widgets
                  ),
                ),
              ),
            )
          ],
        ),
      ));
   