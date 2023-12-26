import 'package:cattel_feed/model/all_data.dart';
import 'package:cattel_feed/view/homepage/home_view/Components/categories_product_tiel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WomenBudgetStoreView extends StatelessWidget {
  const WomenBudgetStoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: mensBudgetModel.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.65.sp,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemBuilder: (context, index) {
        return CategoriesProductTiles(
            image: mensBudgetModel[index].image,
            title: mensBudgetModel[index].productName,
            subtitle: mensBudgetModel[index].price);
      },
    );
  }
}
