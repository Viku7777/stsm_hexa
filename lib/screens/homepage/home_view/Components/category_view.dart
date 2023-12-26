import 'package:cattel_feed/view/categories/component/component.dart';
import 'package:cattel_feed/view/categories/ui/sub_categories_list.dart';
import 'package:cattel_feed/view_model/controller/app_data_controller.dart';
import 'package:cattel_feed/view_model/controller/sub_categories_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class DashboardCategoryView extends StatelessWidget {
  const DashboardCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<AppData>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Expanded(
        child: SizedBox(
          height: 90.h,
          width: Get.width,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: controller.categories.length,
            separatorBuilder: (context, index) => 5.w.widthBox,
            itemBuilder: (context, index) {
              return storyView(controller.categories[index].image,
                  controller.categories[index].title, () {
                var subcontroller = Get.find<SubCategoriesController>();
                subcontroller
                    .updateSubCategoriesList(controller.categories[index].id);

                Get.to(SubCategoriesItemView(
                  currentCategories: controller.categories[index],
                ));
              });
            },
          ),
        ),
      ),
    );
  }
}
