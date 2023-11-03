// ignore_for_file: must_be_immutable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cattel_feed/Helper/colors.dart';
import 'package:cattel_feed/Helper/nextscreen.dart';
import 'package:cattel_feed/Helper/textstyle.dart';
import 'package:cattel_feed/backend/dummyData.dart';

import 'package:cattel_feed/helper/icon.dart';
import 'package:cattel_feed/controller/addressController/pincodeController.dart';
import 'package:cattel_feed/controller/cart_controller.dart/cart_controller.dart';
import 'package:cattel_feed/controller/item_details_controller/item_view_controller.dart';
import 'package:cattel_feed/main.dart';
import 'package:cattel_feed/model/cart_model.dart';
import 'package:cattel_feed/model/item_model.dart';
import 'package:cattel_feed/model/productsModel.dart';
import 'package:cattel_feed/routes/routes.dart';
import 'package:cattel_feed/view/component/appbar_component.dart';
import 'package:cattel_feed/view/component/custom_text.dart';
import 'package:cattel_feed/view/component/icon_with_gradinet.dart';
import 'package:cattel_feed/view/component/rating_tile.dart';
import 'package:cattel_feed/view/component/users_review_tiel.dart';
import 'package:cattel_feed/view/component/viewallrow.dart';
import 'package:cattel_feed/view/screens/homepage/item_List/item_list_screen.dart';
import 'package:cattel_feed/view/screens/homepage/item_List/item_view_tile.dart';
import 'package:cattel_feed/view/screens/homepage/item_details/available_size_tile.dart';
import 'package:cattel_feed/view/screens/homepage/item_details/showRatingtile.dart';
import 'package:cattel_feed/view/screens/homepage/item_details/show_more_option_tile.dart';
import 'package:cattel_feed/view/screens/homepage/show_rating/reviews_Comments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:velocity_x/velocity_x.dart';

class ItemDetailsView extends StatelessWidget {
  ItemDetailsView({
    super.key,
  });

  var searchPincodeController = TextEditingController();

  var controller = Get.put(PincodeController());
  var cartcontroller = Get.put(CartController());

  EdgeInsetsGeometry contentPaddings = EdgeInsets.symmetric(horizontal: 10.w);

  String storename = "Xyz Store";
  final pgcontroller = PageController(viewportFraction: 1, keepPage: true);

  String storeAddress = "#001, city, state - 0011001";

