import 'package:cattel_feed/const/colors.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

imageWithGradient(String url,{double height = 127,double width = 127})=> Container(
                      height: height.h,
                      width: width.w,
                      padding: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                          gradient: titleWidgetGradient),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(url,fit: BoxFit.cover,)),
                     
);