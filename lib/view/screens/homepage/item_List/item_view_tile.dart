// ignore_for_file: must_be_immutable

import 'dart:math';

import 'package:cattel_feed/Helper/colors.dart';
import 'package:cattel_feed/Helper/textstyle.dart';
import 'package:cattel_feed/model/product_model/product_model.dart';
import 'package:cattel_feed/resource/component/favorites_item_tiel.dart';
import 'package:cattel_feed/resource/utils/utils.dart';
import 'package:cattel_feed/view/screens/homepage/item_details/item_details.dart';
import 'package:cattel_feed/view_model/controller/item_detail_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class ItemViewTiel extends StatelessWidget {
  bool showMore;
  ProductModel product;
  ItemViewTiel({super.key, this.showMore = false, required this.product});

  @override
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        var controller = Get.find<ItemDetailsViewController>();
        controller.updateVarient(product.varients!.first);
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ItemDetailsView(product: product),
        ));
      },
      child: Card(
        shadowColor: AppColors.greyColor,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.sp)),
        elevation: 2,
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.sp),
                        topRight: Radius.circular(10.sp)),
                    child: Image.network(
                      product.productImages!.first,
                      fit: BoxFit.contain,
                      height: Get.height,
                      width: Get.width,
                    ),
                  ),
                  Positioned(
                      top: 5.h,
                      right: 5.w,
                      child: FavoriteItemTiel(itemId: product.id.toString()))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    product.name.toString(),
                    style: GetTextTheme.fs14_regular,
                  ),
                  Text(
                    "Free Delivery",
                    style: GetTextTheme.fs10_regular
                        .copyWith(color: const Color(0xffB5B5B5)),
                  ),
                  Text(
                    "₹ ${product.varients!.first.originalPrice.toString()}",
                    style: GetTextTheme.fs18_medium.copyWith(
                      decoration: TextDecoration.lineThrough,
                      color: const Color(0xffB5B5B5),
                      fontSize: showMore ? 10.sp : 13.sp,
                    ),
                  ),
                  10.w.widthBox,
                  Text(
                    "₹ ${Utils.findPrice(product.varients!.first.originalPrice.toString(), product.varients!.first.discount.toString(), product.varients!.first.discountType.toString())}",
                    style: GetTextTheme.fs18_bold.copyWith(
                        color: AppColors.primaryColor,
                        fontSize: showMore ? 13.sp : 16.sp),
                  ),
                  Row(
                    children: [
                      RatingBar.builder(
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: showMore ? 8.sp : 11.sp,
                        itemPadding: EdgeInsets.symmetric(horizontal: 1.w),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          log(rating);
                        },
                      ),
                      5.w.widthBox,
                      Text(
                        "4.2 / 5.0",
                        style: GetTextTheme.fs10_regular,
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