  @override
  Widget build(BuildContext context) {
    var itemdetailsController = Get.put(ItemDetailsController());

    final pages = List.generate(
        itemdetailsController.currentitem.images.length,
        (index) => Image.network(
              itemdetailsController.currentitem.images[index],
              fit: BoxFit.cover,
            ));
    return Scaffold(
      backgroundColor: Colors.white,

      // app bar
      appBar: customAppbar(itemdetailsController.currentitem.productName),

      // ////////// body start //////////////////
      body: ListView(
        children: [
          // main product images
          Stack(
            children: [
              ////////////////// product image ////////////////
              SizedBox(
                height: 400.h,
                child: PageView.builder(
                  controller: pgcontroller,
                  // itemCount: pages.length,
                  itemBuilder: (_, index) {
                    return pages[index % pages.length];
                  },
                ),
              ),

              Positioned(
                  bottom: 10.h,
                  left: screenSize.width * .4,
                  child: SmoothPageIndicator(
                      controller: pgcontroller, // PageController
                      count: itemdetailsController.currentitem.images.length,
                      effect: ExpandingDotsEffect(
                          dotHeight: 10,
                          dotWidth: 10,
                          radius: 20.sp,
                          dotColor: Colors.grey.shade400,
                          activeDotColor:
                              Colors.white), // your preferred effect
                      onDotClicked: (index) {})),
              Positioned(
                top: 25.h,
                right: 25.w,
                child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child:
                        GetBuilder<ItemListController>(builder: (controller) {
                      bool isFav = controller.allitems
                          .firstWhere((element) =>
                              element.itemid ==
                              itemdetailsController.currentitem.itemid)
                          .isFav;
                      return IconButton(
                          onPressed: () {
                            controller.updateFavItem(
                              itemdetailsController.currentitem.itemid,
                            );
                          },
                          icon: isFav
                              ? const Icon(Icons.favorite)
                              : const Icon(Icons.favorite_border),
                          color: AppColors.redColor);
                    })),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
            ).copyWith(top: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///////// // product title /////////////////
                customText(
                  itemdetailsController.currentitem.itemdetails,
                  GetTextTheme.fs14_regular,
                ),
                10.h.heightBox,
                /////////////// ///// ///  // product name ////////////////
                customText(itemdetailsController.currentitem.productName,
                    GetTextTheme.fs14_bold),
                // product delivery type
                customText(
                  "Free Delivery",
                  GetTextTheme.fs12_regular
                      .copyWith(color: AppColors.greylightcolor),
                ),

                ///////////////// / /// price section ///////////////////
                Row(
                  children: [
                    // old price
                    customText(
                      "₹ ${itemdetailsController.currentitem.oldprice.toInt()}",
                      GetTextTheme.fs18_medium.copyWith(
                          decoration: TextDecoration.lineThrough,
                          color: AppColors.greylightcolor),
                    ),
                    10.w.widthBox,

                    // current price
                    GetBuilder<ItemDetailsController>(
                      builder: (controller) {
                        return customText(
                          controller.currentprice == 0
                              ? "₹ ${controller.currentitem.currentprice}"
                              : "₹ ${controller.currentprice}",
                          GetTextTheme.fs18_bold
                              .copyWith(color: AppColors.primaryColor),
                        );
                      },
                    )
                  ],
                ),

                ////////////// // item rating section//////////////////
                Row(
                  children: [
                    // item rating bar
                    customratingTile(),
                    5.w.widthBox,
                    // item rating in text form
                  ],
                ),
                ////////// // more similar item view /////////////

                20.h.heightBox,
                customText(
                  "More Options",
                  GetTextTheme.fs14_regular,
                ),
                10.h.heightBox,

                // more item grid view
                SizedBox(
                  height: 100.h,
                  child: ListView.builder(
                      itemCount: dummyitems.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => showNetworkImage(
                          itemdetailsController.currentitem.images[0])),
                ),
                20.h.heightBox,
                /////////////////////////// Available size view /////////////
                customtitleText("Available Sizes"),
                10.h.heightBox,

                SizedBox(
                    height: 30.h,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            itemdetailsController.currentitem.size.length,
                        itemBuilder: (context, index) {
                          return GetBuilder<ItemDetailsController>(
                              builder: (controller) {
                            String currentSize = itemdetailsController
                                .currentitem.size[index].size;
                            String selectSize = controller.selectsize.isEmpty
                                ? controller.currentitem.size.first.size
                                : controller.selectsize;
                            bool isSelected = currentSize == selectSize;
                            return InkWell(
                              onTap: () {
                                controller.updateSize(currentSize);
                              },
                              child: Container(
                                width: 60.w,
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(right: 10.w),
                                decoration: BoxDecoration(
                                    color: isSelected
                                        ? const Color(0xffFFAE00)
                                        : AppColors.greythinColor,
                                    borderRadius: BorderRadius.circular(30.sp)),
                                child: Text(
                                  currentSize,
                                  style: GetTextTheme.fs16_regular.copyWith(
                                      color: isSelected
                                          ? Colors.white
                                          : Colors.black),
                                ),
                              ),
                            );
                          });
                        })),

                20.h.heightBox,
                //////////////// Product Discription ////////////////
                Text(
                  "Product Details",
                  style: GetTextTheme.fs14_regular,
                ),
                10.h.heightBox,
                Text(
                  itemdetailsController.currentitem.description,
                  style: GetTextTheme.fs14_regular,
                ),
                10.h.heightBox,
              ],
            ),
          ),
          const Divider(
            color: Colors.grey,
          ),

          /////////////////////// Seller Store ////////////////////////
          Padding(
            padding: contentPaddings,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customtitleText("Seller Details"),
                10.h.heightBox,
                ListTile(
                  shape: customroundedBorder(10),
                  tileColor: AppColors.greythinColor,
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Image.asset(IconsClass.storeicon),
                  ),
                  // seller store name

                  title: Text(
                    storename,
                    style: GetTextTheme.fs14_bold,
                  ),
                  // seller store address

                  subtitle: Text(
                    storeAddress,
                    style: GetTextTheme.fs12_regular,
                  ),
                  trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.more_vert_outlined,
                        color: Colors.black,
                      )),
                ),
                10.h.heightBox,
                customtitleText("More from seller"),

                ///////////////// Similar  item from another seller  /////////////////
                // SizedBox(
                //   height: 198.h,
                //   child: ListView.builder(
                //       itemCount: dummyitems.length,
                //       scrollDirection: Axis.horizontal,
                //       itemBuilder: (context, index) {
                //         List<ProductModels> items = dummyitems
                //             .map((e) => ProductModels.fromJson(e))
                //             .toList();

