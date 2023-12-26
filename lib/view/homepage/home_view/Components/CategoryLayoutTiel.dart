// ignore_for_file: file_names

import 'package:cattel_feed/model/product_model/product_model.dart';
import 'package:cattel_feed/resource/const/base_getters.dart';
import 'package:cattel_feed/resource/const/colors.dart';
import 'package:cattel_feed/resource/const/textstyle.dart';
import 'package:cattel_feed/view/homepage/home_view/Components/categories_product_tiel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:velocity_x/velocity_x.dart';

enum CategoryViewType {
  oneByThree,
  threeByTwo,
  twoByTwo,
  twoByTwoWithList,
  threeByThree
}

class CategoriesLayoutTile {
  // three by two
  static oneByThree(List<ProductModel> products) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          AppServices.addWidth(5),
          ...List.generate(
            products.length,
            (index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              width: 100.w,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: Container(
                      color: Colors.grey.shade200,
                      child: Image.network(
                        products[index].productImages!.first,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.error),
                        width: 100.w,
                        height: 140.h,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 30.h,
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(10.r))),
                    child: Text(
                      products[index].name.toString(),
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      style: GetTextTheme.fs14_regular
                          .copyWith(color: AppColors.whiteColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  static threeByTwo(List<ProductModel> products) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: products.length > 6 ? 6 : products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.65.sp,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemBuilder: (context, index) {
        return CategoriesProductTiles(
            image: products[index].productImages!.first,
            title: products[index].name.toString(),
            subtitle: "299");
      },
    );
  }

  static twoByTwo(List<ProductModel> products) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      shrinkWrap: true,
      itemCount: products.length > 4 ? 4 : products.length,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.60.sp,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: AppColors.greyColor.withOpacity(0.3))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(1.1),
                  width: Get.width * 0.45,
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(8.r)),
                      gradient: AppColors.appGradientColor),
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(8.r)),
                    child: Container(
                      color: Colors.grey.shade200,
                      child: Image.network(
                        products[index].productImages!.first,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppServices.addHeight(15),
                    Padding(
                      padding: EdgeInsets.only(left: 5.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          5.h.heightBox,
                          Text(
                            products[index].name.toString(),
                            textAlign: TextAlign.start,
                            maxLines: 1,
                            style: GetTextTheme.fs14_medium
                                .copyWith(color: AppColors.greyColor),
                          ),
                          2.h.heightBox,
                          Text(
                            "Explore Now",
                            style: GetTextTheme.fs12_medium
                                .copyWith(color: AppColors.primaryColor),
                          ),
                          10.h.heightBox,
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  static twoByTwoWithList(List<ProductModel> products) {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Container(
            height: 400.h,
            width: Get.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  const Color(0xffFFFFFF),
                  const Color.fromARGB(255, 250, 214, 135).withOpacity(0.1),
                ],
              ),
            ),
          ),
        ),
        Column(
          children: [
            GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: products.length > 4 ? 4 : products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: .8.sp,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(
                          color: AppColors.greyColor.withOpacity(0.2))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(1.1),
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(8.r)),
                              gradient: AppColors.appGradientColor),
                          child: ClipRRect(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(8.r)),
                            child: Container(
                              color: Colors.grey.shade200,
                              child: Image.network(
                                products[index].productImages!.first,
                                errorBuilder: (context, error, stackTrace) =>
                                    const Icon(Icons.error),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppServices.addHeight(5),
                            Text(
                              products[index].name.toString(),
                              maxLines: 1,
                              textAlign: TextAlign.start,
                              style: GetTextTheme.fs14_medium,
                            ),
                            RichText(
                              text: TextSpan(
                                text: "under ",
                                style: GetTextTheme.fs12_regular,
                                children: [
                                  TextSpan(
                                    text: "300",
                                    style: GetTextTheme.fs14_regular
                                        .copyWith(fontSize: 13),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      10.h.heightBox,
                    ],
                  ),
                );
              },
            ),
            AppServices.addHeight(20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  AppServices.addWidth(10),
                  ...List.generate(
                    products.length,
                    (index) => Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 5),
                          height: 120.h,
                          width: 120.w,
                          padding: const EdgeInsets.all(1.2),
                          decoration: BoxDecoration(
                              gradient: AppColors.appGradientColor,
                              borderRadius: BorderRadius.circular(10.r)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.r),
                            child: Container(
                              color: Colors.grey.shade200,
                              child: Image.network(
                                products[index].productImages!.first,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                          ),
                        ),
                        AppServices.addHeight(5),
                        SizedBox(
                          width: 120.w,
                          child: Text(
                            products[index].name.toString(),
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            style: GetTextTheme.fs12_regular,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }

  static threeByThree(List<ProductModel> products) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: AppColors.primaryColor.withOpacity(.2),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: products.length > 9 ? 9 : products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.65.sp,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(1.1),
                  width: 127.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      gradient: AppColors.appGradientColor),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: Container(
                      color: Colors.grey.shade200,
                      child: Image.network(
                        products[index].productImages!.first,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.error),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              AppServices.addHeight(5),
              Text(
                products[index].name.toString(),
                textAlign: TextAlign.center,
                maxLines: 1,
                style: GetTextTheme.fs14_regular,
              ),
            ],
          );
        },
      ),
    );
  }
}