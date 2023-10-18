import 'package:cattel_feed/Helper/nextscreen.dart';
import 'package:cattel_feed/Helper/textstyle.dart';
import 'package:cattel_feed/const/colors.dart';
import 'package:cattel_feed/const/icon.dart';
import 'package:cattel_feed/main.dart';
import 'package:cattel_feed/screens/component/gridview.dart';
import 'package:cattel_feed/screens/ui/cart_view/cart_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

AppBar customAppBar(BuildContext context) {
  return AppBar(
    toolbarHeight: 85.h,
    flexibleSpace: Container(
      decoration: BoxDecoration(gradient: titleWidgetGradient),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10.sp),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.location_on,color: Colors.white,),
                  10.w.widthBox,
                  Expanded(
                    child: Row(
                      children: [
                        Text("Unknown Location Found",
                            style: GetTextTheme.fs16_medium
                                .copyWith(color: Colors.white)),
                        Icon(Icons.arrow_drop_down,color: Colors.white,),
                      ],
                    ),
                  ),
                  Icon(Icons.notifications,color: Colors.white,)
                ],
              ),
              5.h.heightBox,
              Row(
                children: [
                  Icon(Icons.density_medium_rounded,color: Colors.white),
                  10.w.widthBox,
                  Expanded(
                      child: TextField(
                    cursorColor: AppColors.primaryColor,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      fillColor: Color(
                        0xffE1E1E1,
                      ),
                      filled: true,
                      hintStyle: TextStyle(fontSize: 12),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(30)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(30)),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black54,
                      ),
                      hintText: "Search your desired items or stores",
                    ),
                  )),
                  10.w.widthBox,
                  InkWell(
                    onTap: () => nextscreen(context,CartView.route ),
                    child: Icon(Icons.shopping_cart,color: Colors.white,)),
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
          border: Border.all(color: AppColors.gerythinColor, width: 2.sp)),
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
            style:
                GetTextTheme.fs16_bold.copyWith(color: AppColors.primaryColor),
          ),
        ],
      ),
    );
  }
Widget lowPriceItemTiel({bool isLowPriceTile = false, bool isBestSellingTiel = false}) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(isLowPriceTile?5:10),
        border: Border.all(color: isBestSellingTiel?AppColors.gerythinColor: Colors.white,width: 2),
        color: Colors.white,
        boxShadow:  [
       !isBestSellingTiel?   BoxShadow(
              color: Colors.grey.shade500,
              blurRadius: 3,
              offset: Offset(-2, 2)): const BoxShadow(),
        ]),
    child: Column(
      children: [
        SizedBox(
          height: isLowPriceTile?8.h:15.h,
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
                Text("5.0", style: GetTextTheme.fs10_regular.copyWith(
                  fontSize: isLowPriceTile?6:10
                )),
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
                      .copyWith(fontSize: isLowPriceTile?6:9, color: Colors.white),
                ))
          ],
        )
        // item image
,
 SizedBox(
          height: isLowPriceTile?2.h:4.h,
        ),       
        Image.asset(TopDealItems.chana, height:isLowPriceTile?50.sp:75.sp),
        SizedBox(
          height: isLowPriceTile?3.h:8.h,
        ),
        ///// title  /////
        Text(
          "Desi Chana 50kg",
          style: GetTextTheme.fs10_bold.copyWith(fontSize: isLowPriceTile?6.sp: 12.sp),
        ),
        //// subtitle////
         SizedBox(
          height: isLowPriceTile?1.h:2.h,
        ),
        Text(
          "SAVE TIME SAVE MONEY (BARWLA)",
          style: GetTextTheme.fs10_bold.copyWith(fontSize: isLowPriceTile?6.sp: 10.sp),
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
                fontSize: isLowPriceTile? 6.sp:10.sp,
                fontWeight: FontWeight.w400),
          ),
          TextSpan(text: "₹ 2,500", style: GetTextTheme.fs10_regular.copyWith(
            fontSize: isLowPriceTile? 6.sp:10.sp
          ))
        ])),
        SizedBox(
          height: isLowPriceTile?1.h:2.h,
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              Icons.add_circle_sharp,
              color: AppColors.primaryColor,
            ),
            10.w.widthBox,
          ],
        )
        ,
      ],
    ),
  );
}

Widget animalSupplimentsTile(){
  return Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                    color: AppColors.gerythinColor, width: 2.sp)),
                                   child: Column(
                                    children: [
                                      Image.asset("assets/animalSuppliments/an4.png",height: 100.h),
                                      2.h.heightBox,
                                      Text("Lorem Ipsum",style: GetTextTheme.fs16_bold,),
                                          2.h.heightBox,

                                      Text("₹340",style: GetTextTheme.fs12_regular,)
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
        {bool isScrollAble = false, double crossAxisSpacing = 7, double mainAxisSpacing = 7}) =>
    GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        shrinkWrap: true,
        physics: isScrollAble
            ? const BouncingScrollPhysics()
            : const NeverScrollableScrollPhysics(),
        itemCount: count,
        gridDelegate: customgridDelegate(itemInRow, aspectRatio,
            crossAxisSpacing: crossAxisSpacing,mainAxisSpacing: mainAxisSpacing),
        itemBuilder: (context, index) => child(index));

decorationWithImage(String image) {
  return BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
      color: Colors.red);
}
