// ignore_for_file: must_be_immutable

import 'dart:math';

import 'package:cattel_feed/model/order_model/order_model.dart';
import 'package:cattel_feed/resource/const/colors.dart';
import 'package:cattel_feed/resource/const/textstyle.dart';
import 'package:cattel_feed/resource/component/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class MYOrderTile extends StatelessWidget {
  Function(String)? tapClick;
  String selected;
  OrderModel order;
  value(String data) {
    return data;
  }

  MYOrderTile(
      {super.key,
      required this.tapClick,
      required this.selected,
      required this.order});

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
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 70.h,
                width: 70.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppColors.greenColor.withOpacity(0.2),
                    shape: BoxShape.circle),
                child: Icon(
                  Icons.fire_truck,
                  size: 40.sp,
                  color: AppColors.greenColor,
                ),
              ),
              5.w.widthBox,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      order.orderId.toString(),
                      style: GetTextTheme.fs16_regular,
                      maxLines: 2,
                      overflow: TextOverflow.visible,
                    ),
                    8.h.heightBox,
                    ...order.items!.map((e) {
                      return Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    e.title.toString(),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Expanded(
                                    child: Text(e.varientName.isEmptyOrNull ||
                                            e.varientName!.contains("not_found")
                                        ? ""
                                        : "(${e.varientName})")),
                              ],
                            ),
                          ),
                          Text("x ${e.quantity}  ₹${e.finalPrice}/-")
                        ],
                      );
                    }).toList(),
                    customText("Item Delivered : ${order.deliverydate}",
                        GetTextTheme.fs10_regular)
                  ],
                ),
              ),
            ],
          ),
          5.h.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              selected.contains("Ongoing")
                  ? const SizedBox()
                  : Expanded(child: orderTypeTile(orderDetails[0])),
              Expanded(child: orderTypeTile(orderDetails[1])),
              selected.contains("Ongoing")
                  ? Expanded(child: orderTypeTile(orderDetails[2]))
                  : const SizedBox()
            ],
          ),
        ],
      ),
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
          padding: EdgeInsets.symmetric(
            horizontal: 5.w,
            vertical: 5.h,
          ),
          margin: EdgeInsets.only(
            right: 3.w,
          ),
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
