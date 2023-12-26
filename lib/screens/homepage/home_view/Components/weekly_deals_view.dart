import 'package:cattel_feed/model/all_data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cattel_feed/resource/const/base_getters.dart';
import 'package:cattel_feed/resource/const/textstyle.dart';
import 'package:flutter/material.dart';

class WeeklyDealsView extends StatelessWidget {
  const WeeklyDealsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          AppServices.addWidth(5),
          ...List.generate(
            weeklyDeals.length,
            (index) => Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  width: 100.w,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: Image.network(
                      weeklyDeals[index].image,
                      fit: BoxFit.cover,
                      height: 120.h,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
                AppServices.addHeight(5),
                Text(
                  weeklyDeals[index].productName,
                  style: GetTextTheme.fs14_regular,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
