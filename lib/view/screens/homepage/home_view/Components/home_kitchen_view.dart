import 'package:cattel_feed/Helper/base_getters.dart';
import 'package:cattel_feed/Helper/colors.dart';
import 'package:cattel_feed/Helper/textstyle.dart';
import 'package:cattel_feed/model/all_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeAndKitchenView extends StatelessWidget {
  const HomeAndKitchenView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: mensBudgetModel.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.50.sp,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemBuilder: (context, index) {
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.all(1.1),
              height: 135.h,
              width: 130.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  gradient: AppColors.appGradientColor),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: Image.network(
                  mensBudgetModel[index].image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            AppServices.addHeight(5),
            Text(
              mensBudgetModel[index].productName,
              style: GetTextTheme.fs14_medium,
            ),
            RichText(
              text: TextSpan(
                text: "under ",
                style: GetTextTheme.fs12_regular,
                children: [
                  TextSpan(
                    text: mensBudgetModel[index].price,
                    style: GetTextTheme.fs14_regular.copyWith(fontSize: 13),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
