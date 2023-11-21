import 'package:cattel_feed/Helper/colors.dart';
import 'package:cattel_feed/Helper/textstyle.dart';
import 'package:cattel_feed/global/global.dart';
import 'package:cattel_feed/view/screens/categories/ui/sub_categories_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class DashboardCategoryView extends StatelessWidget {
  const DashboardCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: SizedBox(
        height: 90.h,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: FirebaseData.categoires!.length,
          separatorBuilder: (context, index) => 5.w.widthBox,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Get.to(SubCategoriesItemView(
                    category: FirebaseData.categoires![index]));
              },
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      height: 50.h,
                      width: 70.w,
                      padding: const EdgeInsets.all(2),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: titleWidgetGradient),
                      child: Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTewT9Vy_oXNqPfsYtGUEMvKYpPSWssE07c3w&usqp=CAU"),
                                fit: BoxFit.cover),
                            shape: BoxShape.circle),
                      ),
                    ),
                  ),
                  2.h.heightBox,
                  Text(
                    FirebaseData.categoires![index].title,
                    textAlign: TextAlign.center,
                    style: GetTextTheme.fs14_regular,
                  ),
                  10.h.heightBox,
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
