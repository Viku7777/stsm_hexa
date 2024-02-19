// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cattel_feed/language/language.dart';
import 'package:cattel_feed/resource/component/showloading.dart';
import 'package:cattel_feed/resource/const/colors.dart';
import 'package:cattel_feed/resource/const/icon.dart';
import 'package:cattel_feed/resource/const/textstyle.dart';
import 'package:cattel_feed/main.dart';
import 'package:cattel_feed/model/product_model/product_model.dart';
import 'package:cattel_feed/resource/component/appbar_component.dart';
import 'package:cattel_feed/resource/component/custom_text.dart';
import 'package:cattel_feed/resource/component/favorites_item_tiel.dart';
import 'package:cattel_feed/resource/component/icon_with_gradinet.dart';
import 'package:cattel_feed/resource/component/rating_tile.dart';
import 'package:cattel_feed/resource/component/users_review_tiel.dart';
import 'package:cattel_feed/resource/component/viewallrow.dart';
import 'package:cattel_feed/resource/utils/utils.dart';
import 'package:cattel_feed/services/firebase_Analytics_services.dart';
import 'package:cattel_feed/view/auth/screens/loginwithNumber.dart';
import 'package:cattel_feed/view/cart_view/cart_view.dart';
import 'package:cattel_feed/view/homepage/item_List/item_list_screen.dart';
import 'package:cattel_feed/view/homepage/item_List/item_view_tile.dart';
import 'package:cattel_feed/view/homepage/item_details/showRatingtile.dart';
import 'package:cattel_feed/view_model/controller/app_data_controller.dart';
import 'package:cattel_feed/view_model/controller/cart_controller.dart';
import 'package:cattel_feed/view_model/controller/item_detail_view_controller.dart';
import 'package:cattel_feed/view_model/controller/logged_in_user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:velocity_x/velocity_x.dart';

class ItemDetailsView extends StatefulWidget {
  ProductModel product;
  ItemDetailsView({super.key, required this.product});

  @override
  State<ItemDetailsView> createState() => _ItemDetailsViewState();
}

class _ItemDetailsViewState extends State<ItemDetailsView> {
  var searchPincodeController = TextEditingController();
  String searchPinCode = "";

  // var cartcontroller = Get.put(CartController());

  var products = Get.find<AppData>();
  var loggedInUser = Get.find<LoggedInUserController>();

  EdgeInsetsGeometry contentPaddings = EdgeInsets.symmetric(horizontal: 10.w);

  final pgcontroller = PageController(viewportFraction: 1, keepPage: true);

  String storeAddress = "#001, city, state - 0011001";

  List<ProductModel> relatedProduct = [];

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    relatedProduct = products.products
        .where((element) =>
            element.categories!.id == widget.product.categories!.id &&
            element.categories!.parentId == widget.product.categories!.parentId)
        .toList();
    if (relatedProduct.isNotEmpty) {
      relatedProduct.removeWhere((element) => element.id == widget.product.id);
    }

