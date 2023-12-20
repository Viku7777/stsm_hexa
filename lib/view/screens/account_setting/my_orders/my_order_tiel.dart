// ignore_for_file: must_be_immutable

import 'package:cattel_feed/Helper/colors.dart';
import 'package:cattel_feed/Helper/textstyle.dart';
import 'package:cattel_feed/resource/component/custom_text.dart';
import 'package:cattel_feed/view/screens/account_setting/app_settings/edit_profile/image_picker.dart';
import 'package:cattel_feed/view/screens/homepage/home_view/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class MYOrderTile extends StatelessWidget {
  Function(String)? tapClick;
  String selected;
  value(String data) {
    return data;
  }

  MYOrderTile({
    super.key,
    required this.tapClick,
    required this.selected,
  });

  @override
  // ignore: override_on_non_overriding_member
  List orderDetails = [
    "Buy again",
    "View Details",
    "Track Order",
    Icons.more_vert
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                height: 80.h,
                width: 80.w,
                decoration: decorationWithImage(dummyImage)),
            5.w.widthBox,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Scott International Men's Regular Fit T-Shirt",
                    style: GetTextTheme.fs16_regular,
                    maxLines: 2,
                    overflow: TextOverflow.visible,
                  ),
                  8.h.heightBox,
                  customText("Item Delivered : 15th Aug, 2023",
                      GetTextTheme.fs10_regular)
                ],
              ),
            ),
          ],
        ),
        5.h.heightBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: orderTypeTile(orderDetails[0])),
            Expanded(child: orderTypeTile(orderDetails[1])),
            Expanded(child: orderTypeTile(orderDetails[2])),
            orderTypeTile(orderDetails[3]),
          ],
        ),
      ],
    );
  }

  Widget orderTypeTile(
    dynamic name,
  ) {
    return InkWell(
      onTap: () {
        tapClick!(name);
      },
      child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
          margin: const EdgeInsets.only(right: 5),
          decoration: BoxDecoration(
              color: name.runtimeType == String
                  ? name.contains(selected)
                      ? Colors.green
                      : Colors.transparent
                  : Colors.white,
              border: Border.all(color: AppColors.greylightcolor),
              borderRadius: BorderRadius.circular(5)),
          child: name.runtimeType == String
              ? Text(
                  name,
                  style: GetTextTheme.fs12_regular.copyWith(
                      color: name.contains(selected)
                          ? Colors.white
                          : Colors.black),
                )
              : Icon(
                  name,
                  color: Colors.black,
                  size: 14.sp,
                )),
    );
  }
}
