import 'package:cattel_feed/backend/dummyData.dart';
import 'package:cattel_feed/view/component/appbar_component.dart';
import 'package:cattel_feed/view/component/users_review_tiel.dart';
import 'package:cattel_feed/view/screens/homepage/home_view/widgets.dart';
import 'package:cattel_feed/view/screens/homepage/item_details/showRatingtile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class ShowAllRatingsView extends StatefulWidget {
  static String routes = "All Reviews";
  const ShowAllRatingsView({super.key});

  @override
  State<ShowAllRatingsView> createState() => _ShowAllRatingsViewState();
}

class _ShowAllRatingsViewState extends State<ShowAllRatingsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar("All Reviews"),
      body: ListView(
        children: [
          const Divider(
            color: Colors.grey,
            thickness: 1.5,
            height: 1,
          ),
          const ShowRatingTile(),
          5.h.heightBox,

          ///////////// Product rating by users /////////////////////
          ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            itemCount: availableReview.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) =>
                customersReviewtile(index, isViewAll: true),
          ),
        ],
      ),
    );
  }
}
