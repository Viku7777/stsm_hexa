import 'package:cached_network_image/cached_network_image.dart';
import 'package:cattel_feed/resource/const/colors.dart';
import 'package:cattel_feed/resource/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cattel_feed/model/all_data.dart';

class ShowByBrandsView extends StatelessWidget {
  const ShowByBrandsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: showBrandData.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 8 / 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () => Utils.flushBarErrorMessage("Comming Soon", context),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.greyColor.withOpacity(0.2),
                ),
                borderRadius: BorderRadius.circular(10.r)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: showBrandData[index].image,
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
        );
      },
    );
  }
}
