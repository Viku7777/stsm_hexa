import 'package:cattel_feed/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget customIconWithGradient(iconData)=>    ShaderMask(
                                shaderCallback: (Rect bounds) {
                                  return titleWidgetGradient
                                      .createShader(bounds);
                                },
                                child: Icon(
                                  iconData,
                                  color: Colors.white,
                                  size: 22.sp,
                                ),
                              );
                          