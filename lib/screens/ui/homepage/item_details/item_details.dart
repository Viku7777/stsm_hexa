// ignore_for_file: must_be_immutable

import 'package:cattel_feed/Helper/nextscreen.dart';
import 'package:cattel_feed/Helper/textstyle.dart';
import 'package:cattel_feed/backend/dummyData.dart';
import 'package:cattel_feed/const/colors.dart';
import 'package:cattel_feed/const/icon.dart';
import 'package:cattel_feed/model/productsModel.dart';
import 'package:cattel_feed/routes/routes.dart';
import 'package:cattel_feed/screens/component/appbar_component.dart';
import 'package:cattel_feed/screens/component/custom_text.dart';
import 'package:cattel_feed/screens/component/icon_with_gradinet.dart';
import 'package:cattel_feed/screens/component/rating_tile.dart';
import 'package:cattel_feed/screens/component/users_review_tiel.dart';
import 'package:cattel_feed/screens/component/viewallrow.dart';
import 'package:cattel_feed/screens/ui/homepage/item_List/item_view_tile.dart';
import 'package:cattel_feed/screens/ui/homepage/item_details/available_size_tile.dart';
import 'package:cattel_feed/screens/ui/homepage/item_details/show_more_option_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class ItemDetailsView extends StatefulWidget {
  String id;
  ItemDetailsView({super.key, required this.id});

  @override
  State<ItemDetailsView> createState() => _ItemDetailsViewState();
}

