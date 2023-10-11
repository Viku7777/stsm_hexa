import 'package:carousel_slider/carousel_slider.dart';
import 'package:cattel_feed/Helper/title_banner.dart';
import 'package:cattel_feed/backend/dummyData.dart';
import 'package:cattel_feed/const/colors.dart';
import 'package:cattel_feed/const/icon.dart';
import 'package:cattel_feed/const/img.dart';
import 'package:cattel_feed/routes/routes.dart';
import 'package:cattel_feed/screens/component/custom_text.dart';
import 'package:cattel_feed/screens/component/gridview.dart';
import 'package:cattel_feed/screens/component/text_field.dart';
import 'package:cattel_feed/screens/component/viewallrow.dart';
import 'package:cattel_feed/Helper/nextscreen.dart';
import 'package:cattel_feed/Helper/textstyle.dart';
import 'package:cattel_feed/screens/ui/categories/component/component.dart';
import 'package:cattel_feed/screens/ui/homepage/home_view/image_with_gradientborder.dart';
import 'package:cattel_feed/screens/ui/homepage/home_view/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // app bar
      appBar: AppBar(
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 8.w),
          child: CircleAvatar(
              radius: 35.sp, child: Image.asset(IconsClass.personIcon)),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello,",
              style: GetTextTheme.fs12_regular,
            ),
            Text(
              "Let’s explore!",
              style: GetTextTheme.fs14_bold,
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_none_outlined)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.shopping_cart_outlined))
        ],
      ),
      // body
      body: ListView(
        children: [
          // location top banner
          Container(
            height: 40.h,
            decoration: BoxDecoration(gradient: titleWidgetGradient),
            child: Row(
              children: [
                10.w.widthBox,
                Icon(
                  Icons.location_on_outlined,
                  size: 25.sp,
                ),
                10.w.widthBox,
                Text(
                  "Add delivery location...>>>",
                  style: GetTextTheme.fs14_medium.copyWith(color: Colors.white),
                )
              ],
            ),
          ),

          // search bar //
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextfield(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              controller: searchController,
              prefixIcon: Icon(
                Icons.search,
                color: AppColors.greylightcolor,
              ),
              suffixIcon: const Icon(
                Icons.sort,
                color: Colors.black,
              ),
              hintText: "Search by Keyword or Product ID",
              hintStyle: GetTextTheme.fs14_regular
                  .copyWith(color: AppColors.greylightcolor),
            ),
          ),

          // store view
          stroiesView(),
          // show offers in carousel_slider,
          showCarousel(),
          // Weekly Top Deals
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              children: [
                viewAllRow("Weekly Top Deals", () => null),
                SizedBox(
                  height: 120.h,
                  child: customListview(
                    weeklyItems.length,
                    (index) => Column(
                      children: [
                        Expanded(
                          child: Container(
                            width: 100.w,
                            alignment: Alignment.bottomRight,
                            decoration: decorationWithImage(
                                weeklyItems[index]["image"]),
                            child: Container(
                              height: 58.h,
                              width: 33.w,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    bottomLeft: Radius.circular(15),
                                    bottomRight: Radius.circular(15),
                                  )),
                              child: Text(
                                "${weeklyItems[index]["type"]}\n${weeklyItems[index]["sale"]}%\nOff",
                                textAlign: TextAlign.center,
                                style: GetTextTheme.fs14_bold
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        customText(weeklyItems[index]["product"],
                            GetTextTheme.fs14_regular)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// banner
          10.h.heightBox,
          bannerWithTitle("Kids Garments & Accessories"),
          10.h.heightBox,
          SizedBox(
            height: 120.h,
            child: Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: customListview(
                5,
                (p0) => Container(
                  width: 100.w,
                  alignment: Alignment.bottomRight,
                  decoration: decorationWithImage(dummyitems[2]["image"]),
                  child: Container(
                      height: 25.h,
                      width: 100.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      child: customText(
                          "T Shirts",
                          GetTextTheme.fs12_medium
                              .copyWith(color: Colors.white))),
                ),
              ),
            ),
          ),
          10.h.heightBox,
          Image.asset(Ads.adsbanner),
          //  Budget Store vieew
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                10.h.heightBox,
                customText("Budget Store", GetTextTheme.fs14_bold),
                10.h.heightBox,
                SizedBox(
                  height: 75.h,
                  child: customListview(
                      10,
                      (p0) => Container(
                          width: 75.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image:
                                      AssetImage(IconsClass.priceContainer))),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Expanded(child: SizedBox()),
                                Text("UNDER", style: GetTextTheme.fs12_regular),
                                Text("₹90", style: GetTextTheme.fs18_bold),
                                10.h.heightBox,
                              ]))),
                ),
                10.h.heightBox,
                customText("Heavy Discounts", GetTextTheme.fs14_bold),
                2.h.heightBox,
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "Discount will end in :",
                      style: GetTextTheme.fs12_regular),
                  TextSpan(
                      text: " 01h : 21m : 02s",
                      style: GetTextTheme.fs12_bold
                          .copyWith(color: AppColors.redColor)),
                ])),
                5.h.heightBox,
                Row(
                  children: [
                    Expanded(
                        child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: const BorderSide(color: Colors.black12)),
                            child: Image.asset(
                              IconsClass.summeroffer1,
                              height: 195.h,
                              fit: BoxFit.cover,
                            ))),
                    5.w.widthBox,
                    Expanded(
                        child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: const BorderSide(color: Colors.black12)),
                            child: Image.asset(
                              IconsClass.summeroffer2,
                              height: 195.h,
                              fit: BoxFit.cover,
                            )))
                  ],
                )
              ],
            ),
          ),
          10.h.heightBox,

          bannerWithTitle("Men’s Budget Store"),
          10.h.heightBox,

          customGridVIew(
            6,
            .7,
            3,
            (index) => Column(
              children: [
                Expanded(
                    child:
                        imageWithGradient(dummyitems[2]["image"], height: 100)),
                Text(
                  "Shirts \nunder 299",
                  style: GetTextTheme.fs14_regular,
                  textAlign: TextAlign.center,
                ),
                5.h.heightBox,
              ],
            ),
          ),

          10.h.heightBox,
          bannerWithTitle("Women’s Budget Store"),
          10.h.heightBox,
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topCenter,
                  stops: [
                    0,
                    20,
                    70,
                    100
                  ],
                  colors: [
                    Color(0xff01bbbd),
                    Color(0xffFFFFFF),
                    Color(0xff01bbbd),
                    Color(0xffFFFFFF),
                  ]),
            ),
            child: Column(
              children: [
                customGridVIew(
                  6,
                  .7,
                  3,
                  (p0) => Column(
                    children: [
                      Expanded(
                          child: imageWithGradient(dummyitems[2]["image"],
                              height: 100)),
                      Text(
                        "Shirts \nunder 299",
                        style: GetTextTheme.fs14_regular,
                        textAlign: TextAlign.center,
                      ),
                      5.h.heightBox,
                    ],
                  ),
                ),
                showCarousel(),
                10.h.heightBox,
              ],
            ),
          ),

          2.h.heightBox,
          bannerWithTitle("Home & Kitchen"),
          10.h.heightBox,
          customGridVIew(
            6,
            .7,
            3,
            (p0) => Column(
              children: [
                Expanded(
                    child:
                        imageWithGradient(dummyitems[2]["image"], height: 100)),
                Text(
                  "Shirts \nunder 299",
                  style: GetTextTheme.fs14_regular,
                  textAlign: TextAlign.center,
                ),
                5.h.heightBox,
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: viewAllRow("Trending", () => null),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: customGridVIew(
              5,
              .8,
              2,
              (index) => Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Container(
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          image: DecorationImage(
                              image: NetworkImage(dummyitems[index]["image"]),
                              fit: BoxFit.cover)),
                    )),
                    10.h.heightBox,
                    Padding(
                      padding: EdgeInsets.only(left: 5.h),
                      child: Text(
                        "Premium Sunglasses for you",
                        style: GetTextTheme.fs12_regular
                            .copyWith(color: AppColors.greylightcolor),
                      ),
                    ),
                    2.h.heightBox,
                    Padding(
                      padding: EdgeInsets.only(left: 5.h),
                      child: Text(
                        "Explore Now",
                        style: GetTextTheme.fs12_regular
                            .copyWith(color: AppColors.primaryColor),
                      ),
                    ),
                    10.h.heightBox,
                  ],
                ),
              ),
            ),
          ),
          10.h.heightBox,

          bannerWithTitle("Electronics"),
          10.heightBox,
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topCenter,
                  stops: [
                    0,
                    20,
                    70,
                    100
                  ],
                  colors: [
                    Color(0xff01bbbd),
                    Color(0xffFFFFFF),
                    Color(0xff01bbbd),
                    Color(0xffFFFFFF),
                  ]),
            ),
            child: Column(
              children: [
                customGridVIew(
                  4,
                  1,
                  2,
                  (index) => Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Container(
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                              image: DecorationImage(
                                  image:
                                      NetworkImage(dummyitems[index]["image"]),
                                  fit: BoxFit.cover)),
                        )),
                        10.h.heightBox,
                        Padding(
                          padding: EdgeInsets.only(left: 5.h),
                          child: Text(
                            "Smart Watches",
                            style: GetTextTheme.fs14_bold,
                          ),
                        ),
                        2.h.heightBox,
                        Padding(
                          padding: EdgeInsets.only(left: 5.h),
                          child: Text("Explore Now",
                              style: GetTextTheme.fs12_regular),
                        ),
                        10.h.heightBox,
                      ],
                    ),
                  ),
                ),
                20.h.heightBox,
                SizedBox(
                    height: 120.h,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.w),
                      child: customListview(
                        4,
                        (p0) => Column(
                          children: [
                            Expanded(
                              child: imageWithGradient(dummyitems[2]["image"],
                                  width: 100.w),
                            ),
                            5.h.heightBox,
                            Text(
                              "Mobile Covers",
                              style: GetTextTheme.fs12_regular,
                            ),
                            5.h.heightBox,
                          ],
                        ),
                      ),
                    )),
                Image.asset(
                  Ads.adsbigbanner,
                ),
                Container(
                  padding: EdgeInsets.only(top: 10.h),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        end: Alignment.topCenter,
                        stops: [
                          0,
                          20,
                          70,
                          100
                        ],
                        colors: [
                          Color(0xff01bbbd),
                          Color(0xffFFFFFF),
                          Color(0xff01bbbd),
                          Color(0xffFFFFFF),
                        ]),
                  ),
                  child: Column(
                    children: [
                      customGridVIew(
                        6,
                        7 / 9,
                        3,
                        (p0) => Column(
                          children: [
                            Expanded(
                                child: imageWithGradient(dummyitems[2]["image"],
                                    height: 100)),
                            2.h.heightBox,
                            Text(
                              "Shirts",
                              style: GetTextTheme.fs14_regular,
                              textAlign: TextAlign.center,
                            ),
                            5.h.heightBox,
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          5.h.heightBox,
          showCarousel(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: viewAllRow("Shop by brands", () => null),
          ),
          customGridVIew(6, 9/5, 3, (index) => Container(
            alignment: Alignment.center,
            decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.red),
            child: const Text("DELL"),)),
            20.h.heightBox,


        ],
      ),
    );
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
                      padding: const EdgeInsets.all(1),
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

  // show offer using carousel_slider

  Widget showCarousel() => Column(children: <Widget>[
        CarouselSlider.builder(
            itemCount: 5,
            carouselController: carouselController,
            options: CarouselOptions(
              aspectRatio: 16 / 7,
              autoPlay: true,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  currentcarouselIndex = index;
                });
              },
            ),
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) =>
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 10.w),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(Ads.carouselAds),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(15)))),
        5.h.heightBox,
        PageViewDotIndicator(
          currentItem: currentcarouselIndex,
          count: 5,
          unselectedColor: Colors.black26,
          selectedColor: AppColors.primaryColor,
        )
      ]);

// top deals view
}
