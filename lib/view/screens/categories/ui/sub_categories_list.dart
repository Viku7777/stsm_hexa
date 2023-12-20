// ignore_for_file: must_be_immutable

import 'package:cattel_feed/Helper/colors.dart';
import 'package:cattel_feed/Helper/textstyle.dart';
import 'package:cattel_feed/controller/sub_categories_controller/sub_categories.dart';
import 'package:cattel_feed/helper/icon.dart';
import 'package:cattel_feed/main.dart';
import 'package:cattel_feed/model/categorymodel.dart';
import 'package:cattel_feed/model/product_model/product_model.dart';
import 'package:cattel_feed/model/sub_category.dart';
import 'package:cattel_feed/resource/component/appbar_component.dart';
import 'package:cattel_feed/view/screens/account_setting/app_settings/edit_profile/image_picker.dart';
import 'package:cattel_feed/view/screens/homepage/home_view/widgets.dart';
import 'package:cattel_feed/view/screens/homepage/item_List/item_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class SubCategoriesItemView extends StatefulWidget {
  OldCategoiresModel category;
  static String route = "/sub_categories";
  SubCategoriesItemView({
    super.key,
    required this.category,
  });

  @override
  State<SubCategoriesItemView> createState() => _SubCategoriesItemViewState();
}

class _SubCategoriesItemViewState extends State<SubCategoriesItemView> {
  Color dividerColor = Colors.grey.shade200;

  var subcontroller = Get.put(SubCatController());

  int? selectsubCat;

  @override
  Widget build(BuildContext context) {
    List<OldSubCategoriesModel> subCategories = [];
    //  FirebaseData.subcategoires!
    //     .where((element) => element.categoiresID == widget.category.id)
    //     .toList();

    if (subCategories.isNotEmpty) {
      selectsubCat = 0;
    }
    // List<ProductItemModel>products=FirebaseData.
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppbar(widget.category.title),
      body: subCategories.isEmpty
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
                      subCategories.length,
                      (index) => InkWell(
                            onTap: () {
                              selectsubCat = index;
                              setState(() {});
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
                                              image: NetworkImage(dummyImage),
                                              fit: BoxFit.cover),
                                          shape: BoxShape.circle),
                                    ),
                                  ),
                                ),
                                1.h.heightBox,
                                Text(
                                  subCategories[index].title,
                                  textAlign: TextAlign.center,
                                  style: GetTextTheme.fs14_regular,
                                ),
                                2.h.heightBox,
                              ],
                            ),
                          ),
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
                    // List<ProductItemModel> products =
                    // FirebaseData.products!
                    //     .where((e) =>
                    //         e.catID == widget.category.id &&
                    //         e.subCatID == subCategories[selectsubCat!].id)
                    //     .toList();
                    List<ProductModel> products = [];
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
                              return const SizedBox();
                              // return ItemViewTiel(
                              //   product: products[index],
                              // );
                            },
                          );
                  }),
                )
              ],
            ),
    );
  }
}
