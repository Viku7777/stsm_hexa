

import 'package:cattel_feed/Helper/nextscreen.dart';
import 'package:cattel_feed/Helper/title_banner.dart';
import 'package:cattel_feed/backend/dummyData.dart';
import 'package:cattel_feed/const/colors.dart';
import 'package:cattel_feed/model/categorymodel.dart';
import 'package:cattel_feed/model/productsModel.dart';
import 'package:cattel_feed/model/sub_category.dart';
import 'package:cattel_feed/routes/routes.dart';
import 'package:cattel_feed/screens/component/text_field.dart';
import 'package:cattel_feed/screens/ui/categories/component/component.dart';
import 'package:cattel_feed/Helper/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  List itemsList = [];
var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "CATEGORIES",
          style: GetTextTheme.fs16_regular,
        ),
        actions: [
          IconButton(
              onPressed: () {
              },
              icon: const Icon(Icons.notifications_none_rounded)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.shopping_cart_outlined)),
        ],
      ),
     
      body: Column(
        children: [
        
          Padding(
            padding: EdgeInsets.all(12.sp),
            child:CustomSearchTextTiel(controller: SearchController())
          ),
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
                    itemCount: categories.length,
                    itemBuilder: (context, index) => InkWell(
                    
                      child: Container(
                        height: 80.h,
                        decoration: const BoxDecoration(
                            shape: BoxShape.rectangle, color: Color(0xffE9E0E0)),
                        child:  Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  CircleAvatar(
                                                    radius: 30.sp,
                                                    backgroundImage: NetworkImage(
                                                        categories[index]["image"]),
                                                  ),
                                                  2.h.heightBox,
                                                  Text(
                                                    categories[index]["Cat_title"],
                                                    style:
                                                        GetTextTheme.fs12_medium.copyWith(fontSize: 11.sp),
                                                  )
                                                ],
                                              )
                                           ,
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                                      children: [
                      ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                          itemCount: categories.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, i) {
                            CategoiresModel category = CategoiresModel.FromJson(
                                categories[i] as Map<String, dynamic>);
                            List<SubCategoriesModel> subcategories =
                                subCategories.map(
                                        (e) => SubCategoriesModel.FromJson(e))
                                    .where((e) => e.categoiresID
                                        .any((element) => element == category.id))
                                    .toList();
                            return Column(
                              children: [
                                10.h.heightBox,
                                bannerWithTitle(category.title,isCategoires: true),
                                5.h.heightBox,
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: subcategories.length,
                                  itemBuilder: (context, index) {
                                    List<ProductModel> productList = dummyitems
                                        .map((e) => ProductModel.fromJson(e))
                                        .where((element) => element.subCat.any(
                                            (element) =>
                                                element ==
                                                subcategories[index].id))
                                        .toList();
                                    return Column(
                                      children: [
                                                             
                                                dividerWithName(
                                            subcategories[index].title,),
                                                  5.h.heightBox,

                                        InkWell(
                                          onTap: () =>   nextscreen(context, RoutesName.itemlist),
                                          child: GridView.builder(
                                            itemCount: productList.length,
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            gridDelegate:
                                                const SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 3,
                                                    mainAxisSpacing: 8),
                                            itemBuilder: (context, index) {
                                              return 
                                              Column(
                                                children: [
                                                  CircleAvatar(
                                                    radius: 35.sp,
                                                    backgroundImage: NetworkImage(
                                                        productList[index].image),
                                                  ),
                                                  2.h.heightBox,
                                                  Text(
                                                    productList[index].name,
                                                    style:
                                                        GetTextTheme.fs12_medium.copyWith(fontSize: 11.sp),
                                                  )
                                                ],
                                              );
                                          
                                            },
                                          ),
                                        ),
                                        
                                
                                       
                                      ],
                                    );
                                  },
                                )

                              ],
                            );
                          })
                                      ],
                                    ),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
