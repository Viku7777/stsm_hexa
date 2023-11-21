// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:cattel_feed/Helper/colors.dart';
// import 'package:cattel_feed/backend/dummyData.dart';
// import 'package:cattel_feed/controller/addressController/addressController.dart';
// import 'package:cattel_feed/global/global.dart';

// import 'package:cattel_feed/helper/img.dart';
// import 'package:cattel_feed/controller/item_details_controller/item_view_controller.dart';
// import 'package:cattel_feed/routes/routes.dart';
// import 'package:cattel_feed/view/component/custom_text.dart';
// import 'package:cattel_feed/view/component/gridview.dart';
// import 'package:cattel_feed/view/component/viewallrow.dart';
// import 'package:cattel_feed/Helper/nextscreen.dart';
// import 'package:cattel_feed/Helper/textstyle.dart';
// import 'package:cattel_feed/view/screens/address/add_address/add_new_address.dart';
// import 'package:cattel_feed/view/screens/address/apis.dart';
// import 'package:cattel_feed/view/screens/categories/ui/sub_categories_list.dart';
// import 'package:cattel_feed/view/screens/homepage/home_view/widgets.dart';
// import 'package:cattel_feed/view/screens/homepage/item_List/item_list_screen.dart';
// import 'package:cattel_feed/view/screens/homepage/item_details/item_details.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_geocoder/geocoder.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:velocity_x/velocity_x.dart';

// class HomeScreenView extends StatefulWidget {
//   const HomeScreenView({super.key});

//   @override
//   State<HomeScreenView> createState() => _HomeScreenViewState();
// }

// class _HomeScreenViewState extends State<HomeScreenView> {
//   var searchController = TextEditingController();
//   var listcontroller = Get.put(ItemListController());
//   CarouselController carouselController = CarouselController();
//   int currentcarouselIndex = 0;
//   int categoriesColorIndex = 0;
//   @override
//   void initState() {
//     getData();
//     super.initState();
//   }

//   getData() async {
//     PermissionStatus status = await Permission.location.status;
//     if (!status.isDenied && !status.isLimited) {
//       Coordinates coordinates = await AddressApis.userCurrentLatLng();
//       Address userAddress =
//           await AddressApis.latlngConvertIntoAddress(coordinates);
//       userCurrentAddress = userAddress.addressLine ?? "Unknown Location Found";
//       if (mounted) {
//         setState(() {});
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: AppColors.bgClr,
//         ////////////////////////////// App Bar  ////////////////////////
//         appBar: customAppBar(context),

//         ///////////////////////////// body Start From here ///////////////////////
//         body: SafeArea(
//           child: ListView(children: [
//             GetBuilder<AddressController>(builder: (controller) {
//               if (controller.userAllAddresses.isNotEmpty) {
//                 return const SizedBox();
//               } else {
//                 return Container(
//                   height: 40.h,
//                   color: Colors.black,
//                   child:
//                       ////////////////////// // location top banner///////////////

//                       InkWell(
//                     onTap: () => nextscreen(context, AddNewAddressView.routes),
//                     child: Row(
//                       children: [
//                         10.w.widthBox,
//                         Icon(
//                           Icons.location_on_outlined,
//                           size: 25.sp,
//                           color: Colors.white,
//                         ),
//                         10.w.widthBox,
//                         Text(
//                           "Add delivery location...>>>",
//                           style: GetTextTheme.fs14_medium
//                               .copyWith(color: Colors.white),
//                         )
//                       ],
//                     ),
//                   ),
//                 );
//               }
//             }),
//             ///////////////////////  // store view////////////////
//             viewAllRow("Main Categories",
//                 () => nextscreen(context, RoutesName.categoiresview),
//                 padding: true),
//             stroiesView(),
//             Image.asset(Ads.adssmallbanner),
//             5.h.heightBox,
//             Image.asset(Ads.adsbigbanner),
//             5.h.heightBox,
//             Image.asset(Ads.adsbanner),

