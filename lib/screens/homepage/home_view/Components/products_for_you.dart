import 'package:cattel_feed/resource/const/base_getters.dart';
import 'package:cattel_feed/resource/const/colors.dart';
import 'package:cattel_feed/resource/const/textstyle.dart';
import 'package:cattel_feed/model/all_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductsForYouView extends StatelessWidget {
  const ProductsForYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: productModelss.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: .55.sp,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: AppColors.greyColor.withOpacity(0.2))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  width: 190.w,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(10.r)),
                  ),
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(10.r)),
                    child: Image.network(
                      productModelss[index].image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppServices.addHeight(10),
                    Text(
                      productModelss[index].productName,
                      style: GetTextTheme.fs12_regular,
                    ),
                    Text(
                      "Free Delivery",
                      style: GetTextTheme.fs10_regular
                          .copyWith(color: AppColors.greyColor),
                    ),
                    AppServices.addHeight(5),
                    Row(
                      children: [
                        Text(
                          "\u20b9 350  ",
                          style: GetTextTheme.fs16_bold.copyWith(
                              decoration: TextDecoration.lineThrough,
                              color: AppColors.greyColor),
                        ),
                        Text(
                          "\u20b9 350",
                          style: GetTextTheme.fs16_bold
                              .copyWith(color: AppColors.primaryColor),
                        ),
                      ],
                    ),
                    AppServices.addHeight(5),
                    RatingBar(
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 15,
                      maxRating: 5,
                      ratingWidget: RatingWidget(
                          full: const Icon(Icons.star, color: Colors.amber),
                          half:
                              const Icon(Icons.star_half, color: Colors.amber),
                          empty: const Icon(Icons.star_border,
                              color: Colors.amber)),
                      onRatingUpdate: (value) {},
                    ),
                    10.h.heightBox,
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
