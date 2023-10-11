import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget showmoreOptionTile(String image,{double height = 100,double width = 100})=>Container(
                            height: height.h,
                            width: width.w,
                            margin: EdgeInsets.only(right: 10.h),
                            decoration: BoxDecoration(
                                color: Colors.red,  
                                borderRadius: BorderRadius.circular(10.sp),
                                image: DecorationImage(
                                    image: NetworkImage(image),
                                    fit: BoxFit.cover)),  
                          );