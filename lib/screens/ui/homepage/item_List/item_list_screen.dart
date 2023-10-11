import 'package:cattel_feed/Helper/textstyle.dart';
import 'package:cattel_feed/backend/dummyData.dart';
import 'package:cattel_feed/const/icon.dart';
import 'package:cattel_feed/model/productsModel.dart';
import 'package:cattel_feed/screens/component/appbar_component.dart';
import 'package:cattel_feed/screens/ui/homepage/item_List/item_view_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class ItemlistScreen extends StatefulWidget {
  const ItemlistScreen({super.key});

  @override
  State<ItemlistScreen> createState() => _ItemlistScreenState();
}

class _ItemlistScreenState extends State<ItemlistScreen> {
  Color dividerColor = Colors.grey.shade200;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppbar("T-SHIRTS"),
      body: Column(
        children: [
          // uper divider
          Divider(
            thickness: 1.5.w,
            color: dividerColor,
          ),
          5.h.heightBox,

          // sort and filter
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Image.asset(IconsClass.sorticon),
                  10.w.widthBox,
                  Text(
                    "Sort",
                    style: GetTextTheme.fs16_medium,
                  )
                ],
              ),
              Container(
                height: 25.h,
                width: 2.w,
                color: Colors.grey.shade300,
              ),
              Row(
                children: [
                  Text(
                    "Filters",
                    style: GetTextTheme.fs16_medium,
                  ),
                  10.w.widthBox,
                  Image.asset(IconsClass.filtersicon),
                ],
              )
            ],
          ),
          5.h.heightBox,
          // divider
          Divider(thickness: 1.5.w, color: dividerColor),

          Expanded(
            
            child: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              itemCount: dummyitems.length,
              shrinkWrap: true,
              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: .7,
                  crossAxisCount: 2, mainAxisSpacing: 5.h,crossAxisSpacing: 5.w),
              itemBuilder: (context, index) {
                List<ProductModel>items = dummyitems.map((e) => ProductModel.fromJson(e)).toList();
                return ItemViewTiel(item: items[index]);
              },
            ),
          )
        ],
      ),
    );
  }
}
