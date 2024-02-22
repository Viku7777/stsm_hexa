import 'package:cattel_feed/language/language.dart';
import 'package:cattel_feed/model/categories_Model/sub_category.dart';
import 'package:cattel_feed/resource/component/appbar_component.dart';
import 'package:cattel_feed/resource/const/textstyle.dart';
import 'package:cattel_feed/view/categories/ui/subcat_select_view.dart';
import 'package:cattel_feed/view_model/controller/app_data_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
        appBar: customAppbar(LanguagesKey.category.tr),
        body: ListView.separated(
            separatorBuilder: (context, index) => 20.h.heightBox,
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            itemCount: data.categories.length,
            shrinkWrap: true,
            itemBuilder: (context, i) {
              List<SubCategoriesModel> subcat = data.subCategories
                  .where((element) => element.catID == data.categories[i].id)
                  .toList();
              bool isEven = i % 2 == 0;
              return InkWell(
                  onTap: () {
                    Get.to(() => SelectSubcatView(
                        categoriesModel: data.categories[i], subcat: subcat));
                  },
                  child: SizedBox(
                    height: 100,
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        Container(
                            height: 60.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(10.r)),
                            padding: EdgeInsets.all(10.sp),
                            margin: EdgeInsets.all(6.sp),
                            alignment: !isEven
                                ? Alignment.centerLeft
                                : Alignment.centerRight,
                            child: SizedBox(
                              height: 30.h,
                              // width: 100,
                              child: Stack(
                                children: [
                                  Positioned(
                                    // right: isEven ? -2.w : null,
                                    child: Text(
                                      data.categories[i].title,
                                      style: GetTextTheme.fs18_medium,
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                    ),
                                  ),
                                  Positioned(
                                    top: 5.h,
                                    left: isEven ? -2.w : 5.w,
                                    child: Text(
                                      data.categories[i].title,
                                      style: GoogleFonts.yellowtail(
                                          fontSize: 20.sp,
                                          color: Colors.orange.withOpacity(.4)),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        Positioned(
                            left: isEven ? 20.w : null,
                            right: isEven ? null : 20.w,
                            child: Container(
                              height: 90.h,
                              width: 100.w,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        data.categories[i].image,
                                      ),
                                      fit: BoxFit.cover)),
                            )),
                      ],
                    ),
                  )
                  // Container(
                  //     height: 60.h,
                  //     decoration: BoxDecoration(
                  //         color: Colors.grey.shade200,
                  //         borderRadius: BorderRadius.circular(10.r)),
                  //     padding: EdgeInsets.all(10.sp),
                  //     margin: EdgeInsets.all(6.sp),
                  //     child: Stack(
                  //       children: [
                  //         // Row(
                  //         //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         //   children: [
                  //         //     isEven
                  //         //         ? SizedBox(
                  //         //             width: 200.w,
                  //         //             height: 50.h,
                  //         //             child: Stack(
                  //         //               children: [
                  //         //                 Positioned(
                  //         //                   // left: 10.w,
                  //         //                   child: Text(
                  //         //                     data.categories[i].title,
                  //         //                     style: GetTextTheme.fs18_medium,
                  //         //                     textAlign: TextAlign.center,
                  //         //                   ),
                  //         //                 ),
                  //         //                 Positioned(
                  //         //                     top: 5.h,
                  //         //                     left: 10.w,
                  //                       child:
                  // Text(
                  //                             data.categories[i].title,
                  //                            style: GoogleFonts.yellowtail(
                  //                                  fontSize: 20.sp,
                  //                                 color: Colors.orange
                  //                                       .withOpacity(.4)),
                  //                          ))
                  //         //               ],
                  //         //             ),
                  //         //           )
                  //         //         : AspectRatio(
                  //         //             aspectRatio: 1,
                  //         //             child: CachedNetworkImage(
                  //         //                 height: 100,
                  //         //                 width: 100,
                  //         //                 fit: BoxFit.cover,
                  //         //                 imageUrl: data.categories[i].image)),
                  //         //     isEven
                  //         //         ?
                  //         // AspectRatio(
                  //         //             aspectRatio: 1,
                  //         //             child: CachedNetworkImage(
                  //         //                 height: 100,
                  //         //                 width: 100,
                  //         //                 fit: BoxFit.cover,
                  //         //                 imageUrl: data.categories[i].image))
                  //         //         : SizedBox(
                  //         //             width: 100.w,
                  //         //             child: Stack(
                  //         //               children: [
                  //         //                 Positioned(
                  //         //                   left: 10.w,
                  //         //                   child:
                  // Text(
                  //                         data.categories[i].title,
                  //                        style: GetTextTheme.fs18_medium,
                  //                          textAlign: TextAlign.center,
                  //                          ),
                  //         //                 ),
                  //         //                 Positioned(
                  //         //                     top: 5.h,
                  //         //                     child:
                  // Text(
                  //         //                       data.categories[i].title,
                  //         //                       style: GoogleFonts.yellowtail(
                  //         //                           fontSize: 20.sp,
                  //         //                           color: Colors.orange
                  //         //                               .withOpacity(.4)),
                  //         //                     ))
                  //         //               ],
                  //         //             ),
                  //         //           )
                  //         //   ],
                  //         // ),
                  //       ],
                  //     )),

                  );
            }));
  }
}
