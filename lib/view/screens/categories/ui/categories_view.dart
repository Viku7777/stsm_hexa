import 'package:cattel_feed/Helper/colors.dart';
import 'package:cattel_feed/Helper/title_banner.dart';
import 'package:cattel_feed/main.dart';
import 'package:cattel_feed/model/product_model/product_model.dart';
import 'package:cattel_feed/model/sub_category.dart';
import 'package:cattel_feed/resource/component/appbar_component.dart';
import 'package:cattel_feed/resource/component/text_field.dart';
import 'package:cattel_feed/Helper/textstyle.dart';
import 'package:cattel_feed/view/screens/homepage/item_List/item_list_screen.dart';
import 'package:cattel_feed/view_model/controller/app_data_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  List itemsList = [];
  var searchController = TextEditingController();
  ScrollController scrollController = ScrollController();
  var data = Get.find<AppData>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppbar("CATEGORIES"),
      body: Column(
        children: [
          Padding(
              padding: EdgeInsets.all(12.sp),
              child: CustomSearchTextTiel(controller: SearchController())),
          Container(
            height: 1.h,
            decoration: BoxDecoration(gradient: titleWidgetGradient),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 80.w,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => Container(
                      height: 1.h,
                      decoration: BoxDecoration(gradient: titleWidgetGradient),
                    ),
                    shrinkWrap: true,
                    itemCount: data.categories.length,
                    itemBuilder: (context, index) => InkWell(
                      child: Container(
                        height: screenSize.height * .13,
                        decoration: const BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Color(0xffE9E0E0)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 30.sp,
                              backgroundImage:
                                  NetworkImage(data.categories[index].image),
                            ),
                            2.h.heightBox,
                            Text(
                              data.categories[index].title,
                              overflow: TextOverflow.ellipsis,
                              style: GetTextTheme.fs12_medium
                                  .copyWith(fontSize: 11.sp),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        itemCount: data.categories.length,
                        shrinkWrap: true,
                        itemBuilder: (context, i) {
                          List<SubCategoriesModel> subcat = data.subCategories
                              .where((element) =>
                                  element.catID == data.categories[i].id)
                              .toList();
                          return Column(
                            children: [
                              10.h.heightBox,
                              bannerWithTitle(data.categories[i].title,
                                  isCategoires: true),
                              5.h.heightBox,
                              subcat.isEmpty
                                  ? Text(
                                      "Not found",
                                      style: GetTextTheme.fs14_medium,
                                    )
                                  : GridView.builder(
                                      itemCount: subcat.length,
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 3,
                                              mainAxisSpacing: 8),
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () {
                                            String subcatid = subcat[index].id;
                                            String cat = data.categories[i].id;
                                            List<ProductModel> products = data
                                                .products
                                                .where((element) =>
                                                    element.categories!
                                                            .parentId ==
                                                        cat &&
                                                    element.categories!.id ==
                                                        subcatid)
                                                .toList();

                                            Get.to(() => ItemlistScreen(
                                                  title: subcat[index].title,
                                                  products: products,
                                                ));
                                          },
                                          child: Column(
                                            children: [
                                              CircleAvatar(
                                                radius: 35.sp,
                                                backgroundImage: NetworkImage(
                                                    subcat[index].image),
                                              ),
                                              2.h.heightBox,
                                              Text(
                                                subcat[index].title,
                                                overflow: TextOverflow.ellipsis,
                                                style: GetTextTheme.fs12_medium
                                                    .copyWith(fontSize: 11.sp),
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                            ],
                          );
                        })),
              ],
            ),
          )
        ],
      ),
    );
  }
}