//             // top deals in animal feed
//             Card(
//                 margin: EdgeInsets.all(10.sp),
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10)),
//                 child: Column(
//                   children: [
//                     viewAllRow("Top Deals in Animal Feed", () => null,
//                         padding: true),
//                     customGridVIew(
//                         topAnimalFeed.length,
//                         16 / 20,
//                         2,
//                         (index) => topDealsAnimalsFeedTiel(
//                             topAnimalFeed[index]["img"],
//                             topAnimalFeed[index]["name"],
//                             topAnimalFeed[index]["type"],
//                             topAnimalFeed[index]["discount"])),
//                     10.h.heightBox,
//                   ],
//                 )),
// // show carousel slider
//             showcarouselslider(),
//             5.h.heightBox,

//             viewAllRow("Lowest Price Items", () {
//               var controller = Get.put(ItemListController());
//               controller.updateItemList(dummyitemList);
//               Get.to(ItemlistScreen(title: "Lowest Price Items"));
//             }, padding: true),
//             customGridVIew(
//                 6,
//                 8 / 10,
//                 3,
//                 crossAxisSpacing: 5,
//                 mainAxisSpacing: 5,
//                 (index) => lowPriceTile(dummyitemList[index])),

//             10.h.heightBox,
//             showcarouselslider(),
//             5.h.heightBox,
//             Image.asset(Ads.adsbanner),
//             5.h.heightBox,
//             Card(
//                 margin: EdgeInsets.all(10.sp),
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10)),
//                 child: Column(
//                   children: [
//                     viewAllRow("Best Selling Item", () {
//                       var controller = Get.put(ItemListController());
//                       controller.updateItemList(dummyitemList);
//                       Get.to(ItemlistScreen(title: "Lowest Price Items"));
//                     }, padding: true),
//                     customGridVIew(4, 16 / 21, 2,
//                         (index) => bestSellingTiel(dummyitemList[index])),
//                     10.h.heightBox,
//                   ],
//                 )),

//             showcarouselslider(),

//             5.h.heightBox,
//             Card(
//                 margin: EdgeInsets.all(10.sp),
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10)),
//                 child: Column(
//                   children: [
//                     viewAllRow("Shop from top categories", () {
//                       nextscreen(context, RoutesName.categoiresview);
//                     }, padding: true),
//                     GridView.builder(
//                       physics: const NeverScrollableScrollPhysics(),
//                       padding: EdgeInsets.symmetric(horizontal: 10.w),
//                       itemCount: dummyCategoires.length,
//                       shrinkWrap: true,
//                       gridDelegate: customgridDelegate(3, 16 / 16),
//                       itemBuilder: (context, index) {
//                         categoriesColorIndex >= categoriesColor.length - 1
//                             ? categoriesColorIndex = 0
//                             : categoriesColorIndex++;
//                         return InkWell(
//                           onTap: () {
//                             listcontroller.updateItemList(dummyitemList);
//                             Get.to(SubCategoriesItemView(
//                                 category: dummyCategoires[index]));
//                           },
//                           child: Container(
//                             alignment: Alignment.center,
//                             decoration: BoxDecoration(
//                                 color: categoriesColor[categoriesColorIndex],
//                                 borderRadius: BorderRadius.circular(20),
//                                 border: Border.all(
//                                     color: AppColors.greylightcolor,
//                                     width: 1.sp)),
//                             child: Text(
//                               dummyCategoires[index].title,
//                               style: GetTextTheme.fs18_regular.copyWith(
//                                   color: textColors[categoriesColorIndex]),
//                               textAlign: TextAlign.center,
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                     10.h.heightBox,
//                   ],
//                 )),
//             5.h.heightBox,
//             Card(
//               margin: EdgeInsets.all(10.sp),
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10)),
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 10.w),
//                     child: Column(
//                       children: [
//                         viewAllRow(
//                           "Animal Suppliments",
//                           () => null,
//                           padding: true,
//                         ),
//                         5.h.heightBox,
//                         Image.asset(AnimalSupplimentsImg.ads2),
//                         2.h.heightBox,
//                         Image.asset(AnimalSupplimentsImg.ads1),
//                         2.h.h.heightBox,
//                         Image.asset(AnimalSupplimentsImg.ads2),
//                         viewAllRow("", () => null),
//                       ],
//                     ),
//                   ),
//                   customGridVIew(
//                       4,
//                       16 / 18,
//                       2,
//                       crossAxisSpacing: 10,
//                       (p0) => animalSupplimentsTile()),
//                   10.h.heightBox,
//                 ],
//               ),
//             ),

