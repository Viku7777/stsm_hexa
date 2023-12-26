import 'package:cattel_feed/resource/const/base_getters.dart';
import 'package:cattel_feed/resource/const/icon.dart';
import 'package:cattel_feed/resource/const/textstyle.dart';
import 'package:cattel_feed/model/all_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BudgetStoreView extends StatelessWidget {
  const BudgetStoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "Budget Store",
            style: GetTextTheme.fs14_bold,
          ),
        ),
        AppServices.addHeight(20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              AppServices.addWidth(5),
              ...List.generate(
                budgeStoreModel.length,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Image.asset(
                        AppIcons.icon1,
                        height: 80.sp,
                        width: 80.sp,
                      ),
                      Column(
                        children: [
                          AppServices.addHeight(12),
                          RichText(
                            text: TextSpan(
                              text: "UNDER\n",
                              style: GetTextTheme.fs12_medium,
                              children: [
                                TextSpan(
                                    text:
                                        "\u20B9 ${budgeStoreModel[index].price}",
                                    style: GetTextTheme.fs18_bold)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
