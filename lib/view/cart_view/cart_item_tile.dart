// import 'package:cattel_feed/resource/const/colors.dart';
// import 'package:cattel_feed/resource/const/textstyle.dart';
// import 'package:cattel_feed/main.dart';
// import 'package:cattel_feed/model/cart_model/cart_product_model.dart';
// import 'package:cattel_feed/resource/component/custom_text.dart';
// import 'package:cattel_feed/view_model/controller/cart_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:velocity_x/velocity_x.dart';

// import '../../resource/component/showPrice.dart';
// import '../homepage/item_details/show_more_option_tile.dart';

// Widget showCartItem(BuildContext context, Items cartitem, int i) =>
//     GetBuilder<CartController>(builder: (controller) {
//       return Container(
//         height: 120.h,
//         width: screenSize.width,
//         color: Colors.white,
//         padding: EdgeInsets.symmetric(
//           horizontal: 10.w,
//         ),
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 showNetworkImage(cartitem.image ?? '', height: 70, width: 70),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       customText(
//                           cartitem.title.toString(), GetTextTheme.fs14_bold,
//                           maxline: 2),
//                       2.h.heightBox,
//                       customshowPrice(
//                           (cartitem.price ?? 0).toString(),
//                           cartitem.discount == null || cartitem.discount == 0
//                               ? ""
//                               : "${(cartitem.price ?? 0) - (cartitem.discount ?? 0)}"),
//                       2.h.heightBox,
//                       Row(
//                         children: [
//                           customText("Size : XL", GetTextTheme.fs10_regular),
//                           10.w.widthBox,
//                           customText("Color : Blue", GetTextTheme.fs10_regular)
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//                 // const Spacer(),
//                 Column(
//                   mainAxisSize: MainAxisSize.min,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     IconButton(
//                         splashRadius: 20,
//                         onPressed: () {
//                           controller.removeCartItem(context, cartitem, i);
//                         },
//                         icon: const Icon(
//                           Icons.delete_outline_sharp,
//                           color: Colors.black,
//                         )),
//                     Row(
//                       children: [
//                         IconButton(
//                             onPressed: () {
//                               controller.decreaseItemQuantity(i);
//                             },
//                             icon: const Icon(
//                               Icons.remove_circle_outline_outlined,
//                               color: Colors.black,
//                             )),
//                         customText("${cartitem.qnty}", GetTextTheme.fs16_bold),
//                         IconButton(
//                             onPressed: () {
//                               controller.increaseItemQuantity(i);
//                             },
//                             icon: const Icon(
//                               Icons.add_circle_outline_rounded,
//                               color: Colors.black,
//                             )),
//                       ],
//                     )
//                   ],
//                 )
//               ],
//             ),
//             Container(
//               height: 25.h,
//               color: AppColors.greythinColor,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   customText("Sold by : xyz store", GetTextTheme.fs12_regular),
//                   customText("Free delivery", GetTextTheme.fs12_regular)
//                 ],
//               ),
//             )
//           ],
//         ),
//       );
//     });
