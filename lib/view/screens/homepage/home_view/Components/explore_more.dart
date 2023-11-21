import 'package:cattel_feed/Helper/base_getters.dart';
import 'package:cattel_feed/Helper/colors.dart';
import 'package:cattel_feed/Helper/textstyle.dart';
import 'package:cattel_feed/model/all_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExploreMoreView extends StatelessWidget {
  const ExploreMoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: AppColors.primaryColor.withOpacity(.2),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: exploreMore.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.58.sp,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(1.1),
                height: 127.h,
                width: 127.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    gradient: AppColors.appGradientColor),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: Image.network(
                    exploreMore[index].image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              AppServices.addHeight(5),
              Text(
                exploreMore[index].productName,
                textAlign: TextAlign.center,
                style: GetTextTheme.fs14_regular,
              ),
            ],
          );
        },
      ),
    );
  }
}
