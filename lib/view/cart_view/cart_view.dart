// ignore_for_file: use_build_context_synchronously

import 'package:cattel_feed/language/language.dart';
import 'package:cattel_feed/model/order_model/order_model.dart';
import 'package:cattel_feed/view_model/controller/logged_in_user_controller.dart';
import 'package:cattel_feed/view_model/controller/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:cattel_feed/resource/component/custom_text.dart';
import 'package:cattel_feed/resource/const/textstyle.dart';
import 'package:cattel_feed/resource/utils/utils.dart';
import 'package:cattel_feed/view/cart_view/empty_cart.dart';
import 'package:cattel_feed/view_model/controller/address_controller.dart';
import 'package:cattel_feed/view_model/controller/cart_controller.dart';
import '../../model/address_model/addressModel.dart';
import '../../resource/component/icon_with_gradinet.dart';
import '../../resource/const/colors.dart';
import '../../resource/const/nextscreen.dart';
import '../address/all_address/all_address.dart';
import 'cart_item_tile.dart';

class CartView extends StatefulWidget {
  static const String route = "/cart";
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  var provider = Get.find<NewCartController>();

  // ignore: override_on_non_overriding_member
  String paymentMode = "cod"; //no radio button will be selected on initial
  // var controller = Get.put(CartController());
  // var addresscontroller = Get.put(AddressController());

  @override
  void initState() {
    super.initState();
  }

  // initialize() {
  //   final cartController = Get.find<CartController>();
  //   cartController.cartItems.isEmpty
  //       ? cartController.getCartItems(context)
  //       : null;
  // }