class _ItemDetailsViewState extends State<ItemDetailsView> {
  @override
  // ignore: override_on_non_overriding_member
  String title =
      "Lorem ipsum dolor sit amet consectetur. Aliquam phasellus nunc nunc mauris metus et diam vulputate odio. Pharetra nunc urna pulvinar at arcu habitasse dictum purus. Tortor vitae blandit lacus erat.";
  List availablesize = ["S", "M", "L", "XL", "XXL"];
  EdgeInsetsGeometry contentPaddings = EdgeInsets.symmetric(horizontal: 10.w);
  String storename = "Xyz Store";
  String storeAddress = "#001, city, state - 0011001";
  @override
  Widget build(BuildContext context) {
    ProductModel item = ProductModel.fromJson(
        dummyitems.firstWhere((element) => element["id"] == widget.id));

    return Scaffold(
      backgroundColor: Colors.white,

      // app bar
      appBar: customAppbar("Stylish Casual T-Shirt"),

      // ////////// body start //////////////////
      body: ListView(
        children: [
          // main product images
          Stack(
            children: [
              ////////////////// product image ////////////////
              Image.network(
                item.image,
                fit: BoxFit.cover,
                height: 430.h,
                width: 430.w,
              ),
              //  favorite  button
              Positioned(
                top: 25.h,
                right: 25.w,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.favorite_border),
                      color: AppColors.redColor),
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
            ).copyWith(top: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               ///////// // product title /////////////////
                customText(
                  title,
                  GetTextTheme.fs14_regular,
                ),
                10.h.heightBox,
            /////////////// ///// ///  // product name ////////////////
                customText(item.name, GetTextTheme.fs14_bold),
                // product delivery type
                customText(
                  "Free Delivery",
                  GetTextTheme.fs12_regular
                      .copyWith(color: AppColors.greylightcolor),
                ),

              ///////////////// / /// price section ///////////////////
                Row(
                  children: [
              // old price
                    customText(
                      "₹ 350",
                      GetTextTheme.fs18_medium.copyWith(
                          decoration: TextDecoration.lineThrough,
                          color: AppColors.greylightcolor),
                    ),
                    10.w.widthBox,

                    // current price
                    customText(
                      "₹ ${item.price}",
                      GetTextTheme.fs18_bold
                          .copyWith(color: AppColors.redColor),
                    )
                  ],
                ),
              
               ////////////// // item rating section//////////////////
                Row(
                  children: [
                  // item rating bar
                    customratingTile(),
                    5.w.widthBox,
                    // item rating in text form
                    customText(
                      "4.2 / 5.0",
                      GetTextTheme.fs10_regular,
                    )
                  ],
                )
,
               ////////// // more similar item view /////////////
                
                20.h.heightBox,
                customText(
                  "More Options",
                 GetTextTheme.fs14_regular,
                ),
                10.h.heightBox,

                // more item grid view
                SizedBox(
                  height: 100.h,
                  child: ListView.builder(
                      itemCount: dummyitems.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>
                          showmoreOptionTile(item.image)),
                ),
                20.h.heightBox,
              /////////////////////////// Available size view /////////////
                customtitleText("Available Sizes"),
                10.h.heightBox,

              
                SizedBox(
                  height: 30.h,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: availablesize.length,
                      itemBuilder: (context, index) =>
                          availablesizeTiel(availablesize[index], false)),
                ),
                20.h.heightBox,
            //////////////// Product Discription //////////////// 
                Text(
                  "Product Details",
                  style: GetTextTheme.fs14_regular,
                ),
                10.h.heightBox,
                Text(
                  title,
                  style: GetTextTheme.fs14_regular,
                ),
                10.h.heightBox,
              ],
            ),
          ),
          const Divider(
            color: Colors.grey,
          ),

          /////////////////////// Seller Store ////////////////////////
          Padding(
            padding: contentPaddings,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                customtitleText("Seller Details"),
                10.h.heightBox,
                ListTile(
                  shape: customroundedBorder(10),
                  tileColor: AppColors.gerythinColor,
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Image.asset(IconsClass.storeicon),
                  ),
                                  // seller store name

                  title: Text(
                    storename,
                    style: GetTextTheme.fs14_bold,
                  ),
                                                    // seller store address

                  subtitle: Text(
                    storeAddress,
                    style: GetTextTheme.fs12_regular,
                  ),
                  trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.more_vert_outlined,
                        color: Colors.black,
                      )),
                ),
                10.h.heightBox,
                customtitleText("More from seller"),


                ///////////////// Similar  item from another seller  /////////////////
                SizedBox(
                  height: 198.h,
                  child: ListView.builder(
                      itemCount: dummyitems.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        List<ProductModel> items = dummyitems
                            .map((e) => ProductModel.fromJson(e))
                            .toList();

                        return SizedBox(
                          width: 120.w,
                          child:
                              ItemViewTiel(item: items[index], showMore: true),
                        );
                      }),
                ),
              ],
            ),
          ),
          const Divider(
            color: Colors.grey,
          ),
          SizedBox(
            height: 120.h,
            child: const Text("Ratings"),
          ),

          // ///////////// Product rating by users /////////////////////
          ListView.builder(
            padding: contentPaddings,
            itemCount: 3,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) => customersReviewtile(),
          ),
          Padding(
              padding: contentPaddings,
              child: viewAllRow("753 More Reviews", () => null,
              isRed: true,
                  textcolor: 0xffDD0000,
                  icon: Icon(
                    Icons.arrow_circle_right,
                    color: AppColors.redColor,
                  ),
                 )),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                10.h.heightBox,
                Text(
                  "Check Delivery Availablity",
                  style: GetTextTheme.fs14_regular,
                ),
                10.h.heightBox,

                /////////////// Check Delivery Section  ///////////////////
                Card(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10))),
              // pincode text field
                  child: TextField(
                    decoration: InputDecoration(
                        suffixIcon: TextButton(
                            onPressed: () {},
                            child: Text(
                              "Check",
                              style: GetTextTheme.fs14_regular
                                  .copyWith(color: AppColors.redColor),
                            )),
                        contentPadding: EdgeInsets.only(left: 10.w, top: 10.h),
                        border: InputBorder.none,
                        hintText: 'Enter pin code',
                        hintStyle: GetTextTheme.fs12_regular.copyWith(
                            fontSize: 15.sp, color: const Color(0xff5B5B5B))),
                  ),
                ),
                customText(
                  "Delivery charges may vary according to pincode",
                   GetTextTheme.fs12_regular.copyWith(color: Colors.grey),
                )
              ],
            ),
          ),
          10.h.heightBox,
          Image.asset(
            AppBanner.shipingBanner,
            fit: BoxFit.cover,
          ),

          20.h.heightBox,

          // add to cart or buy now button

          Padding(
            padding: contentPaddings,
            child: Row(
              children: [
                // add to cart button
                Expanded(
                  child: InkWell(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        
                        SnackBar(
                          backgroundColor: AppColors.greenColor,
                             behavior: SnackBarBehavior.floating,

                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(IconsClass.cartIcon,height: 60.h,width: 60.h,),
                          20.w.widthBox,
                        Expanded(child: Text("Item Successfully Added to Cart",overflow: TextOverflow.fade, style:GetTextTheme.fs16_medium.copyWith(color: Colors.white)))
                        ],
                      ),
                      
                      action: SnackBarAction(label: "View Cart", onPressed: (){
                        nextscreen(context, RoutesName.cart);
                      },textColor: Colors.black,),
                      
                      ));
                    },
                    child: Container(
                      height: 44.h,
                      decoration: kGradientBoxDecoration,
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                            decoration: kInnerDecoration,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                customIconWithGradient(Icons.shopping_cart_outlined,)
                                 ,
                                10.w.widthBox,
                                customtextWithGradentColor("Add to cart",GetTextTheme.fs16_regular)
                           
                              ],
                            )),
                      ),
                    ),
                  ),
                ),
                10.w.widthBox,
            // buy now button
                Expanded(
                    child: InkWell(
                  onTap: () => nextscreen(context, RoutesName.cart),
                      child: 
                      Container(
                                      height: 44.h,
                                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.sp),
                        gradient: titleWidgetGradient),
                                      child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.shopping_bag_outlined,
                          color: Colors.white,
                          size: 22.sp,
                        ),
                        10.w.widthBox,
                        Text(
                          "Buy Now",
                          style: GetTextTheme.fs16_regular
                              .copyWith(color: Colors.white),
                        )
                      ],
                                      ),
                                    ),
                    
                    )),
              ],
            ),
          ),
          20.h.heightBox,

          // similar products /////////
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: viewAllRow("Similar Products", () => null,
            isRed: true,
                icon: Icon(
                  Icons.arrow_circle_right,
                  color: AppColors.redColor,
                ),
               ),
          ),
          10.h.heightBox,
          GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            itemCount: dummyitems.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: .7,
                crossAxisCount: 2,
                mainAxisSpacing: 5.h,
                crossAxisSpacing: 5.w),
            itemBuilder: (context, index) {
              List<ProductModel> items =
                  dummyitems.map((e) => ProductModel.fromJson(e)).toList();
              return ItemViewTiel(item: items[index]);
            },
          ),
        ],
      ),
    );
  }

  customtitleText(title) => Text(
        title,
        style: GetTextTheme.fs14_regular,
      );

  final kInnerDecoration = BoxDecoration(
    color: Colors.white,
    border: Border.all(color: Colors.white),
    borderRadius: BorderRadius.circular(12.sp),
  );

  final kGradientBoxDecoration = BoxDecoration(
    gradient: titleWidgetGradient,
    color: Colors.white,
    borderRadius: BorderRadius.circular(12.sp),
  );
}
