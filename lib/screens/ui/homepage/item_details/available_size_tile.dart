import 'package:cattel_feed/Helper/textstyle.dart';
import 'package:cattel_feed/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget availablesizeTiel(String size,bool isSelected)=> Container(
                            width: 60.w,
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(right: 10.w),
                            decoration: BoxDecoration(
                                color: isSelected? const Color(0xffFFAE00): AppColors.gerythinColor,
                                borderRadius: BorderRadius.circular(30.sp)),
                            child: Text(
                              size,
                              style: GetTextTheme.fs16_regular
                                  .copyWith(color:isSelected? Colors.white:Colors.black),
                            ),
                          );