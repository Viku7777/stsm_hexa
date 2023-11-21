import 'package:cattel_feed/Helper/colors.dart';
import 'package:cattel_feed/Helper/textstyle.dart';
import 'package:cattel_feed/controller/cart_controller.dart/cart_controller.dart';
import 'package:cattel_feed/global/global.dart';
import 'package:cattel_feed/main.dart';
import 'package:cattel_feed/model/cart_model.dart';
import 'package:cattel_feed/model/productsModel.dart';
import 'package:cattel_feed/view/component/custom_text.dart';
import 'package:cattel_feed/view/component/showPrice.dart';
import 'package:cattel_feed/view/screens/homepage/item_details/show_more_option_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

Widget showCartItem(CartModel cartitem) =>
    GetBuilder<CartController>(builder: (controller) {
      ProductItemModel items = FirebaseData.products!
          .firstWhere((element) => element.id == cartitem.itemID);

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
                showNetworkImage(items.image.first, height: 70, width: 70),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customText(items.title, GetTextTheme.fs14_bold),
                    2.h.heightBox,
                    customshowPrice(items.price,
                        "${int.parse(items.price) - int.parse(items.discountValue)}"),
                    2.h.heightBox,
                    Row(
                      children: [
                        customText("Size : XL", GetTextTheme.fs10_regular),
                        10.w.widthBox,
                        customText("Color : Blue", GetTextTheme.fs10_regular)
                      ],
                    )
                  ],
                ),
                const Spacer(),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                        splashRadius: 20,
                        onPressed: () {
                          controller.deleteItem(cartitem.itemID);
                        },
                        icon: const Icon(
                          Icons.delete_outline_sharp,
                          color: Colors.black,
                        )),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              controller.decreaseQuantity(cartitem.itemID);
                            },
                            icon: const Icon(
                              Icons.remove_circle_outline_outlined,
                              color: Colors.black,
                            )),
                        customText(
                            "${cartitem.quantity}", GetTextTheme.fs16_bold),
                        IconButton(
                            onPressed: () {
                              controller.addItemInCart(cartitem.itemID);
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
                  customText("Sold by : xyz store", GetTextTheme.fs12_regular),
                  customText("Free delivery", GetTextTheme.fs12_regular)
                ],
              ),
            )
          ],
        ),
      );
    });
