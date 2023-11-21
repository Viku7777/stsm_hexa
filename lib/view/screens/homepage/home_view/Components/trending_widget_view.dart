import 'package:cattel_feed/Helper/base_getters.dart';
import 'package:cattel_feed/Helper/colors.dart';
import 'package:cattel_feed/Helper/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:cattel_feed/model/all_data.dart';
import 'package:velocity_x/velocity_x.dart';

class TrendingWidgetView extends StatelessWidget {
  const TrendingWidgetView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      shrinkWrap: true,
      itemCount: trendingStore.length,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.55.sp,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: AppColors.greyColor.withOpacity(0.3))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(1.1),
                height: 190.h,
                width: Get.width * 0.45,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(8.r)),
                    gradient: AppColors.appGradientColor),
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(8.r)),
                  child: Image.network(
                    trendingStore[index].image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppServices.addHeight(15),
                    Padding(
                      padding: EdgeInsets.only(left: 5.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          5.h.heightBox,
                          Text(
                            trendingStore[index].productName,
                            textAlign: TextAlign.center,
                            style: GetTextTheme.fs14_medium
                                .copyWith(color: AppColors.greyColor),
                          ),
                          2.h.heightBox,
                          Text(
                            "Explore Now",
                            style: GetTextTheme.fs12_medium
                                .copyWith(color: AppColors.primaryColor),
                          ),
                        ],
                      ),
                    )
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