                //         return SizedBox(
                //           width: 120.w,
                //           child:
                //               ItemViewTiel(item: items[index], showMore: true),
                //         );
                //       }),
                // ),
              ],
            ),
          ),
          5.h.heightBox,
          const Divider(
            color: Colors.grey,
            thickness: 1.5,
          ),
          const ShowRatingTile(),
          5.h.heightBox,

          // ///////////// Product rating by users /////////////////////
          ListView.builder(
            padding: contentPaddings,
            itemCount: 3,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) => customersReviewtile(index),
          ),
          Padding(
              padding: contentPaddings,
              child: viewAllRow(
                "${availableReview.length - 3} More Reviews",
                () => nextscreen(context, ShowAllRatingsView.routes),
                textcolor: 0xff54B435,
                icon: Icon(
                  Icons.arrow_circle_right,
                  color: AppColors.primaryColor,
                ),
              )),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                10.h.heightBox,
                Text(
                  "Check Delivery Availablity",
                  style: GetTextTheme.fs14_regular,
                ),
                10.h.heightBox,

                /////////////// Check Delivery Section  ///////////////////
                Card(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10))),
                  // pincode text field
                  child: TextField(
                    controller: searchPincodeController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        suffixIcon: TextButton(
                            onPressed: () {
                              controller
                                  .updateSearch(searchPincodeController.text);
                            },
                            child: Text(
                              "Check",
                              style: GetTextTheme.fs14_regular
                                  .copyWith(color: AppColors.primaryColor),
                            )),
                        contentPadding: EdgeInsets.only(left: 10.w, top: 10.h),
                        border: InputBorder.none,
                        hintText: 'Enter pin code',
                        hintStyle: GetTextTheme.fs12_regular.copyWith(
                            fontSize: 15.sp, color: const Color(0xff5B5B5B))),
                  ),
                ),
                Obx(() {
                  if (controller.searchPin.isEmpty) {
                    return customText(
                      "Delivery charges may vary according to pincode",
                      GetTextTheme.fs12_regular.copyWith(color: Colors.grey),
                    );
                  } else if (controller.availablepins
                      .contains(int.parse(controller.searchPin))) {
                    return customText(
                      "Expected Delivery in 2 Days.",
                      GetTextTheme.fs12_regular
                          .copyWith(color: AppColors.orange),
                    );
                  } else {
                    return customText(
                      "Item is not deliverable at your address.",
                      GetTextTheme.fs12_regular
                          .copyWith(color: AppColors.redColor),
                    );
                  }
                })
              ],
            ),
          ),
          10.h.heightBox,
          Image.asset(
            AppBanner.shipingBanner,
            fit: BoxFit.cover,
          ),

          20.h.heightBox,

          // add to cart or buy now button

          Padding(
            padding: contentPaddings,
            child: Row(
              children: [
                // add to cart button
                Expanded(
                  child: InkWell(
                    onTap: () {
                      cartcontroller.addItemInCart(
                          itemdetailsController.currentitem.itemid);

                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: AppColors.greenColor,
                        behavior: SnackBarBehavior.floating,
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              IconsClass.cartIcon,
                              height: 60.h,
                              width: 60.h,
                            ),
                            20.w.widthBox,
                            Expanded(
                                child: Text("Item Successfully Added to Cart",
                                    overflow: TextOverflow.fade,
                                    style: GetTextTheme.fs16_medium
                                        .copyWith(color: Colors.white)))
                          ],
                        ),
                        action: SnackBarAction(
                          label: "View Cart",
                          onPressed: () {
                            nextscreen(context, RoutesName.cart);
                          },
                          textColor: Colors.black,
                        ),
                      ));
                    },
                    child: Container(
                      height: 44.h,
                      decoration: kGradientBoxDecoration,
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                            decoration: kInnerDecoration,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                customIconWithGradient(
                                  Icons.shopping_cart_outlined,
                                ),
                                10.w.widthBox,
                                customtextWithGradentColor(
                                    "Add to cart", GetTextTheme.fs16_regular)
                              ],
                            )),
                      ),
                    ),
                  ),
                ),

                10.w.widthBox,
                // buy now button
                Expanded(
                    child: InkWell(
                  onTap: () => nextscreen(context, RoutesName.cart),
                  child: Container(
                    height: 44.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.sp),
                        gradient: titleWidgetGradient),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.shopping_bag_outlined,
                          color: Colors.white,
                          size: 22.sp,
                        ),
                        10.w.widthBox,
                        Text(
                          "Buy Now",
                          style: GetTextTheme.fs16_regular
                              .copyWith(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                )),
              ],
            ),
          ),
          20.h.heightBox,

          // similar products /////////
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: viewAllRow(
              "Similar Products",
              () => Get.to(() => ItemlistScreen(title: "T-Shirt")),
              icon: Icon(
                Icons.arrow_circle_right,
                color: AppColors.primaryColor,
              ),
            ),
          ),
          10.h.heightBox,
          GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            itemCount: 5,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: .7,
                crossAxisCount: 2,
                mainAxisSpacing: 5.h,
                crossAxisSpacing: 5.w),
            itemBuilder: (context, index) {
              List<ProductModels> items =
                  dummyitems.map((e) => ProductModels.fromJson(e)).toList();
              return ItemViewTiel(items: dummyitemList[index]);
            },
          ),
        ],
      ),
    );
  }

  customtitleText(title) => Text(
        title,
        style: GetTextTheme.fs14_regular,
      );

  final kInnerDecoration = BoxDecoration(
    color: Colors.white,
    border: Border.all(color: Colors.white),
    borderRadius: BorderRadius.circular(12.sp),
  );

  final kGradientBoxDecoration = BoxDecoration(
    gradient: titleWidgetGradient,
    color: Colors.white,
    borderRadius: BorderRadius.circular(12.sp),
  );
}
