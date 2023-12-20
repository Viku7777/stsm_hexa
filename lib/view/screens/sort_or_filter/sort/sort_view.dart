import 'package:cattel_feed/Helper/colors.dart';
import 'package:cattel_feed/Helper/textstyle.dart';

import 'package:cattel_feed/resource/component/custom_text.dart';
import 'package:cattel_feed/view/screens/homepage/home_view/widgets.dart';
import 'package:flutter/material.dart';

class SortView extends StatefulWidget {
  static List<String> sortMethod = [
    "Relevance",
    "New Arrivals",
    "Price (High to Low)",
    "Price (Low to High)",
    "Ratings",
    "Discount"
  ];
  // ignore: prefer_const_constructors_in_immutables
  SortView({super.key});

  @override
  State<SortView> createState() => _SortViewState();
}

class _SortViewState extends State<SortView> {
  String selectMethod = SortView.sortMethod.first;

  @override
  Widget build(BuildContext context) {
    return customListview(SortView.sortMethod.length, (index) {
      return RadioListTile.adaptive(
        controlAffinity: ListTileControlAffinity.trailing,
        activeColor: AppColors.primaryColor,
        title:
            customText(SortView.sortMethod[index], GetTextTheme.fs16_regular),
        value: SortView.sortMethod[index],
        groupValue: selectMethod,
        onChanged: (value) {
          selectMethod = value.toString();
          setState(() {});
        },
      );
    }, isverticalAxis: true);
  }
}
