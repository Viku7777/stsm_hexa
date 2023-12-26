import 'package:cattel_feed/resource/const/base_getters.dart';
import 'package:cattel_feed/resource/const/colors.dart';
import 'package:cattel_feed/resource/const/textstyle.dart';
import 'package:cattel_feed/model/all_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtherElectronicView extends StatelessWidget {
  const OtherElectronicView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          AppServices.addWidth(10),
          ...List.generate(
            otherAccessories.length,
            (index) => Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 5),
                  height: 120.h,
                  width: 120.w,
                  padding: const EdgeInsets.all(1.2),
                  decoration: BoxDecoration(
                      gradient: AppColors.appGradientColor,
                      borderRadius: BorderRadius.circular(10.r)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: Image.network(
                      otherAccessories[index].image,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
                AppServices.addHeight(5),
                Text(
                  otherAccessories[index].productName,
                  style: GetTextTheme.fs12_regular,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
