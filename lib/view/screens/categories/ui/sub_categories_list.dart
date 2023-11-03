import 'package:cattel_feed/Helper/colors.dart';
import 'package:cattel_feed/Helper/textstyle.dart';
import 'package:cattel_feed/backend/dummyData.dart';

import 'package:cattel_feed/helper/icon.dart';
import 'package:cattel_feed/controller/item_details_controller/item_view_controller.dart';
import 'package:cattel_feed/model/categorymodel.dart';
import 'package:cattel_feed/view/component/appbar_component.dart';
import 'package:cattel_feed/view/screens/homepage/home_view/widgets.dart';
import 'package:cattel_feed/view/screens/homepage/item_List/item_list_screen.dart';
import 'package:cattel_feed/view/screens/homepage/item_List/item_view_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class SubCategoriesItemView extends StatelessWidget {
  CategoiresModel category;
  static String route = "/sub_categories";
  SubCategoriesItemView({super.key, required this.category});

  Color dividerColor = Colors.grey.shade200;
  var controller = Get.put(ItemListController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppbar(category.title),
      body: Column(
        children: [
          2.h.heightBox,
          SizedBox(
            height: 100.h,
            child: customListview(
                dummyCategoires.length,
                (index) => category.id == dummyCategoires[index].id
                    ? const SizedBox()
                    : InkWell(
                        onTap: () {
                          controller.updateItemList(dummyitemList);
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SubCategoriesItemView(
                                category: dummyCategoires[index]),
                          ));
                        },
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                height: 50.h,
                                width: 70.w,
                                padding: const EdgeInsets.all(2),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: titleWidgetGradient),
                                child: Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              dummyCategoires[index].image),
                                          fit: BoxFit.cover),
                                      shape: BoxShape.circle),
                                ),
                              ),
                            ),
                            1.h.heightBox,
                            Text(
                              dummyCategoires[index].title,
                              textAlign: TextAlign.center,
                              style: GetTextTheme.fs14_regular,
                            ),
                            10.h.heightBox,
                          ],
                        ),
                      ),
                isverticalAxis: false),
          ),
          Divider(
            thickness: 1.5.w,
            color: dividerColor,
          ),
          5.h.heightBox,
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () => showSortItemSheet(false, context),
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
              5.h.heightBox,
              Expanded(
                child: InkWell(
                  onTap: () => showSortItemSheet(true, context),
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
              ),
              Divider(
                thickness: 1.5.w,
                color: dividerColor,
              ),
            ],
          ),
          5.h.heightBox,
          Divider(
            thickness: 1.5.w,
            color: dividerColor,
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              itemCount: controller.allitems.length,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: .7,
                  crossAxisCount: 2,
                  mainAxisSpacing: 5.h,
                  crossAxisSpacing: 5.w),
              itemBuilder: (context, index) {
                return ItemViewTiel(items: controller.allitems[index]);
              },
            ),
          )
        ],
      ),
    );
  }
}
