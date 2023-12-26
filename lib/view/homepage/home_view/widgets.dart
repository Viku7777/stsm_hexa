import 'package:cattel_feed/resource/component/gridview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

customListview(int count, Function(int) currentindex,
        {bool isverticalAxis = false}) =>
    ListView.separated(
        separatorBuilder: (context, index) => 10.w.widthBox,
        shrinkWrap: true,
        scrollDirection: isverticalAxis ? Axis.vertical : Axis.horizontal,
        itemCount: count,
        itemBuilder: (context, index) {
          return currentindex(index);
        });

customGridVIew(
        int count, double aspectRatio, int itemInRow, Function(int) child,
        {bool isScrollAble = false,
        double crossAxisSpacing = 7,
        double mainAxisSpacing = 7}) =>
    GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        shrinkWrap: true,
        physics: isScrollAble
            ? const BouncingScrollPhysics()
            : const NeverScrollableScrollPhysics(),
        itemCount: count,
        gridDelegate: customgridDelegate(itemInRow, aspectRatio,
            crossAxisSpacing: crossAxisSpacing,
            mainAxisSpacing: mainAxisSpacing),
        itemBuilder: (context, index) => child(index));

decorationWithImage(String image) {
  return BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
      color: Colors.red);
}
