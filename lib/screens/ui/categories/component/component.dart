import 'package:cattel_feed/Helper/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:velocity_x/velocity_x.dart';

titlebanner(String name) => Container(
      height: 28.h,
      width: Get.width,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color(0xff8A2387),
        Color(0xffE94057),
        Color(0xffF27121),
      ])),
      child: Text(
        name,
        style: GetTextTheme.fs18_regular.copyWith(color: Colors.white),
      ),
    );

dividerWithName(String name) => Row(
      children: [
        const Expanded(
            child: Divider(
          color: Colors.grey,
          thickness: 1,
          endIndent: 10,
        )),
        Text(
          name,
          style: GetTextTheme.fs14_bold,
        ),
        const Expanded(
            child: Divider(
          color: Colors.grey,
          thickness: 1,
          indent: 10,
        )),
      ],
    );

customGridView(int count) => GridView.builder(
      itemCount: count,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, mainAxisSpacing: 8),
      itemBuilder: (context, index) {
        return Column(
          children: [
            CircleAvatar(
              radius: 35.sp,
              backgroundImage: const NetworkImage(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpUYsRLRyqm4sQ6Xh9IAoYeaIgFprtA_ik6g&usqp=CAU"),
            ),
            2.h.heightBox,
            Text(
              "Shirt",
              style: TextStyle(fontSize: 10.sp),
            )
          ],
        );
      },
    );
