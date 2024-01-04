import 'package:cattel_feed/resource/component/showPrice.dart';
import 'package:cattel_feed/resource/const/colors.dart';
import 'package:cattel_feed/resource/const/textstyle.dart';
import 'package:cattel_feed/main.dart';
import 'package:cattel_feed/resource/component/custom_text.dart';
import 'package:cattel_feed/view_model/controller/cart_controller.dart';
import 'package:cattel_feed/view_model/controller/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../homepage/item_details/show_more_option_tile.dart';

Widget showCartItem(
  BuildContext context,
  CartItems cartitem,
  int i,
) =>
    GetBuilder<NewCartController>(builder: (controller) {
      return Container(
        height: 120.h,
        width: screenSize.width,
        color: Colors.white,
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
        ),
        child: Column(
          children: [
            Row(
              children: [
                showNetworkImage(cartitem.image ?? '', height: 70, width: 70),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customText(
                          cartitem.title.toString(), GetTextTheme.fs14_bold,
                          maxline: 2),
                      2.h.heightBox,
                      controller.cartItems[i].varientPrice ==
                              controller.cartItems[i].finalPrice
                          ? customText(
                              "₹ ${controller.cartItems[i].finalPrice.toString()}",
                              GetTextTheme.fs18_bold
                                  .copyWith(color: AppColors.primaryColor),
                            )
                          : customshowPrice(
                              controller.cartItems[i].varientPrice.toString(),
                              controller.cartItems[i].finalPrice.toString()),
                      2.h.heightBox,
                      Row(
                        children: [
                          controller.cartItems[i].varientName == null
                              ? const SizedBox()
                              : customText(
                                  "Varient : ${controller.cartItems[i].varientName}",
                                  GetTextTheme.fs10_regular),
                          // 10.w.widthBox,
                          // customText("Color : Blue", GetTextTheme.fs10_regular)
                        ],
                      )
                    ],
                  ),
                ),
                // const Spacer(),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                        splashRadius: 20,
                        onPressed: () {
                          controller.deleteProduct(i);
                        },
                        icon: const Icon(
                          Icons.delete_outline_sharp,
                          color: Colors.black,
                        )),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              controller.removeProduct(i);
                            },
                            icon: const Icon(
                              Icons.remove_circle_outline_outlined,
                              color: Colors.black,
                            )),
                        customText("${controller.cartItems[i].quantity}",
                            GetTextTheme.fs16_bold),
                        IconButton(
                            onPressed: () {
                              controller.addQuantity(i);
                            },
                            icon: const Icon(
                              Icons.add_circle_outline_rounded,
                              color: Colors.black,
                            )),
                      ],
                    )
                  ],
                )
              ],
            ),
            Container(
              height: 25.h,
              color: AppColors.greythinColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  customText("Sold by : STSM", GetTextTheme.fs12_regular),
                  customText("Free delivery", GetTextTheme.fs12_regular)
                ],
              ),
            )
          ],
        ),
      );
    });
