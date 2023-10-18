import 'package:cattel_feed/Helper/textstyle.dart';
import 'package:cattel_feed/backend/dummyData.dart';
import 'package:cattel_feed/const/icon.dart';
import 'package:cattel_feed/model/productsModel.dart';
import 'package:cattel_feed/screens/component/appbar_component.dart';
import 'package:cattel_feed/screens/component/custom_text.dart';
import 'package:cattel_feed/screens/ui/homepage/item_List/item_view_tile.dart';
import 'package:cattel_feed/screens/ui/sort_or_filter/filter/filter_view.dart';
import 'package:cattel_feed/screens/ui/sort_or_filter/sort/sort_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
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
            children: [
              Expanded(
                child: InkWell(
                  onTap: () => showSortItemSheet(false),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(IconsClass.sorticon),
                      10.w.widthBox,
                      Text(
                        "Sort",
                        style: GetTextTheme.fs16_medium,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 25.h,
                width: 2.w,
                color: Colors.grey.shade300,
              ),
              Expanded(
                child: InkWell(
                  onTap: () => showSortItemSheet(true),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Filters",
                        style: GetTextTheme.fs16_medium,
                      ),
                      10.w.widthBox,
                      Image.asset(IconsClass.filtersicon),
                    ],
                  ),
                ),
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
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: .7,
                  crossAxisCount: 2,
                  mainAxisSpacing: 5.h,
                  crossAxisSpacing: 5.w),
              itemBuilder: (context, index) {
                List<ProductModel> items =
                    dummyitems.map((e) => ProductModel.fromJson(e)).toList();
                return ItemViewTiel(item: items[index]);
              },
            ),
          )
        ],
      ),
    );
  }

  showSortItemSheet(bool isFilter) {
    return showModalBottomSheet(
      isScrollControlled: isFilter,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.w),
                topRight: Radius.circular(15.w))),
        context: context,
        builder: (context) => Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w)
                      .copyWith(top: 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customText(isFilter? "FILTERS": "SORT", GetTextTheme.fs16_regular),
                      IconButton(
                        onPressed: () {
                            Get.back();
                        },
                        icon: const Icon(Icons.close, color: Colors.black),
                      )
                    ],
                  ),
                ),
                const Divider(color: Colors.black, thickness: 1),
                 Expanded(child: isFilter? const FilterView() :SortView()),
                 const Divider(color: Colors.black, thickness: 1),
Row(children: [
  10.w.widthBox,
  Expanded(child: customText("800+ Products",GetTextTheme.fs16_regular)),
  SizedBox(
    width: 79.w,
    child: customButtonWithGradent("Done", () => null)),
    10.w.widthBox,
],),
10.h.heightBox,

              ],
            ));
  }
}
