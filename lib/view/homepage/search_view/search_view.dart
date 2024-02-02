import 'package:cattel_feed/resource/const/colors.dart';
import 'package:cattel_feed/model/product_model/product_model.dart';
import 'package:cattel_feed/resource/component/appbar_component.dart';
import 'package:cattel_feed/resource/component/text_field.dart';
import 'package:cattel_feed/view/homepage/item_List/item_view_tile.dart';
import 'package:cattel_feed/view_model/controller/app_data_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class SearchView extends StatefulWidget {
  static String routes = "/SearchView";
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  List<ProductModel> searchProducts = [];
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar("Search"),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: CustomTextfield(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.grey)),
              controller: searchController,
              onChanged: (p0) {
                search();
              },
              prefixIcon: const Icon(
                CupertinoIcons.search,
                color: AppColors.greyColor,
              ),
              hintText: "Search by Keyword or Product ID",
              suffixIcon: const Icon(
                Icons.sort,
                color: AppColors.greyColor,
              ),
            ),
          ),
          20.h.heightBox,
          Expanded(
              child: searchController.text.isEmpty
                  ? Center(
                      child: Text(
                        "Search any Keyword",
                        style: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.w400),
                      ),
                    )
                  : searchProducts.isEmpty
                      ? Center(
                          child: Padding(
                            padding: EdgeInsets.all(5.sp),
                            child: Image.asset(
                              "assets/icon/search_not_found.png",
                            ),
                          ),
                        )
                      : GridView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: searchProducts.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: .60.sp,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10),
                          itemBuilder: (context, index) {
                            return ItemViewTiel(
                              replace: true,
                              product: searchProducts[index],
                            );
                          },
                        ))
        ],
      ),
    );
  }

  search() {
    var data = Get.find<AppData>();
    searchProducts.clear();
    searchProducts = data.products
        .where((element) => element.name!
            .toLowerCase()
            .contains(searchController.text.toLowerCase()))
        .toList();
    if (searchController.text.isEmpty) {
      searchProducts.clear();
    }
    setState(() {});
  }
}
