import 'package:cattel_feed/screens/component/gridview.dart';
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
  int count,
  double aspectRatio,
  int itemInRow,
  Function(int) child,
) =>
    GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: count,
        gridDelegate: customgridDelegate(itemInRow, aspectRatio),
        itemBuilder: (context, index) => child(index));

decorationWithImage(String image) {
  return BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
      color: Colors.red);
}