//             viewAllRow("Popular Items Nearby", () {
//               var controller = Get.put(ItemListController());
//               controller.updateItemList(dummyitemList);
//               Get.to(ItemlistScreen(title: "Lowest Price Items"));
//             }, padding: true),
//             SizedBox(
//                 height: 100.h,
//                 width: Get.width,
//                 child: ListView.separated(
//                     shrinkWrap: true,
//                     padding: EdgeInsets.only(left: 5.w, bottom: 5.h),
//                     scrollDirection: Axis.horizontal,
//                     itemBuilder: (context, index) => InkWell(
//                           onTap: () {
//                             var controller = Get.put(ItemDetailsController());
//                             controller.updateItem(dummyitemList[index]);
//                             Get.to(() => ItemDetailsView());
//                           },
//                           child: Container(
//                             width: Get.width * .75,
//                             margin: const EdgeInsets.all(5),
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(10),
//                                 color: Colors.white,
//                                 boxShadow: [
//                                   BoxShadow(
//                                       color: Colors.grey.shade300,
//                                       blurRadius: 3,
//                                       offset: const Offset(2, 2)),
//                                 ]),
//                             child: Stack(
//                               children: [
//                                 Padding(
//                                   padding: EdgeInsets.all(10.sp),
//                                   child: Row(
//                                     children: [
//                                       Image.asset(
//                                           "assets/animalSuppliments/nearby.png"),
//                                       10.w.widthBox,
//                                       Expanded(
//                                         child: Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             customText("Double Hans Binola",
//                                                 GetTextTheme.fs12_bold),
//                                             2.h.heightBox,
//                                             customText("SAVE TIME SAVE MONEY",
//                                                 GetTextTheme.fs10_bold),
//                                             2.h.heightBox,
//                                             RatingBar.builder(
//                                               initialRating: 3,
//                                               minRating: 1,
//                                               direction: Axis.horizontal,
//                                               itemCount: 5,
//                                               itemSize: 20.sp,
//                                               itemBuilder: (context, _) =>
//                                                   const Icon(
//                                                 Icons.star,
//                                                 color: Colors.amber,
//                                               ),
//                                               onRatingUpdate: (rating) {},
//                                             ),
//                                             2.h.heightBox,
//                                             RichText(
//                                                 text: TextSpan(children: [
//                                               TextSpan(
//                                                 text: "₹ 2,750 ",
//                                                 style: TextStyle(
//                                                     decoration: TextDecoration
//                                                         .lineThrough,
//                                                     color: AppColors.redColor,
//                                                     fontSize: 10.sp,
//                                                     fontWeight:
//                                                         FontWeight.w700),
//                                               ),
//                                               TextSpan(
//                                                   text: "₹ 2,500",
//                                                   style: GetTextTheme.fs10_bold)
//                                             ])),
//                                           ],
//                                         ),
//                                       ),
//                                       Align(
//                                         alignment: Alignment.bottomRight,
//                                         child: Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.end,
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.end,
//                                           children: [
//                                             Icon(
//                                               Icons.add_circle_sharp,
//                                               color: AppColors.primaryColor,
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 Positioned(
//                                     top: 10.h,
//                                     child: Container(
//                                       height: 15.h,
//                                       width: 50.w,
//                                       alignment: Alignment.center,
//                                       decoration: BoxDecoration(
//                                           color: AppColors.primaryColor,
//                                           borderRadius: BorderRadius.only(
//                                             topRight: Radius.circular(10.sp),
//                                             bottomRight: Radius.circular(10.sp),
//                                           )),
//                                       child: Text(
//                                         "70.0/ OFF",
//                                         style: GetTextTheme.fs10_bold.copyWith(
//                                             color: Colors.white,
//                                             fontSize: 8.sp),
//                                       ),
//                                     ))
//                               ],
//                             ),
//                           ),
//                         ),
//                     separatorBuilder: (context, index) => 5.w.widthBox,
//                     itemCount: 10)),
//             5.h.heightBox,
//             viewAllRow("Big Discounts", () {
//               var controller = Get.put(ItemListController());
//               controller.updateItemList(dummyitemList);
//               Get.to(ItemlistScreen(title: "Big Discounts"));
//             }, padding: true),

//             SizedBox(
//                 height: 210.h,
//                 width: Get.width,
//                 child: ListView.separated(
//                     shrinkWrap: true,
//                     padding: const EdgeInsets.all(10),
//                     scrollDirection: Axis.horizontal,
//                     itemBuilder: (context, index) => SizedBox(
//                           width: 150.w,
//                           child: itemPreviewTiel(dummyitemList[index]),
//                         ),
//                     separatorBuilder: (context, index) => 10.w.widthBox,
//                     itemCount: 10)),

//             10.h.heightBox,
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 10.w),
//               child: Image.asset(AnimalSupplimentsImg.ads2),
//             ),
//             5.h.heightBox,

