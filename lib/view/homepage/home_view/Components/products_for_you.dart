import 'package:cattel_feed/model/product_model/product_model.dart';
import 'package:cattel_feed/resource/const/base_getters.dart';
import 'package:cattel_feed/resource/const/colors.dart';
import 'package:cattel_feed/resource/const/textstyle.dart';
import 'package:cattel_feed/model/all_data.dart';
import 'package:cattel_feed/view/homepage/item_List/item_view_tile.dart';
import 'package:cattel_feed/view_model/controller/app_data_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProductsForYouView extends StatelessWidget {
  const ProductsForYouView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<AppData>();

    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.productsforyou.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: .65.sp,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemBuilder: (context, index) {
        return ItemViewTiel(product: controller.productsforyou[index]);
      },
    );
  }
}