  @override
  Widget build(BuildContext context) {
    AddressModel? address;
    return GetBuilder<NewCartController>(builder: (controller) {
      final items = provider.cartItems;
      int totalprice = 0;
      int totalDiscount = 0;
      int finalPrice = 0;
      if (items.isNotEmpty) {
        provider.cartItems.map((e) {
          totalprice +=
              e.quantity! * Utils.convertStringIntoInt(e.varientPrice!);
          totalDiscount +=
              e.quantity! * Utils.convertStringIntoInt(e.varientDiscount!);

          finalPrice += e.quantity! * Utils.convertStringIntoInt(e.finalPrice!);
        }).toList();
      }

      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: customText(LanguagesKey.cart.tr, GetTextTheme.fs16_regular),
        ),
        body: items.isEmpty
            ? const EmptyCartView()
            : ListView(
                children: [
                  5.h.heightBox,
                  ListView.separated(
                    separatorBuilder: (context, index) => 3.h.heightBox,
                    shrinkWrap: true,
                    itemCount: items.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) =>
                        showCartItem(context, items[index], index),
                  ),
                  10.h.heightBox,
                  GetBuilder<UserAddressController>(builder: (controller) {
                    if (controller.addresses.isEmpty) {
                      return Container(
                        color: Colors.white,
                        height: 90.h,
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    customIconWithGradient(
                                        Icons.location_on_outlined),
                                    10.w.widthBox,
                                    customText(LanguagesKey.deliveryAddress.tr,
                                        GetTextTheme.fs12_bold),
                                  ],
                                ),
                                InkWell(
                                  onTap: () {
                                    nextscreen(context, AllAddressView.routes);
                                  },
                                  child: customtextWithGradentColor(
                                      LanguagesKey.add.tr,
                                      GetTextTheme.fs16_regular),
                                )
                              ],
                            ),
                            Expanded(
                              child: Center(
                                child: customText(
                                    LanguagesKey.addnewAddressTitle.tr,
                                    GetTextTheme.fs14_medium),
                              ),
                            )
                          ],
                        ),
                      );
                    } else {
                      address = controller.addresses[controller.selectIndex];
                      return Container(
                        color: Colors.white,
                        height: 90.h,
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    customIconWithGradient(
                                        Icons.location_on_outlined),
                                    10.w.widthBox,
                                    customText("Delivery Address",
                                        GetTextTheme.fs12_bold),
                                  ],
                                ),
                                InkWell(
                                  onTap: () {
                                    nextscreen(context, AllAddressView.routes);
                                  },
                                  child: customtextWithGradentColor(
                                      "Change", GetTextTheme.fs16_regular),
                                )
                              ],
                            ),
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                text: "${address!.addresstitle} : ",
                                style: GetTextTheme.fs14_bold,
                              ),
                              TextSpan(
                                text: address!.number,
                                style: GetTextTheme.fs14_regular,
                              ),
                            ])),
                            customText(
                                "${address!.houseno} ${address!.colony}, ${address!.landmark}, ${address!.city}, ${address!.state} ",
                                GetTextTheme.fs12_regular)
                          ],
                        ),
                      );
                    }
                  }),
                  10.h.heightBox,
                  Container(
                    color: Colors.white,
                    height: 90.h,
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        customText(LanguagesKey.paymentMode.tr,
                            GetTextTheme.fs12_bold),
                        Row(
                          children: [
                            Expanded(
                                child: Container(
                              color: AppColors.greythinColor,
                              child: RadioListTile(
                                activeColor: AppColors.primaryColor,
                                title: Text(
                                  LanguagesKey.online.tr,
                                  style: GetTextTheme.fs14_regular,
                                ),
                                value: "online",
                                groupValue: paymentMode,
                                onChanged: (value) {
                                  Utils.flushBarErrorMessage(
                                      "Currently we are accepting only COD",
                                      context);
                                  // setState(() {
                                  //   paymentMode = value.toString();
                                  // });
                                },
                              ),
                            )),
                            5.w.widthBox,
                            Expanded(
                                child: Container(
                              color: AppColors.greythinColor,
                              child: RadioListTile(
                                activeColor: AppColors.primaryColor,
                                title: Text(
                                  LanguagesKey.cod.tr,
                                  style: GetTextTheme.fs14_regular,
                                ),
                                value: "cod",
                                groupValue: paymentMode,
                                onChanged: (value) {
                                  setState(() {
                                    paymentMode = value.toString();
                                  });
                                },
                              ),
                            )),
                          ],
                        )
                      ],
                    ),
                  ),
                  10.h.heightBox,
                  Container(
                    color: Colors.white,
                    height: 200.h,
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customText(
                            "${LanguagesKey.productDetails.tr} (${provider.cartItems.length} ${LanguagesKey.items.tr})",
                            GetTextTheme.fs14_regular),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customText(LanguagesKey.productPriceTotal.tr,
                                GetTextTheme.fs14_regular),
                            customText(
                                "$totalprice.00", GetTextTheme.fs14_regular)
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customText(LanguagesKey.deliveryCharge.tr,
                                GetTextTheme.fs14_regular),
                            customText("+ 0.00", GetTextTheme.fs14_regular)
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customText(LanguagesKey.serviceCharge.tr,
                                GetTextTheme.fs14_regular),
                            customText("+ 0.00", GetTextTheme.fs14_regular)
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customText(LanguagesKey.totalDiscount.tr,
                                GetTextTheme.fs14_regular),
                            customText("- $totalDiscount.00",
                                GetTextTheme.fs14_regular)
                          ],
                        ),
                        const Divider(
                          color: Colors.grey,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customText(LanguagesKey.orderTotal.tr,
                                GetTextTheme.fs14_bold),
                            customText(
                                "$finalPrice.00", GetTextTheme.fs14_bold),
                          ],
                        ),
                      ],
                    ),
                  ),
                  60.h.heightBox,
                  // 60.h.heightBox,
                ],
              ),
        floatingActionButton: items.isEmpty
            ? const SizedBox()
            : InkWell(
                onTap: () async {
                  if (address == null) {
                    Utils.flushBarErrorMessage(
                        "Please Select an Address to proceed", context);
                  } else {
                    /// Get the Current login User Data
                    var currentuser = Get.find<LoggedInUserController>();
                    var controller = Get.find<OrderController>();
                    var user = currentuser.user;

                    /// Get the id of the user
                    String uid = currentuser.userModel!.uid.toString();
                    final order = OrderModel(
                        createdAt: DateTime.now().toIso8601String(),
                        orderPrice: finalPrice,
                        uid: uid,
                        shippingCharge: 0,
                        serviceCharge: 0,
                        promoDiscount: 0,
                        transaction: Transaction(
                            status: paymentMode.toString(),
                            txId: controller.generateRandomId(),
                            date: DateTime.now().toIso8601String(),
                            mode: paymentMode),
                        customer: Customer(
                            name: user.name,
                            phone: user.phone,
                            email: user.email,
                            image: user.image),
                        items: provider.cartItems,
                        shipping: Shipping(
                            address:
                                "${address!.houseno} ${address!.colony}, ${address!.landmark}, ${address!.city}, ${address!.state} ",
                            lat: address!.lat,
                            long: address!.lng,
                            addressTitle: address!.addresstitle,
                            contactPerson: address!.name,
                            contactNo: address!.number),
                        orderStatus: OrderStatus.NEW);

                    await controller.addOrder(context, order);
                    provider.cleanCart();
                  }
                },
                child: Container(
                  height: 44.h,
                  margin: EdgeInsets.only(left: .082.sw),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: titleWidgetGradient),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.arrow_circle_right_rounded,
                        color: Colors.white,
                      ),
                      10.w.widthBox,
                      customText(
                          "Checkout",
                          GetTextTheme.fs16_regular
                              .copyWith(color: Colors.white))
                    ],
                  ),
                ),
              ),
      );
    });
  }
}