//             showcarouselslider(),
//             5.h.heightBox,
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 10.w),
//               child: Image.asset(Ads.adsbanner),
//             ),

//             5.h.heightBox,
//           ]),
//         ));
//   }

//   Widget stroiesView() {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 10.w),
//       child: SizedBox(
//         height: 90.h,
//         child: ListView.separated(
//           scrollDirection: Axis.horizontal,
//           shrinkWrap: true,
//           itemCount: dummyCategoires.length,
//           separatorBuilder: (context, index) => 5.w.widthBox,
//           itemBuilder: (context, index) {
//             return InkWell(
//               onTap: () {
//                 listcontroller.updateItemList(dummyitemList);
//                 Get.to(SubCategoriesItemView(category: dummyCategoires[index]));
//               },
//               child: Column(
//                 children: [
//                   Expanded(
//                     child: Container(
//                       height: 50.h,
//                       width: 70.w,
//                       padding: const EdgeInsets.all(2),
//                       alignment: Alignment.center,
//                       decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           gradient: titleWidgetGradient),
//                       child: Container(
//                         decoration: BoxDecoration(
//                             image: DecorationImage(
//                                 image:
//                                     NetworkImage(dummyCategoires[index].image),
//                                 fit: BoxFit.cover),
//                             shape: BoxShape.circle),
//                       ),
//                     ),
//                   ),
//                   2.h.heightBox,
//                   Text(
//                     dummyCategoires[index].title,
//                     textAlign: TextAlign.center,
//                     style: GetTextTheme.fs14_regular,
//                   ),
//                   10.h.heightBox,
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }

//   Widget showcarouselslider() {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 10.w),
//       child: CarouselSlider(
//           items: [
//             Image.asset(Ads.adssmallbanner),
//           ],
//           options: CarouselOptions(
//             height: 150.h,
//             aspectRatio: 13 / 12,
//             viewportFraction: 1,
//             initialPage: 0,
//             enableInfiniteScroll: true,
//             reverse: false,
//             autoPlay: true,
//             autoPlayInterval: const Duration(seconds: 3),
//             autoPlayAnimationDuration: const Duration(milliseconds: 800),
//             autoPlayCurve: Curves.fastOutSlowIn,
//             enlargeCenterPage: true,
//             enlargeFactor: 0.3,
//             onPageChanged: (index, reason) {},
//             scrollDirection: Axis.horizontal,
//           )),
//     );
//   }
// }