    final pages = List.generate(
      widget.product.productImages!.length,
      (index) => CachedNetworkImage(
        imageUrl: widget.product.productImages![index],
        fit: BoxFit.contain,
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,

      // app bar
      appBar: customAppbar(widget.product.name),

      // ////////// body start //////////////////
      body: Stack(
        children: [
          ListView(
            children: [
              // main product images
              Stack(
                children: [
                  ////////////////// product image ////////////////
                  AspectRatio(
                    aspectRatio: 1,
                    child: PageView.builder(
                      controller: pgcontroller,
                      itemCount: pages.length,
                      itemBuilder: (_, index) {
                        return pages[index % pages.length];
                      },
                    ),
                  ),
                  widget.product.productImages!.length == 1
                      ? const SizedBox()
                      : Positioned(
                          bottom: 10.h,
                          left: screenSize.width * .4,
                          child: SmoothPageIndicator(
                              controller: pgcontroller, // PageController
                              count: widget.product.productImages!.length,
                              effect: ExpandingDotsEffect(
                                  dotHeight: 10,
                                  dotWidth: 10,
                                  radius: 20.sp,
                                  dotColor: Colors.grey,
                                  activeDotColor: Colors
                                      .grey.shade300), // your preferred effect
                              onDotClicked: (index) {})),
                  Positioned(
                      top: 25.h,
                      right: 25.w,
                      child: FavoriteItemTiel(
                          itemId: widget.product.id.toString())),
                  GetBuilder<ItemDetailsViewController>(
                    builder: (controller) {
                      if (controller.currentVarients.discount == "0") {
                        return const SizedBox();
                      } else {
                        return Positioned(
                            top: 10.h,
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(15),
                                      bottomRight: Radius.circular(15))),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 5.h),
                              alignment: Alignment.center,
                              child: Text(
                                  controller.currentVarients.discountType!
                                          .toLowerCase()
                                          .contains("amount")
                                      ? "Off ₹${controller.currentVarients.discount}/-"
                                      : "Off ${controller.currentVarients.discount}%",
                                  style: GetTextTheme.fs14_bold),
                            ));
                      }
                    },
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

                    10.h.heightBox,
                    /////////////// ///// ///  // product name ////////////////
                    customText(
                        widget.product.name.toString(), GetTextTheme.fs20_bold),
                    // product delivery type
                    customText(
                      LanguagesKey.freeDelivery.tr,
                      // product.deliveryCharge == 0
                      //     ? "Free Delivery"
                      //     : "Delivery Charge : ${product.deliveryCharge}",
                      GetTextTheme.fs14_regular
                          .copyWith(color: AppColors.greylightcolor),
                    ),

                    ///////////////// / /// price section ///////////////////
                    5.h.heightBox,

                    Row(
                      children: [
                        // old price
                        GetBuilder<ItemDetailsViewController>(
                          builder: (controller) {
                            return controller.currentVarients.discount == "0"
                                ? customText(
                                    "₹ ${controller.currentVarients.originalPrice.toString()}",
                                    GetTextTheme.fs26_bold.copyWith(
                                        color: AppColors.primaryColor),
                                  )
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      customText(
                                        "₹ ${controller.currentVarients.originalPrice.toString()}",
                                        GetTextTheme.fs18_medium.copyWith(
                                            decoration:
                                                TextDecoration.lineThrough,
                                            color: AppColors.greylightcolor),
                                      ),
                                      customText(
                                        "₹ ${Utils.findPrice(controller.currentVarients.originalPrice.toString(), controller.currentVarients.discount.toString(), controller.currentVarients.discountType.toString())}",
                                        GetTextTheme.fs26_bold.copyWith(
                                            color: AppColors.primaryColor),
                                      )
                                    ],
                                  );
                          },
                        ),
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
                    10.h.heightBox,
                    Text(
                      widget.product.shortDescription.toString(),
                      style: GetTextTheme.fs14_regular,
                    ),
                    ////////// // more similar item view /////////////

                    // 20.h.heightBox,
                    // customText(
                    //   "More Options",
                    //   GetTextTheme.fs14_regular,
                    // ),
                    // 10.h.heightBox,

                    // more item grid view
                    // SizedBox(
                    //   height: 100.h,
                    //   child: ListView.builder(
                    //       itemCount: 10,
                    //       shrinkWrap: true,
                    //       scrollDirection: Axis.horizontal,
                    //       itemBuilder: (context, index) =>
                    //           showNetworkImage(product.productImages!.first)),
                    // ),
                    // 20.h.heightBox,
                    /////////////////////////// Available size view /////////////

                    widget.product.isMultipleVariant as bool
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              10.h.heightBox,
                              Text(
                                LanguagesKey.availableSizes.tr,
                                style: GetTextTheme.fs16_medium,
                              ),
                              10.h.heightBox,
                              SizedBox(
                                  height: 30.h,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount:
                                          widget.product.varients!.length,
                                      itemBuilder: (context, index) {
                                        return GetBuilder<
                                                ItemDetailsViewController>(
                                            builder: (controller) {
                                          String title = controller
                                              .currentVarients.name
                                              .toString();
                                          //  String currentSize = productController
                                          //     .currentProduct.sizes[index].title;
                                          return InkWell(
                                            onTap: () {
                                              var controller = Get.find<
                                                  ItemDetailsViewController>();
                                              controller.updateVarient(widget
                                                  .product.varients![index]);
                                            },
                                            child: Container(
                                              width: 60.w,
                                              alignment: Alignment.center,
                                              margin:
                                                  EdgeInsets.only(right: 10.w),
                                              decoration: BoxDecoration(
                                                  color: widget.product
                                                          .varients![index].name
                                                          .toString()
                                                          .contains(title)
                                                      ? const Color(0xffFFAE00)
                                                      : AppColors.greythinColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30.sp)),
                                              child: Text(
                                                widget.product.varients![index]
                                                    .name
                                                    .toString(),
                                                style: GetTextTheme.fs16_regular
                                                    .copyWith(
                                                        color: widget
                                                                .product
                                                                .varients![
                                                                    index]
                                                                .name
                                                                .toString()
                                                                .contains(title)
                                                            ? Colors.white
                                                            : Colors.black),
                                              ),
                                            ),
                                          );
                                        });
                                      })),
                              20.h.heightBox,
                            ],
                          )
                        : SizedBox(
                            height: 10.h,
                          ),

                    //////////////// Product Discription ////////////////
                    Text(
                      LanguagesKey.productDetails.tr,
                      style: GetTextTheme.fs16_medium,
                    ),
                    10.h.heightBox,
                    customText(
                      widget.product.longDescription.toString(),
                      GetTextTheme.fs14_regular,
                    ),

                    10.h.heightBox,
                  ],
                ),
              ),
              // const Divider(
              //   color: Colors.grey,
              // ),

              /////////////////////// Seller Store ////////////////////////
              // Padding(
              //   padding: contentPaddings,
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       customtitleText("Seller Details"),
              //       10.h.heightBox,
              //       ListTile(
              //         shape: customroundedBorder(10),
              //         tileColor: AppColors.greythinColor,
              //         leading: CircleAvatar(
              //           backgroundColor: Colors.white,
              //           child: Image.asset(IconsClass.storeicon),
              //         ),
              //         // seller store name

              //         title: Text(
              //           "Store name not found",
              //           style: GetTextTheme.fs14_bold,
              //         ),
              //         // seller store address

              //         subtitle: Text(
              //           storeAddress,
              //           style: GetTextTheme.fs12_regular,
              //         ),
              //         trailing: IconButton(
              //             onPressed: () {},
              //             icon: const Icon(
              //               Icons.more_vert_outlined,
              //               color: Colors.black,
              //             )),
              //       ),
              //       10.h.heightBox,
              //       customtitleText("More from seller"),

              //       ///////////////// Similar  item from another seller  /////////////////
              //       SizedBox(
              //         height: 198.h,
              //         child: ListView.builder(
              //             itemCount: 10,
              //             scrollDirection: Axis.horizontal,
              //             itemBuilder: (context, index) {
              //               var controller = Get.find<AppData>();
              //               return SizedBox(
              //                 width: 120.w,
              //                 child: ItemViewTiel(
              //                     product: controller.products[1], showMore: true),
              //               );
              //             }),
              //       ),
              //     ],
              //   ),
              // ),

              // 5.h.heightBox,
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
              // Padding(
              //     padding: contentPaddings,
              //     child: viewAllRow(
              //       "${availableReview.length - 3} More Reviews",
              //       () => nextscreen(context, ShowAllRatingsView.routes),
              //       textcolor: 0xff54B435,
              //       icon: Icon(
              //         Icons.arrow_circle_right,
              //         color: AppColors.primaryColor,
              //       ),
              //     )),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    10.h.heightBox,
                    Text(
                      LanguagesKey.checkDelivery.tr,
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
                                  products.searcPinCode(
                                      searchPincodeController.text);
                                },
                                child: Text(
                                  "Check",
                                  style: GetTextTheme.fs14_regular
                                      .copyWith(color: AppColors.primaryColor),
                                )),
                            contentPadding:
                                EdgeInsets.only(left: 10.w, top: 10.h),
                            border: InputBorder.none,
                            hintText: 'Enter pin code',
                            hintStyle: GetTextTheme.fs12_regular.copyWith(
                                fontSize: 15.sp,
                                color: const Color(0xff5B5B5B))),
                      ),
                    ),
                    GetBuilder<AppData>(
                      builder: (controller) {
                        if (controller.searchPinCode.isEmpty) {
                          return customText(
                            LanguagesKey.checkDeliveryContent.tr,
                            GetTextTheme.fs12_regular
                                .copyWith(color: Colors.grey),
                          );
                        } else if (controller.servicesArea.any((element) =>
                            element.postalCode ==
                            searchPincodeController.text)) {
                          return customText(
                            "Expected Delivery in ${(controller.servicesArea.firstWhere((element) => element.postalCode!.contains(controller.searchPinCode))).expectedDelivery}",
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
                      },
                    )
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
                      onTap: () async {
                        if (loggedInUser.isGuestUser) {
                          Get.offAll(() => const LoginWithNumber());
                        } else {
                          FirebaseAnalyticsServices()
                              .customEvent("add_to_cart_product", {
                            "item": widget.product.id,
                            "item_name": widget.product.name,
                          });
                          addToCartService(context, widget.product);
                        }
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
                                      LanguagesKey.addToCart.tr,
                                      GetTextTheme.fs16_regular)
                                ],
                              )),
                        ),
                      ),
                    )),

                    10.w.widthBox,
                    // buy now button
                    Expanded(
                        child: InkWell(
                      onTap: () async {
                        if (loggedInUser.isGuestUser) {
                          Get.offAll(() => const LoginWithNumber());
                        } else {
                          FirebaseAnalyticsServices()
                              .customEvent("buy_now_product", {
                            "item": widget.product.id,
                            "item_name": widget.product.name,
                          });
                          addToCartService(context, widget.product);
                          Get.to(() => const CartView());
                        }
                      },
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
                              LanguagesKey.buyNow.tr,
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
              if (relatedProduct.isNotEmpty)
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: viewAllRow(
                        LanguagesKey.similarProducts.tr,
                        () {
                          Get.to(() => ItemlistScreen(
                                title: LanguagesKey.similarProducts.tr,
                                products: relatedProduct,
                              ));
                        },
                        icon: Icon(
                          Icons.arrow_circle_right,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                    10.h.heightBox,
                    GridView.builder(
                      padding: EdgeInsets.symmetric(
                        horizontal: 5.w,
                      ).copyWith(bottom: 10.h),
                      itemCount:
                          relatedProduct.length > 5 ? 5 : relatedProduct.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: .7,
                          crossAxisCount: 2,
                          mainAxisSpacing: 5.h,
                          crossAxisSpacing: 5.w),
                      itemBuilder: (context, index) {
                        return ItemViewTiel(
                          product: relatedProduct[index],
                        );
                      },
                    ),
                  ],
                ),
            ],
          ),
          loading ? const ShowLoading() : const SizedBox()
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
