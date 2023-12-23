// ignore_for_file: must_be_immutable

import 'package:cattel_feed/Helper/colors.dart';
import 'package:cattel_feed/Helper/textstyle.dart';
import 'package:cattel_feed/controller/sub_categories_controller/sub_categories.dart';
import 'package:cattel_feed/helper/icon.dart';
import 'package:cattel_feed/main.dart';
import 'package:cattel_feed/model/categorymodel.dart';
import 'package:cattel_feed/model/product_model/product_model.dart';
import 'package:cattel_feed/resource/component/appbar_component.dart';
import 'package:cattel_feed/view/screens/categories/component/component.dart';
import 'package:cattel_feed/view/screens/homepage/home_view/widgets.dart';
import 'package:cattel_feed/view/screens/homepage/item_List/item_list_screen.dart';
import 'package:cattel_feed/view/screens/homepage/item_List/item_view_tile.dart';
import 'package:cattel_feed/view_model/controller/app_data_controller.dart';
import 'package:cattel_feed/view_model/controller/sub_categories_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class SubCategoriesItemView extends StatefulWidget {
  static String route = "/sub_categories";
  CategoriesModel currentCategories;
  SubCategoriesItemView({super.key, required this.currentCategories});

  @override
  State<SubCategoriesItemView> createState() => _SubCategoriesItemViewState();
}

class _SubCategoriesItemViewState extends State<SubCategoriesItemView> {
  Color dividerColor = Colors.grey.shade200;

  var subcontroller = Get.put(SubCatController());

  int? selectsubCat;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: customAppbar(widget.currentCategories.title),
        body: GetBuilder<SubCategoriesController>(
          builder: (controller) => controller.subCategories.isEmpty
              ? Center(
                  child: Text("Currently not available",
                      style: GetTextTheme.fs14_regular),
                )
              : Column(
                  children: [
                    Container(
                      height: 90.h,
                      width: screenSize.width,
                      padding: EdgeInsets.only(left: 10.w),
                      child: customListview(
                          controller.subCategories.length,
                          (index) => storyView(
                                  controller.subCategories[index].image,
                                  controller.subCategories[index].title, () {
                                controller.updateCurrentSubcategories(
                                    controller.subCategories[index]);
                              }),
                          isverticalAxis: false),
                    ),
                    // uper divider
                    5.h.heightBox,
                    Divider(
                      thickness: 1.w,
                      height: 0,
                      color: AppColors.greythinColor,
                    ),
                    // sort and filter

                    Row(
                      children: [
                        Expanded(
                            child: ElevatedButton.icon(
                                onPressed: () {
                                  showSortItemSheet(false, context);
                                },
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    backgroundColor: Colors.transparent,
                                    shadowColor: Colors.transparent),
                                icon: Image.asset(
                                  IconsClass.sorticon,
                                  height: 15,
                                  width: 15,
                                ),
                                label: Text(
                                  "Sort",
                                  style: GetTextTheme.fs16_medium,
                                ))),
                        Container(
                          height: 20.h,
                          width: 1.5.w,
                          color: Colors.grey.shade300,
                        ),
                        Expanded(
                            child: ElevatedButton(
                          onPressed: () {
                            showSortItemSheet(true, context);
                          },
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Filters",
                                style: GetTextTheme.fs16_medium,
                              ),
                              10.w.widthBox,
                              Image.asset(
                                IconsClass.filtersicon,
                                height: 15,
                                width: 15,
                              ),
                            ],
                          ),
                        )),
                      ],
                    ),

                    // divider
                    Divider(
                      thickness: 1.w,
                      height: 0,
                      color: AppColors.greythinColor,
                    ),
                    5.h.heightBox,

                    Expanded(
                      child: Builder(builder: (context) {
                        var appdata = Get.find<AppData>();
                        List<ProductModel> products = appdata.products
                            .where((element) =>
                                element.categories!.parentId ==
                                    widget.currentCategories.id &&
                                element.categories!.id ==
                                    controller.currentSubCategories.id)
                            .toList();

                        return products.isEmpty
                            ? Center(
                                child: Text("Currently not available",
                                    style: GetTextTheme.fs14_regular),
                              )
                            : GridView.builder(
                                padding: EdgeInsets.symmetric(horizontal: 5.w),
                                itemCount: products.length,
                                shrinkWrap: true,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        childAspectRatio: .7,
                                        crossAxisCount: 2,
                                        mainAxisSpacing: 5.h,
                                        crossAxisSpacing: 5.w),
                                itemBuilder: (context, index) {
                                  return ItemViewTiel(
                                    product: products[index],
                                  );
                                },
                              );
                      }),
                    )
                  ],
                ),
        ));
  }
}
