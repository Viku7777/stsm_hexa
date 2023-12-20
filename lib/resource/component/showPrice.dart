// ignore_for_file: file_names

import 'package:cattel_feed/Helper/colors.dart';
import 'package:cattel_feed/Helper/textstyle.dart';
import 'package:cattel_feed/resource/component/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

Widget customshowPrice(String old, String newprice) => Row(
      children: [
        // old price
        customText(
          "₹ $old",
          GetTextTheme.fs18_medium.copyWith(
              decoration: TextDecoration.lineThrough,
              color: AppColors.greylightcolor),
        ),
        10.w.widthBox,

        // current price
        customText(
          "₹ $newprice",
          GetTextTheme.fs18_bold.copyWith(color: AppColors.primaryColor),
        )
      ],
    );
