import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

SliverGridDelegate customgridDelegate(int count, double aspectRatio,{double crossAxisSpacing = 7, double mainAxisSpacing=7}) => SliverGridDelegateWithFixedCrossAxisCount(childAspectRatio: aspectRatio
         ,       crossAxisCount:count,
                crossAxisSpacing: crossAxisSpacing.w,
                mainAxisSpacing: mainAxisSpacing.h,

                );

BoxDecoration roundedBoxdecoration = BoxDecoration(
                    border:
                        Border.all(color: const Color(0xffE4E4E4), width: 2.w),
                    borderRadius: BorderRadius.circular(10.sp));          