import 'package:cattel_feed/Helper/colors.dart';
import 'package:cattel_feed/Helper/nextscreen.dart';
import 'package:cattel_feed/Helper/textstyle.dart';

import 'package:cattel_feed/helper/icon.dart';
import 'package:cattel_feed/controller/item_details_controller/item_view_controller.dart';
import 'package:cattel_feed/main.dart';
import 'package:cattel_feed/model/item_model.dart';
import 'package:cattel_feed/view/component/gridview.dart';
import 'package:cattel_feed/view/screens/address/all_address/all_address.dart';
import 'package:cattel_feed/view/screens/cart_view/cart_view.dart';
import 'package:cattel_feed/view/screens/homepage/item_details/item_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

AppBar customAppBar(BuildContext context) {
  return AppBar(
    toolbarHeight: screenSize.height * 0.1315,
    elevation: 0,
    flexibleSpace: Container(
      decoration: BoxDecoration(gradient: titleWidgetGradient),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10.sp),
          child: Column(
            children: [
              Row(
                children: [
                  const InkWell(
                    child: Icon(
                      Icons.location_on,
                      color: Colors.white,
                    ),
                  ),
                  10.w.widthBox,
                  Expanded(
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () =>
                              nextscreen(context, AllAddressView.routes),
                          child: Text("Unknown Location Found",
                              style: GetTextTheme.fs16_medium
                                  .copyWith(color: Colors.white)),
                        ),
                        const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.notifications,
                    color: Colors.white,
                  )
                ],
              ),
              8.h.heightBox,
              Row(
                children: [
                  10.w.widthBox,
                  Expanded(
                      child: TextField(
                    cursorColor: AppColors.primaryColor,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      fillColor: const Color(
                        0xffE1E1E1,
                      ),
                      filled: true,
                      hintStyle: const TextStyle(fontSize: 12),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(30)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(30)),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.black54,
                      ),
                      hintText: "Search your desired items or stores",
                    ),
                  )),
                  10.w.widthBox,
                  InkWell(
                      onTap: () => nextscreen(context, CartView.route),
                      child: const Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    ),
  );
}

// top Deals In Animals Tiel

Widget topDealsAnimalsFeedTiel(
  String image,
  name,
  type,
  int discount,
) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 5.w),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.greythinColor, width: 2.sp)),
    child: Column(
      children: [
        Image.asset(
          image,
          height: 100.h,
          width: 100.w,
        ),
        Divider(
          indent: 10,
          endIndent: 10,
          thickness: 1,
          color: AppColors.greylightcolor,
        ),
        Text(
          name,
          style: GetTextTheme.fs18_medium,
        ),
        Text(
          "$type $discount% off",
          style: GetTextTheme.fs16_bold.copyWith(color: AppColors.primaryColor),
        ),
      ],
    ),
  );
}

Widget bestSellingTiel(ItemModel item) {
  return InkWell(
    onTap: () {
      var controller = Get.put(ItemDetailsController());
      controller.updateItem(item);
      Get.to(() => ItemDetailsView());
    },
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.greythinColor, width: 2),
        color: Colors.white,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 15.h,
          ),
          // rating and discount
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  10.w.widthBox,
                  Icon(
                    Icons.star,
                    color: AppColors.primaryColor,
                    size: 10,
                  ),
                  Text("5.0",
                      style: GetTextTheme.fs10_regular.copyWith(fontSize: 10)),
                ],
              ),
              Container(
                  height: 15.h,
                  width: 50.w,
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  alignment: Alignment.center,
                  color: AppColors.primaryColor,
                  child: Text(
                    "110.0₹ OFF",
                    style: GetTextTheme.fs10_regular
                        .copyWith(fontSize: 9, color: Colors.white),
                  ))
            ],
          )
          // item image
          ,
          SizedBox(
            height: 4.h,
          ),
          Image.asset(TopDealItems.chana, height: 80.sp, width: 80.sp),
          SizedBox(
            height: 8.h,
          ),
          ///// title  /////
          Text(
            "Desi Chana 50kg",
            style: GetTextTheme.fs10_bold.copyWith(fontSize: 12.sp),
          ),
          //// subtitle////
          SizedBox(
            height: 2.h,
          ),
          Text(
            "SAVE TIME SAVE MONEY (BARWLA)",
            style: GetTextTheme.fs10_bold.copyWith(fontSize: 10.sp),
            maxLines: 2,
            textAlign: TextAlign.center,
          ),

          Row(
            children: [
              (screenSize.width * 0.1).widthBox,
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                  text: "₹ 2,750 ",
                  style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: AppColors.redColor,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400),
                ),
                TextSpan(
                    text: "₹ 2,500",
                    style: GetTextTheme.fs10_regular.copyWith(fontSize: 10.sp))
              ])),
              10.h.widthBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.add_circle_sharp,
                    color: AppColors.primaryColor,
                  ),
                  10.w.widthBox,
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget itemPreviewTiel(ItemModel item) {
  return InkWell(
    onTap: () {
      var controller = Get.put(ItemDetailsController());
      controller.updateItem(item);
      Get.to(() => ItemDetailsView());
    },
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.white,
            width: 2,
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 2,
                spreadRadius: 2,
                offset: const Offset(2, 2))
          ]),
      child: Column(
        children: [
          SizedBox(
            height: 10.h,
          ),
          // rating and discount
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  10.w.widthBox,
                  Icon(
                    Icons.star,
                    color: AppColors.primaryColor,
                    size: 10,
                  ),
                  Text("5.0",
                      style: GetTextTheme.fs10_regular.copyWith(fontSize: 10)),
                ],
              ),
              Container(
                  height: 15.h,
                  width: 50.w,
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  alignment: Alignment.center,
                  color: AppColors.primaryColor,
                  child: Text(
                    "110.0₹ OFF",
                    style: GetTextTheme.fs10_regular
                        .copyWith(fontSize: 9, color: Colors.white),
                  ))
            ],
          )
          // item image
          ,
          SizedBox(
            height: 4.h,
          ),
          Image.asset(TopDealItems.chana, height: 75.sp),
          SizedBox(
            height: 4.h,
          ),
          ///// title  /////
          Text(
            "Desi Chana 50kg",
            style: GetTextTheme.fs10_bold.copyWith(fontSize: 12.sp),
          ),
          //// subtitle////
          SizedBox(
            height: 2.h,
          ),
          Text(
            "SAVE TIME SAVE MONEY (BARWLA)",
            style: GetTextTheme.fs10_bold.copyWith(fontSize: 10.sp),
            maxLines: 2,
            textAlign: TextAlign.center,
          ),

          RichText(
              text: TextSpan(children: [
            TextSpan(
              text: "₹ 2,750 ",
              style: TextStyle(
                  decoration: TextDecoration.lineThrough,
                  color: AppColors.redColor,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400),
            ),
            TextSpan(
                text: "₹ 2,500",
                style: GetTextTheme.fs10_regular.copyWith(fontSize: 10.sp))
          ])),

          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.add_circle_sharp,
                color: AppColors.primaryColor,
              ),
              10.w.widthBox,
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
        ],
      ),
    ),
  );
}

