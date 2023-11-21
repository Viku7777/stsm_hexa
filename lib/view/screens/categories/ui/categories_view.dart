import 'package:cattel_feed/Helper/colors.dart';
import 'package:cattel_feed/Helper/title_banner.dart';
import 'package:cattel_feed/controller/item_details_controller/item_view_controller.dart';
import 'package:cattel_feed/global/global.dart';
import 'package:cattel_feed/main.dart';
import 'package:cattel_feed/model/productsModel.dart';
import 'package:cattel_feed/model/sub_category.dart';
import 'package:cattel_feed/view/component/appbar_component.dart';
import 'package:cattel_feed/view/component/text_field.dart';
import 'package:cattel_feed/Helper/textstyle.dart';
import 'package:cattel_feed/view/screens/homepage/item_List/item_list_screen.dart';
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
  var controller = Get.put(
    ItemListController(),
  );

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
                    itemCount: FirebaseData.subcategoires!.length,
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
                              backgroundImage: const NetworkImage(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTewT9Vy_oXNqPfsYtGUEMvKYpPSWssE07c3w&usqp=CAU'),
                            ),
                            2.h.heightBox,
                            Text(
                              FirebaseData.subcategoires![index].title,
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
                        itemCount: FirebaseData.categoires!.length,
                        shrinkWrap: true,
                        itemBuilder: (context, i) {
                          List<SubCategoriesModel> subcat = FirebaseData
                              .subcategoires!
                              .where((element) =>
                                  element.categoiresID ==
                                  FirebaseData.categoires![i].id)
                              .toList();
                          return Column(
                            children: [
                              10.h.heightBox,
                              bannerWithTitle(FirebaseData.categoires![i].title,
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
                                            List<ProductItemModel> products =
                                                FirebaseData.products!
                                                    .where(
                                                      (element) =>
                                                          element.catID ==
                                                              FirebaseData
                                                                  .categoires![
                                                                      i]
                                                                  .id &&
                                                          FirebaseData
                                                                  .subcategoires![
                                                                      index]
                                                                  .id ==
                                                              subcat[index].id,
                                                    )
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
                                                backgroundImage: const NetworkImage(
                                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTewT9Vy_oXNqPfsYtGUEMvKYpPSWssE07c3w&usqp=CAU"),
                                              ),
                                              2.h.heightBox,
                                              Text(
                                                subcat[index].title,
                                                style: GetTextTheme.fs12_medium
                                                    .copyWith(fontSize: 11.sp),
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                    ),

                              // Column(children: subcat.generate((index) {
                              //   List<ProductItemModel> products = FirebaseData
                              //       .products!
                              //       .where((element) =>
                              //           element.catID ==
                              //               FirebaseData.categoires![i].id &&
                              //           element.subCatID ==
                              //               FirebaseData
                              //                   .subcategoires![index].id)
                              //       .toList();
                              //   return Column(
                              //     children: [
                              //       10.h.heightBox,
                              //       dividerWithName(
                              //         subcat[index].title,
                              //       ),
                              //       GridView.builder(
                              //         itemCount: products.length,
                              //         shrinkWrap: true,
                              //         physics:
                              //             const NeverScrollableScrollPhysics(),
                              //         gridDelegate:
                              //             const SliverGridDelegateWithFixedCrossAxisCount(
                              //                 crossAxisCount: 3,
                              //                 mainAxisSpacing: 8),
                              //         itemBuilder: (context, index) {
                              //           return InkWell(
                              //             onTap: () {},
                              //             child: Column(
                              //               children: [
                              //                 CircleAvatar(
                              //                   radius: 35.sp,
                              //                   backgroundImage: NetworkImage(
                              //                       products[index]
                              //                           .image
                              //                           .first),
                              //                 ),
                              //                 2.h.heightBox,
                              //                 Text(
                              //                   products[index].title,
                              //                   style: GetTextTheme.fs12_medium
                              //                       .copyWith(fontSize: 11.sp),
                              //                 )
                              //               ],
                              //             ),
                              //           );
                              //         },
                              //       ),

                              //       5.h.heightBox,
                              //     ],
                              //   );
                              // }))

                              // ...subcat.generate((index) {
                              //   List<ProductModel> productslist =
                              //       dummyProductList
                              //           .where((element) =>
                              //               element.subcategoriesID ==
                              //                   subcat[index].id &&
                              //               element.categoiresID ==
                              //                   dummyCategoires[i].id)
                              //           .toList();
                              //   return Column(
                              //     children: [
                              //       10.h.heightBox,
                              //       dividerWithName(
                              //         subcat[index].title,
                              //       ),
                              //       5.h.heightBox,

                              //       GridView.builder(
                              //           itemCount: productslist.length,
                              //           shrinkWrap: true,
                              //           physics:
                              //               const NeverScrollableScrollPhysics(),
                              //           gridDelegate:
                              //               const SliverGridDelegateWithFixedCrossAxisCount(
                              //                   crossAxisCount: 3,
                              //                   mainAxisSpacing: 8),
                              //           itemBuilder: (context, index) {
                              //             return InkWell(
                              //               onTap: () {
                              //                 List<ItemModel> sortItems =
                              //                     dummyitemList
                              //                         .where((element) =>
                              //                             productslist[index]
                              //                                 .itemid
                              //                                 .any((e) => e
                              //                                     .contains(element
                              //                                         .itemid)))
                              //                         .toList();
                              //                 controller
                              //                     .updateItemList(sortItems);
                              //                 Get.to(() => ItemlistScreen(
                              //                       title: productslist[index]
                              //                           .name,
                              //                     ));
                              //               },
                              //               child:
                              //
                              // Column(
                              //                 children: [

                              //                   )
                              //                 ],
                              //               ),
                              //             );
                              //           })
                              //     ],
                              //   );
                              // })
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
