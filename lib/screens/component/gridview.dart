import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

SliverGridDelegate customgridDelegate(int count, double aspectRatio) => SliverGridDelegateWithFixedCrossAxisCount(childAspectRatio: aspectRatio
         ,       crossAxisCount:count,
                crossAxisSpacing: 7.h,
                mainAxisSpacing: 7.w);

BoxDecoration roundedBoxdecoration = BoxDecoration(
                    border:
                        Border.all(color: const Color(0xffE4E4E4), width: 2.w),
                    borderRadius: BorderRadius.circular(10.sp));          