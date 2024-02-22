// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cattel_feed/model/categories_Model/categorymodel.dart';
import 'package:cattel_feed/model/categories_Model/sub_category.dart';
import 'package:cattel_feed/model/product_model/product_model.dart';
import 'package:cattel_feed/resource/component/appbar_component.dart';
import 'package:cattel_feed/resource/const/textstyle.dart';
import 'package:cattel_feed/view/homepage/item_List/item_list_screen.dart';
import 'package:cattel_feed/view_model/controller/app_data_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SelectSubcatView extends StatefulWidget {
  List<SubCategoriesModel> subcat;
  CategoriesModel categoriesModel;
  SelectSubcatView(
      {super.key, required this.categoriesModel, required this.subcat});

  @override
  State<SelectSubcatView> createState() => _SelectSubcatViewState();
}

class _SelectSubcatViewState extends State<SelectSubcatView> {
  var data = Get.find<AppData>();

  //  = data.subCategories
  //     .where((element) => element.catID == data.categories[i].id)
  //     .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(widget.categoriesModel.title),
      body: Column(
        children: [
          Container(
            height: 80.h,
            // decoration: BoxDecoration(color: Colors.grey.shade200),
            padding: EdgeInsets.all(10.sp),
            margin: EdgeInsets.all(6.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.categoriesModel.title,
                  style: GetTextTheme.fs18_medium,
                ),
                AspectRatio(
                    aspectRatio: 1,
                    child: CachedNetworkImage(
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                        imageUrl: widget.categoriesModel.image)),
              ],
            ),
          ),
          Expanded(
              child: widget.subcat.isEmpty
                  ? Center(
                      child: Text(
                      "Not found",
                      style: GetTextTheme.fs14_medium,
                    ))
                  : ListView.builder(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                      ),
                      itemCount: widget.subcat.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            String subcatid = widget.subcat[index].id;
                            List<ProductModel> products = data.products
                                .where((element) =>
                                    element.categories!.parentId ==
                                        widget.categoriesModel.id &&
                                    element.categories!.id == subcatid)
                                .toList();

                            Get.to(() => ItemlistScreen(
                                  title: widget.subcat[index].title,
                                  products: products,
                                ));
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 5.h),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.h, horizontal: 5.w),
                              decoration:
                                  BoxDecoration(color: Colors.grey.shade200),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    widget.subcat[index].title,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const Icon(Icons.arrow_forward_ios)
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ))
        ],
      ),
    );
  }
}