Widget lowPriceTile(ItemModel item) {
  return InkWell(
    onTap: () {
      var controller = Get.put(ItemDetailsController());
      controller.updateItem(item);
      Get.to(() => ItemDetailsView());
    },
    child: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3.sp),
              border: Border.all(color: Colors.white, width: 2),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: AppColors.greylightcolor,
                    blurRadius: 1,
                    spreadRadius: 0.4)
              ]),
          child: Column(
            children: [
              SizedBox(
                height: 8.h,
              ),
              // rating and discount

              Row(
                children: [
                  5.w.widthBox,
                  Icon(
                    Icons.star,
                    color: AppColors.primaryColor,
                    size: 10,
                  ),
                  2.w.widthBox,
                  Text("5.0",
                      style: GetTextTheme.fs10_regular.copyWith(fontSize: 10)),
                ],
              ),

              // item image

              SizedBox(
                height: 1.h,
              ),
              Image.asset(TopDealItems.chana, height: 55.h),

              ///// title  /////
              Text(
                "Desi Chana 50kg",
                style: GetTextTheme.fs10_bold.copyWith(fontSize: 10.sp),
              ),
              //// subtitle////

              Text(
                "SAVE TIME SAVE MONEY (BARWLA)",
                style: GetTextTheme.fs10_bold.copyWith(fontSize: 8.sp),
                maxLines: 2,
                textAlign: TextAlign.center,
              ),

              RichText(
                  text: TextSpan(children: [
                TextSpan(
                  text: "₹ 2,750 ",
                  style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: AppColors.redColor,
                      fontSize: 9.sp,
                      fontWeight: FontWeight.w400),
                ),
                TextSpan(
                    text: "₹ 2,500",
                    style: GetTextTheme.fs10_regular.copyWith(fontSize: 9.sp))
              ])),
            ],
          ),
        ),
        Positioned(
            top: 8.h,
            right: 0,
            child: Container(
                height: 13.h,
                width: 42.w,
                // padding: EdgeInsets.symmetric(horizontal: 3.w),
                alignment: Alignment.center,
                color: AppColors.primaryColor,
                child: Text(
                  "110.0₹ OFF",
                  style: GetTextTheme.fs10_regular
                      .copyWith(fontSize: 7, color: Colors.white),
                ))),
        Positioned(
          bottom: 3,
          right: 5.w,
          child: Icon(
            Icons.add_circle_sharp,
            size: 12.sp,
            color: AppColors.primaryColor,
          ),
        )
      ],
    ),
  );
}

Widget animalSupplimentsTile() {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.greythinColor, width: 2.sp)),
    child: Column(
      children: [
        Image.asset("assets/animalSuppliments/an4.png", height: 100.h),
        2.h.heightBox,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Lorem Ipsum",
              style: GetTextTheme.fs16_bold,
            ),
            2.h.heightBox,
            Text(
              "₹340.0",
              style: GetTextTheme.fs12_regular,
            ),
          ],
        )
      ],
    ),
  );
}

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
