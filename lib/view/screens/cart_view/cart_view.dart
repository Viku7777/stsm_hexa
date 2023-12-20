import 'package:cattel_feed/Helper/colors.dart';
import 'package:cattel_feed/Helper/nextscreen.dart';
import 'package:cattel_feed/Helper/showdialog.dart';
import 'package:cattel_feed/Helper/textstyle.dart';
import 'package:cattel_feed/model/cart_model.dart';
import 'package:cattel_feed/resource/component/custom_text.dart';
import 'package:cattel_feed/view/screens/bottomNav/bottom_Nav.dart';
import 'package:cattel_feed/view/screens/cart_view/cart_item_tile.dart';
import 'package:cattel_feed/view/screens/cart_view/empty_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class CartView extends StatefulWidget {
  static const String route = "/cart";
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  // ignore: override_on_non_overriding_member
  String paymentMode = "online"; //no radio button will be selected on initial
  // var controller = Get.put(CartController());
  // var addresscontroller = Get.put(AddressController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: customText("Cart", GetTextTheme.fs16_regular),
      ),
      // body: GetBuilder<CartController>(builder: (controller) {
      //   return controller.cartItems.isEmpty
      //       ? const EmptyCartView()
      //       : ListView(
      //           children: [
      //             5.h.heightBox,
      //             GetBuilder<CartController>(builder: (controller) {
      //               List<CartModel> cartItems = controller.cartItems;

      //               return ListView.separated(
      //                 separatorBuilder: (context, index) => 3.h.heightBox,
      //                 shrinkWrap: true,
      //                 itemCount: cartItems.length,
      //                 physics: const NeverScrollableScrollPhysics(),
      //                 itemBuilder: (context, index) =>
      //                     showCartItem(cartItems[index]),
      //               );
      //             }),
      //             10.h.heightBox,

      //             // GetBuilder<AddressController>(builder: (controller) {
      //             //   if (controller.userAllAddresses.isEmpty) {
      //             //     return Container(
      //             //       color: Colors.white,
      //             //       height: 90.h,
      //             //       padding: EdgeInsets.symmetric(horizontal: 15.w),
      //             //       child: Column(
      //             //         children: [
      //             //           Row(
      //             //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             //             children: [
      //             //               Row(
      //             //                 children: [
      //             //                   customIconWithGradient(
      //             //                       Icons.location_on_outlined),
      //             //                   10.w.widthBox,
      //             //                   customText("Delivery Address",
      //             //                       GetTextTheme.fs12_bold),
      //             //                 ],
      //             //               ),
      //             //               InkWell(
      //             //                 onTap: () {
      //             //                   nextscreen(context, AllAddressView.routes);
      //             //                 },
      //             //                 child: customtextWithGradentColor(
      //             //                     "Add", GetTextTheme.fs16_regular),
      //             //               )
      //             //             ],
      //             //           ),
      //             //           Expanded(
      //             //             child: Center(
      //             //               child: customText("Add New Address",
      //             //                   GetTextTheme.fs14_medium),
      //             //             ),
      //             //           )
      //             //         ],
      //             //       ),
      //             //     );
      //             //   } else {
      //             //     AddressModel address =
      //             //         controller.userAllAddresses[controller.selectIndex];
      //             //     return Container(
      //             //       color: Colors.white,
      //             //       height: 90.h,
      //             //       padding: EdgeInsets.symmetric(horizontal: 15.w),
      //             //       child: Column(
      //             //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //             //         crossAxisAlignment: CrossAxisAlignment.start,
      //             //         children: [
      //             //           Row(
      //             //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             //             children: [
      //             //               Row(
      //             //                 children: [
      //             //                   customIconWithGradient(
      //             //                       Icons.location_on_outlined),
      //             //                   10.w.widthBox,
      //             //                   customText("Delivery Address",
      //             //                       GetTextTheme.fs12_bold),
      //             //                 ],
      //             //               ),
      //             //               InkWell(
      //             //                 onTap: () {
      //             //                   nextscreen(context, AllAddressView.routes);
      //             //                 },
      //             //                 child: customtextWithGradentColor(
      //             //                     "Change", GetTextTheme.fs16_regular),
      //             //               )
      //             //             ],
      //             //           ),
      //             //           RichText(
      //             //               text: TextSpan(children: [
      //             //             TextSpan(
      //             //               text: "${address.addresstitle} : ",
      //             //               style: GetTextTheme.fs14_bold,
      //             //             ),
      //             //             TextSpan(
      //             //               text: address.number,
      //             //               style: GetTextTheme.fs14_regular,
      //             //             ),
      //             //           ])),
      //             //           customText(
      //             //               "${address.houseno} ${address.colony}, ${address.landmark}, ${address.city}, ${address.state} ",
      //             //               GetTextTheme.fs12_regular)
      //             //         ],
      //             //       ),
      //             //     );
      //             //   }
      //             // }),

      //             10.h.heightBox,
      //             Container(
      //               color: Colors.white,
      //               height: 90.h,
      //               padding: EdgeInsets.symmetric(horizontal: 15.w),
      //               child: Column(
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                 children: [
      //                   customText("Payment Mode", GetTextTheme.fs12_bold),
      //                   Row(
      //                     children: [
      //                       Expanded(
      //                           child: Container(
      //                         color: AppColors.greythinColor,
      //                         child: RadioListTile(
      //                           activeColor: AppColors.primaryColor,
      //                           title: Text(
      //                             "Online",
      //                             style: GetTextTheme.fs14_regular,
      //                           ),
      //                           value: "online",
      //                           groupValue: paymentMode,
      //                           onChanged: (value) {
      //                             setState(() {
      //                               paymentMode = value.toString();
      //                             });
      //                           },
      //                         ),
      //                       )),
      //                       5.w.widthBox,
      //                       Expanded(
      //                           child: Container(
      //                         color: AppColors.greythinColor,
      //                         child: RadioListTile(
      //                           activeColor: AppColors.primaryColor,
      //                           title: Text(
      //                             "Cash on delivery",
      //                             style: GetTextTheme.fs14_regular,
      //                           ),
      //                           value: "cod",
      //                           groupValue: paymentMode,
      //                           onChanged: (value) {
      //                             setState(() {
      //                               paymentMode = value.toString();
      //                             });
      //                           },
      //                         ),
      //                       )),
      //                     ],
      //                   )
      //                 ],
      //               ),
      //             ),
      //             10.h.heightBox,
      //             Container(
      //               color: Colors.white,
      //               height: 200.h,
      //               padding: EdgeInsets.symmetric(horizontal: 15.w),
      //               child: Column(
      //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: [
      //                   customText("Price Details (2 items)",
      //                       GetTextTheme.fs14_regular),
      //                   Row(
      //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                     children: [
      //                       customText("Product Price Total",
      //                           GetTextTheme.fs14_regular),
      //                       customText("500.00", GetTextTheme.fs14_regular)
      //                     ],
      //                   ),
      //                   Row(
      //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                     children: [
      //                       customText(
      //                           "Delivery Charge", GetTextTheme.fs14_regular),
      //                       customText("+ 0.00", GetTextTheme.fs14_regular)
      //                     ],
      //                   ),
      //                   Row(
      //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                     children: [
      //                       customText(
      //                           "Service Charge", GetTextTheme.fs14_regular),
      //                       customText("+ 0.00", GetTextTheme.fs14_regular)
      //                     ],
      //                   ),
      //                   Row(
      //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                     children: [
      //                       customText(
      //                           "Total Discount", GetTextTheme.fs14_regular),
      //                       customText("- 0.00", GetTextTheme.fs14_regular)
      //                     ],
      //                   ),
      //                   const Divider(
      //                     color: Colors.grey,
      //                   ),
      //                   Row(
      //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                     children: [
      //                       customText("Order Total", GetTextTheme.fs14_bold),
      //                       customText("500.00", GetTextTheme.fs14_bold),
      //                     ],
      //                   ),
      //                 ],
      //               ),
      //             ),
      //             60.h.heightBox,
      //             InkWell(
      //               onTap: () => showDialog(
      //                 context: context,
      //                 builder: (context) => showSuccessDialog(
      //                     "Thanks for your order",
      //                     "Your payment was complete, and your order placed successfully. We will notify you when the order is dispatched or delivered.",
      //                     [
      //                       ElevatedButton.icon(
      //                           style: ElevatedButton.styleFrom(
      //                               minimumSize: Size.fromHeight(35.h),
      //                               backgroundColor: AppColors.greythinColor),
      //                           onPressed: () {},
      //                           icon: const Icon(
      //                             Icons.download,
      //                             color: Colors.black,
      //                           ),
      //                           label: Text("Download Receipt",
      //                               style: GetTextTheme.fs16_regular)),
      //                       5.h.heightBox,
      //                       ElevatedButton.icon(
      //                           style: ElevatedButton.styleFrom(
      //                               minimumSize: Size.fromHeight(35.h),
      //                               backgroundColor: AppColors.greenColor),
      //                           onPressed: () {
      //                             nextscreenRemove(
      //                                 context, BottomNavView.routes);
      //                           },
      //                           icon: const Icon(
      //                             Icons.shopping_bag_outlined,
      //                             color: Colors.white,
      //                           ),
      //                           label: Text("Continue Shopping",
      //                               style: GetTextTheme.fs16_regular
      //                                   .copyWith(color: Colors.white))),
      //                     ]),
      //               ),
      //               child: Container(
      //                 height: 44.h,
      //                 margin: EdgeInsets.symmetric(horizontal: 25.w),
      //                 decoration: BoxDecoration(
      //                     borderRadius: BorderRadius.circular(12),
      //                     gradient: titleWidgetGradient),
      //                 child: Row(
      //                   mainAxisAlignment: MainAxisAlignment.center,
      //                   children: [
      //                     const Icon(
      //                       Icons.arrow_circle_right_rounded,
      //                       color: Colors.white,
      //                     ),
      //                     10.w.widthBox,
      //                     customText(
      //                         "Checkout",
      //                         GetTextTheme.fs16_regular
      //                             .copyWith(color: Colors.white))
      //                   ],
      //                 ),
      //               ),
      //             ),
      //             60.h.heightBox,
      //           ],
      //         );
      // }),
    );
  }
}
