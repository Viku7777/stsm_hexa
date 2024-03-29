// ignore_for_file: file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cattel_feed/model/categories_Model/categorymodel.dart';
import 'package:cattel_feed/model/product_model/product_model.dart';
import 'package:cattel_feed/resource/const/base_getters.dart';
import 'package:cattel_feed/resource/const/colors.dart';
import 'package:cattel_feed/resource/const/textstyle.dart';
import 'package:cattel_feed/resource/utils/utils.dart';
import 'package:cattel_feed/view/homepage/home_view/Components/categories_product_tiel.dart';
import 'package:cattel_feed/view/homepage/home_view/Components/title_bar.dart';
import 'package:cattel_feed/view/homepage/item_details/item_details.dart';
import 'package:cattel_feed/view_model/controller/app_data_controller.dart';
import 'package:cattel_feed/view_model/controller/banner_controller.dart';
import 'package:cattel_feed/view_model/controller/item_detail_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
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
  static oneByThreewithProduct(List<ProductModel> products) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          AppServices.addWidth(5),
          ...List.generate(
            products.length,
            (index) => InkWell(
              onTap: () {
                var controller = Get.find<ItemDetailsViewController>();
                controller.updateVarient(products[index].varients!.first);
                Get.to(ItemDetailsView(product: products[index]));
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                width: 100.w,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Column(
                  // alignment: Alignment.bottomCenter,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: Container(
                        color: Colors.grey.shade200,
                        child: Image.network(
                          products[index].productImages!.first,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Icon(
                            Icons.error,
                            size: 25.r,
                          ),
                          width: 100.w,
                          height: 100.h,
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
          ),
        ],
      ),
    );
  }

  static oneByThree(CategoriesModel cat) {
    var appdata = Get.find<AppData>();
    List<ProductModel> products = [];
    products = Utils.sortPrice(appdata.products
        .where((element) => element.categories!.parentId!.contains(cat.id))
        .toList());
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          AppServices.addWidth(5),
          ...List.generate(
            products.length,
            (index) => InkWell(
              onTap: () {
                var controller = Get.find<ItemDetailsViewController>();
                controller.updateVarient(products[index].varients!.first);
                Get.to(ItemDetailsView(product: products[index]));
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                width: 100.w,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Column(
                  // alignment: Alignment.bottomCenter,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: Container(
                        color: Colors.grey.shade200,
                        child: Image.network(
                          products[index].productImages!.first,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Icon(
                            Icons.error,
                            size: 25.r,
                          ),
                          width: 100.w,
                          height: 100.h,
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
          ),
        ],
      ),
    );
  }

  static threeByTwo(CategoriesModel categories) {
    var appdata = Get.find<AppData>();
    List<ProductModel> products = [];
    products = Utils.sortPrice(appdata.products
        .where(
            (element) => element.categories!.parentId!.contains(categories.id))
        .toList());

    return products.isEmpty
        ? const SizedBox()
        : Column(
            children: [
              TitleComponent.taglineGradient(categories.title),
              AppServices.addHeight(20),
              GridView.builder(
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
                  return InkWell(
                    onTap: () {
                      var controller = Get.find<ItemDetailsViewController>();
                      controller.updateVarient(products[index].varients!.first);
                      Get.to(ItemDetailsView(product: products[index]));
                    },
                    child: CategoriesProductTiles(
                        image: products[index].productImages!.first,
                        title: products[index].name.toString(),
                        subtitle: ""),
                  );
                },
              ),
              AppServices.addHeight(20),
              BannerController.categoiresBanner
                      .any((element) => element.categoryId == categories.id)
                  ? Column(
                      children: [
                        Image.network(
                          BannerController.categoiresBanner
                              .firstWhere((element) =>
                                  element.categoryId == categories.id)
                              .imgUrl,
                          fit: BoxFit.fitWidth,
                          errorBuilder: (context, error, stackTrace) =>
                              Utils.imageError(),
                        ),
                        AppServices.addHeight(20),
                      ],
                    )
                  : const SizedBox(),
            ],
          );
  }

  static twoByTwo(CategoriesModel categories, {bool isTranding = false}) {
    var appdata = Get.find<AppData>();
    List<ProductModel> products = [];
    products = Utils.sortPrice(appdata.products
        .where(
            (element) => element.categories!.parentId!.contains(categories.id))
        .toList());
    return products.isEmpty
        ? const SizedBox()
        : Column(
            children: [
              isTranding
                  ? TitleComponent.titleWidgetWithView("Trending")
                  : TitleComponent.taglineGradient(categories.title),
              AppServices.addHeight(20),
              GridView.builder(
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
                  return InkWell(
                    onTap: () {
                      var controller = Get.find<ItemDetailsViewController>();
                      controller.updateVarient(products[index].varients!.first);
                      Get.to(ItemDetailsView(product: products[index]));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(
                              color: AppColors.greyColor.withOpacity(0.3))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(1.1),
                              width: double.maxFinite,
                              decoration: BoxDecoration(
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
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      5.h.heightBox,
                                      Text(
                                        products[index].name.toString(),
                                        textAlign: TextAlign.start,
                                        maxLines: 1,
                                        style: GetTextTheme.fs14_medium
                                            .copyWith(
                                                color: AppColors.greyColor),
                                      ),
                                      2.h.heightBox,
                                      Text(
                                        "Explore Now",
                                        style: GetTextTheme.fs12_medium
                                            .copyWith(
                                                color: AppColors.primaryColor),
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
                    ),
                  );
                },
              ),
              AppServices.addHeight(20),
              BannerController.categoiresBanner
                      .any((element) => element.categoryId == categories.id)
                  ? Column(
                      children: [
                        Image.network(
                          BannerController.categoiresBanner
                              .firstWhere((element) =>
                                  element.categoryId == categories.id)
                              .imgUrl,
                          fit: BoxFit.fitWidth,
                          errorBuilder: (context, error, stackTrace) =>
                              Utils.imageError(),
                        ),
                        AppServices.addHeight(20),
                      ],
                    )
                  : const SizedBox()
            ],
          );
  }

  static twoByTwoWithList(categories) {
    var appdata = Get.find<AppData>();
    List<ProductModel> products = [];
    List<ProductModel> listProduct = [];
    products = Utils.sortPrice(appdata.products
        .where(
            (element) => element.categories!.parentId!.contains(categories.id))
        .toList());
    bool isShowList = products.length > 4;
    if (isShowList) {
      listProduct = products.sublist(4);
    }

    return products.isEmpty
        ? const SizedBox()
        : Column(
            children: [
              TitleComponent.taglineGradient(categories.title),
              AppServices.addHeight(20),
              Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        const Color(0xffFFFFFF),
                        const Color.fromARGB(255, 250, 214, 135)
                            .withOpacity(0.1),
                      ],
                    ),
                  ),
                  child: Column(
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
                            mainAxisSpacing: 15.h),
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.all(2.sp),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              gradient: AppColors.appGradientColor,
                            ),
                            child: InkWell(
                              onTap: () {
                                var controller =
                                    Get.find<ItemDetailsViewController>();
                                controller.updateVarient(
                                    products[index].varients!.first);
                                Get.to(
                                    ItemDetailsView(product: products[index]));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.r),
                                    color: Colors.grey.shade100),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(5.r),
                                            topRight: Radius.circular(5.r)),
                                        child: Image.network(
                                          products[index].productImages!.first,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.sp),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                              text: "Best Product",
                                              style: GetTextTheme.fs12_regular,
                                              children: const [
                                                // TextSpan(
                                                //   text: "300",
                                                //   style: GetTextTheme.fs14_regular
                                                //       .copyWith(fontSize: 13),
                                                // ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      // isShowList
                      isShowList
                          ? SizedBox(
                              height: 150.h,
                              child: ListView.builder(
                                padding: EdgeInsets.only(left: 20.w),
                                scrollDirection: Axis.horizontal,
                                itemCount: listProduct.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      Get.to(ItemDetailsView(
                                          product: listProduct[index]));
                                    },
                                    child: Column(
                                      children: [
                                        10.h.heightBox,
                                        Expanded(
                                          child: Container(
                                            width: 120.w,
                                            margin:
                                                EdgeInsets.only(right: 10.w),
                                            padding: const EdgeInsets.all(1.2),
                                            decoration: BoxDecoration(
                                                gradient:
                                                    AppColors.appGradientColor,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.r)),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                              child: Container(
                                                color: Colors.grey.shade200,
                                                child: Image.network(
                                                  listProduct[index]
                                                      .productImages!
                                                      .first,
                                                  fit: BoxFit.cover,
                                                  errorBuilder: (context, error,
                                                          stackTrace) =>
                                                      const Icon(Icons.error),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        10.h.heightBox,
                                        Text(
                                          listProduct[index].name.toString(),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: GetTextTheme.fs14_medium,
                                        )
                                      ],
                                    ),
                                  );
                                },
                              ),
                            )
                          : const SizedBox()
                    ],
                  )),
              AppServices.addHeight(20),
              BannerController.categoiresBanner
                      .any((element) => element.categoryId == categories.id)
                  ? Column(
                      children: [
                        Image.network(
                          BannerController.categoiresBanner
                              .firstWhere((element) =>
                                  element.categoryId == categories.id)
                              .imgUrl,
                          fit: BoxFit.fitWidth,
                          errorBuilder: (context, error, stackTrace) =>
                              Utils.imageError(),
                        ),
                        AppServices.addHeight(20),
                      ],
                    )
                  : const SizedBox()
            ],
          );
  }

  static threeByThree(CategoriesModel categories) {
    var appdata = Get.find<AppData>();
    List<ProductModel> products = [];
    products = Utils.sortPrice(appdata.products
        .where(
            (element) => element.categories!.parentId!.contains(categories.id))
        .toList());
    return Column(
      children: [
        TitleComponent.taglineGradient(categories.title),
        AppServices.addHeight(10),
        Container(
          padding: const EdgeInsets.all(10),
          color: AppColors.primaryColor.withOpacity(.2),
          child: Column(
            children: [
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: products.length > 9 ? 9 : products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.65.sp,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      var controller = Get.find<ItemDetailsViewController>();
                      controller.updateVarient(products[index].varients!.first);
                      Get.to(ItemDetailsView(product: products[index]));
                    },
                    child: Column(
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
                    ),
                  );
                },
              ),
              AppServices.addHeight(20),
            ],
          ),
        ),
        BannerController.categoiresBanner
                .any((element) => element.categoryId == categories.id)
            ? Column(
                children: [
                  CachedNetworkImage(
                    imageUrl: BannerController.categoiresBanner
                        .firstWhere(
                            (element) => element.categoryId == categories.id)
                        .imgUrl,
                    fit: BoxFit.fitWidth,
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  AppServices.addHeight(20),
                ],
              )
            : const SizedBox()
      ],
    );
  }
}
