import 'package:carousel_slider/carousel_slider.dart';
import 'package:cattel_feed/backend/dummyData.dart';
import 'package:cattel_feed/const/colors.dart';
import 'package:cattel_feed/const/img.dart';
import 'package:cattel_feed/routes/routes.dart';
import 'package:cattel_feed/screens/component/custom_text.dart';
import 'package:cattel_feed/screens/component/gridview.dart';
import 'package:cattel_feed/screens/component/viewallrow.dart';
import 'package:cattel_feed/Helper/nextscreen.dart';
import 'package:cattel_feed/Helper/textstyle.dart';
import 'package:cattel_feed/screens/ui/homepage/home_view/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({super.key});

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  var searchController = TextEditingController();
  CarouselController carouselController = CarouselController();
  int currentcarouselIndex = 0;
  int categoriesColorIndex = 0;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        ////////////////////////////// App Bar  ////////////////////////
        appBar: customAppBar(context),

        ///////////////////////////// body Start From here ///////////////////////
        body: ListView(children: [
          Container(
            height: 40.h,
            color: Colors.black,
            child:
                ////////////////////// // location top banner///////////////

                Row(
              children: [
                10.w.widthBox,
                Icon(
                  Icons.location_on_outlined,
                  size: 25.sp,
                  color: Colors.white,
                ),
                10.w.widthBox,
                Text(
                  "Add delivery location...>>>",
                  style: GetTextTheme.fs14_medium.copyWith(color: Colors.white),
                )
              ],
            ),
          ),

          ///////////////////////  // store view////////////////
          viewAllRow("Main Categories", () => null, padding: true),
          stroiesView(),
          Image.asset(Ads.adssmallbanner),
          5.h.heightBox,
          Image.asset(Ads.adsbigbanner),
          5.h.heightBox,
          Image.asset(Ads.adsbanner),

          // top deals in animal feed
          Card(
              margin: EdgeInsets.all(10.sp),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  viewAllRow("Top Deals in Animal Feed", () => null,
                      padding: true),
                  customGridVIew(
                      topAnimalFeed.length,
                      16 / 20,
                      2,
                      (index) => topDealsAnimalsFeedTiel(
                          topAnimalFeed[index]["img"],
                          topAnimalFeed[index]["name"],
                          topAnimalFeed[index]["type"],
                          topAnimalFeed[index]["discount"])),
                  10.h.heightBox,
                ],
              )),

          5.h.heightBox,
          Image.asset(Ads.adssmallbanner),
          5.h.heightBox,
          viewAllRow("Lowest Price Items", () => null, padding: true),
          customGridVIew(
              6, 8/10, 3, crossAxisSpacing: 5,mainAxisSpacing: 5, (p0) =>  lowPriceItemTiel(isLowPriceTile: true)),

          10.h.heightBox,
          Image.asset(Ads.adssmallbanner),
          5.h.heightBox,
          Image.asset(Ads.adsbanner),
          5.h.heightBox,
          Card(
              margin: EdgeInsets.all(10.sp),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  viewAllRow("Best Selling Item", () => null, padding: true),
                  customGridVIew(4, 16 / 22, 2, (p0) => lowPriceItemTiel(isBestSellingTiel: true)),
                  10.h.heightBox,
                ],
              )),

          5.h.heightBox,
          Image.asset(Ads.adssmallbanner),
          5.h.heightBox,
          Card(
              margin: EdgeInsets.all(10.sp),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  viewAllRow("Shop from top categories", () => null,
                      padding: true),
                  GridView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    itemCount: categoriesDummyData.length,
                    shrinkWrap: true,
                    gridDelegate: customgridDelegate(3, 16 / 16),
                    itemBuilder: (context, index) {
                      categoriesColorIndex >= categoriesColor.length - 1
                          ? categoriesColorIndex = 0
                          : categoriesColorIndex++;
                      return Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: categoriesColor[categoriesColorIndex],
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: AppColors.greylightcolor, width: 1.sp)),
                        child: Text(
                          categoriesDummyData[index],
                          style: GetTextTheme.fs18_regular.copyWith(
                              color: textColors[categoriesColorIndex]),
                          textAlign: TextAlign.center,
                        ),
                      );
                    },
                  ),
                  10.h.heightBox,
                ],
              )),
          5.h.heightBox,
          Card(
            margin: EdgeInsets.all(10.sp),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                children: [
                  viewAllRow(
                    "Animal Suppliments",
                    () => null,
                    padding: true,
                  ),
                  5.h.heightBox,
                  Image.asset(animalSupplimentsImg.ads2),
                  2.h.heightBox,
                  Image.asset(animalSupplimentsImg.ads1),
                  2.h.h.heightBox,
                  Image.asset(animalSupplimentsImg.ads2),
                  viewAllRow("", () => null),
                  customGridVIew(
                      4,
                      16 / 20,
                      2,
                      crossAxisSpacing: 10,
                      (p0) => animalSupplimentsTile()),
                  10.h.heightBox,
                ],
              ),
            ),
          ),

          viewAllRow("Popular Items Nearby", () => null, padding: true),
          SizedBox(
              height: 100.h,
              width: Get.width,
              child: ListView.separated(
                  shrinkWrap: true,
                  padding: EdgeInsets.only(left: 5.w, bottom: 5.h),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Container(
                        width: Get.width * .75,
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow:  [
                            BoxShadow(
              color: Colors.grey.shade500,
              blurRadius: 3,
              offset: Offset(-2, 2)),
                            ]),
                        child: Stack(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10.sp),
                              child: Row(
                                children: [
                                  Image.asset(
                                      "assets/animalSuppliments/nearby.png"),
                                  10.w.widthBox,
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        customText("Double Hans Binola",
                                            GetTextTheme.fs12_bold),
                                        2.h.heightBox,
                                        customText("SAVE TIME SAVE MONEY",
                                            GetTextTheme.fs10_bold),
                                        2.h.heightBox,
                                        RatingBar.builder(
                                          initialRating: 3,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          itemCount: 5,
                                          itemSize: 20.sp,
                                          itemBuilder: (context, _) =>
                                              const Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          onRatingUpdate: (rating) {},
                                        ),
                                        2.h.heightBox,
                                        RichText(
                                            text: TextSpan(children: [
                                          TextSpan(
                                            text: "₹ 2,750 ",
                                            style: TextStyle(
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                color: AppColors.redColor,
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          TextSpan(
                                              text: "₹ 2,500",
                                              style: GetTextTheme.fs10_bold)
                                        ])),
                                      ],
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Icon(
                                          Icons.add_circle_sharp,
                                          color: AppColors.primaryColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                                top: 10.h,
                                child: Container(
                                  height: 15.h,
                                  width: 50.w,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: AppColors.primaryColor,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10.sp),
                                        bottomRight: Radius.circular(10.sp),
                                      )),
                                  child: Text(
                                    "70.0/ OFF",
                                    style: GetTextTheme.fs10_bold.copyWith(
                                        color: Colors.white, fontSize: 8.sp),
                                  ),
                                ))
                          ],
                        ),
                      ),
                  separatorBuilder: (context, index) => 5.w.widthBox,
                  itemCount: 10)),
          5.h.heightBox,
          viewAllRow("Big Discounts", () => null, padding: true),

          SizedBox(
              height: 210.h,
              width: Get.width,
              child: ListView.separated(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(10),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => SizedBox(
                        width: Get.width * .45,
                        child: lowPriceItemTiel(),
                      ),
                  separatorBuilder: (context, index) => 10.w.widthBox,
                  itemCount: 10)),

          10.h.heightBox,
          Image.asset(animalSupplimentsImg.ads2),
          5.h.heightBox,

          Image.asset(Ads.adssmallbanner),
          5.h.heightBox,

          Image.asset(Ads.adsbanner),
          5.h.heightBox,
        ]));
  }

  Widget stroiesView() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: SizedBox(
        height: 90.h,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: 10,
          separatorBuilder: (context, index) => 5.w.widthBox,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => nextscreen(context, RoutesName.categoiresview),
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
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/ads/categories.jpg"),
                                fit: BoxFit.fill),
                            shape: BoxShape.circle),
                      ),
                    ),
                  ),
                  2.h.heightBox,
                  Text(
                    "Women",
                    textAlign: TextAlign.center,
                    style: GetTextTheme.fs14_regular,
                  ),
                  10.h.heightBox,
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
