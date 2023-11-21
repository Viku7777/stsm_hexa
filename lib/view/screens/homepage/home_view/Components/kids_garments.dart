import 'package:cattel_feed/Helper/base_getters.dart';
import 'package:cattel_feed/Helper/colors.dart';
import 'package:cattel_feed/Helper/textstyle.dart';
import 'package:cattel_feed/model/all_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KidsGarmentsView extends StatelessWidget {
  const KidsGarmentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          AppServices.addWidth(5),
          ...List.generate(
            kidsGarment.length,
            (index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              width: 100.w,
              decoration: BoxDecoration(
                color: AppColors.redColor,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: Image.network(
                      kidsGarment[index].image,
                      fit: BoxFit.cover,
                      width: 100.w,
                      height: 140.h,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 30.h,
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(10.r))),
                    child: Text(
                      kidsGarment[index].productName,
                      style: GetTextTheme.fs14_regular
                          .copyWith(color: AppColors.whiteColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
