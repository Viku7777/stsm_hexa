import 'package:cattel_feed/Helper/textstyle.dart';
import 'package:cattel_feed/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget viewAllRow(String name,  Function()? onPressed,{var textcolor =0xff000000,Icon? icon, bool isRed = false})=>
     Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: GetTextTheme.fs16_bold.copyWith(color: Color(textcolor)),

              ),
          Row(children: [
                TextButton(
                  onPressed: onPressed,
                  child: Text(
                    "View All",
                    style: GetTextTheme.fs16_medium.copyWith(color:  isRed ? AppColors.redColor :AppColors.greenColor),
                  )),
                  icon ?? const SizedBox(),
          ],)
            ],
          );

// rounded border

dynamic customroundedBorder(int size)=>RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(size.sp));
