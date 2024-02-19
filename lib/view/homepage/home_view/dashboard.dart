import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cattel_feed/language/language.dart';
import 'package:cattel_feed/repository/banner_repository/banner_repository.dart';
import 'package:cattel_feed/repository/firebase_repository/firebase_repository.dart';
import 'package:cattel_feed/resource/component/showloading.dart';
import 'package:cattel_feed/resource/const/base_getters.dart';
import 'package:cattel_feed/resource/const/nextscreen.dart';
import 'package:cattel_feed/resource/const/colors.dart';
import 'package:cattel_feed/resource/const/textstyle.dart';
import 'package:cattel_feed/resource/component/text_field.dart';
import 'package:cattel_feed/resource/utils/utils.dart';
import 'package:cattel_feed/view/account_setting/my_favorites/favorites.dart';
import 'package:cattel_feed/view/address/add_address/add_new_address.dart';
import 'package:cattel_feed/view/cart_view/cart_view.dart';
import 'package:cattel_feed/view/categories/component/component.dart';
import 'package:cattel_feed/view/categories/ui/sub_categories_list.dart';
import 'package:cattel_feed/view/homepage/home_view/Components/CategoryLayoutTiel.dart';
import 'package:cattel_feed/view/homepage/home_view/Components/budget_store_view.dart';
import 'package:cattel_feed/view/homepage/home_view/Components/caraousel_slider.dart';
import 'package:cattel_feed/view/homepage/home_view/Components/delivery_banner.dart';
import 'package:cattel_feed/view/homepage/home_view/Components/products_for_you.dart';
import 'package:cattel_feed/view/homepage/home_view/Components/shop_by_brands.dart';
import 'package:cattel_feed/view/homepage/home_view/Components/title_bar.dart';
import 'package:cattel_feed/view/homepage/item_List/item_list_screen.dart';
import 'package:cattel_feed/view/homepage/search_view/search_view.dart';
import 'package:cattel_feed/view/notification_screens/empty_notification.dart';
import 'package:cattel_feed/view_model/controller/address_controller.dart';
import 'package:cattel_feed/view_model/controller/app_data_controller.dart';
import 'package:cattel_feed/view_model/controller/banner_controller.dart';
import 'package:cattel_feed/view_model/controller/cart_controller.dart';
import 'package:cattel_feed/view_model/controller/logged_in_user_controller.dart';
import 'package:cattel_feed/view_model/controller/sub_categories_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:cattel_feed/resource/const/icon.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:badges/badges.dart' as badges;

class DashboardScreenView extends StatefulWidget {
  const DashboardScreenView({super.key});

  @override
  State<DashboardScreenView> createState() => _DashboardScreenViewState();
}

class _DashboardScreenViewState extends State<DashboardScreenView> {
  final TextEditingController searchProductController = TextEditingController();
  BannerController banners = BannerController();
  var data = Get.find<AppData>();
  var loggedInUser = Get.find<LoggedInUserController>();

  bool loading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.whiteColor,
        leadingWidth: 0,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: 40.h,
                  width: 50.w,
                  margin: EdgeInsets.only(
                    right: 10.w,
                  ),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.greyColor),
                  child: Image.asset(IconsClass.personIcon)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LanguagesKey.hello.tr,
                    style: GetTextTheme.fs12_regular,
                  ),
                  Text(
                    LanguagesKey.letsExplore.tr,
                    style: GetTextTheme.fs12_bold,
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(FavoritesItemView.routes);
            },
            icon: const Icon(Icons.favorite, color: AppColors.blackColor),
          ),
          badges.Badge(
            badgeStyle: badges.BadgeStyle(badgeColor: AppColors.primaryColor),
            onTap: () {
              Get.to(const CartView());
            },
            showBadge: (loggedInUser.isGuestUser) ? false : true,
            badgeContent: GetBuilder<NewCartController>(
              builder: (controller) =>
                  Text(controller.cartItems.length.toString()),
            ),
            position: badges.BadgePosition.bottomEnd(
              bottom: 5,
            ),
            child: Icon(
              Icons.shopping_cart_outlined,
              color: AppColors.blackColor,
              size: 25.sp,
            ),
          ),
          IconButton(
            onPressed: () {
              Get.to(const EmptyNotificationView());
            },
            icon: const Icon(CupertinoIcons.bell, color: AppColors.blackColor),
          ),
        ],
      ),
      body: Stack(
        children: [
          RefreshIndicator(
            color: AppColors.primaryColor,
            onRefresh: () async {
              var controller = Get.find<AppData>();
              BannerRepository banner = BannerRepository();
              FirebaseRepository apis = FirebaseRepository();
              await banner.getAllBanners(context);

              await apis.getCategories().then((value) async {
                controller.updateCategories(value);
              }).onError((error, stackTrace) {
                Utils.flushBarErrorMessage(error.toString(), context);
              });

              await apis.getSubCategories().then((value) async {
                controller.updateSubCategories(value);
              }).onError((error, stackTrace) {
                Utils.flushBarErrorMessage(error.toString(), context);
              });

              await apis.getProducts().then((value) async {
                controller.updateProducts(value);
              }).onError((error, stackTrace) {
                Utils.flushBarErrorMessage(error.toString(), context);
              });
            },
            child: ListView(
              children: [
                AppServices.addHeight(5),

                // This Widget show Location Title on dashboard
                if (!loggedInUser.isGuestUser)
                  GetBuilder<UserAddressController>(
                    builder: (controller) {
                      if (controller.addresses.isEmpty) {
                        return InkWell(
                            onTap: () =>
                                nextscreen(context, AddNewAddressView.routes),
                            child: Column(
                              children: [
                                TitleComponent.locationTitleComponent(),
                                AppServices.addHeight(10),
                              ],
                            ));
                      }
                      return const SizedBox();
                    },
                  ),

                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: CustomTextfield(
                      readOnly: true,
                      onTap: () => Get.toNamed(SearchView.routes),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.grey)),
                      controller: SearchController(),
                      prefixIcon: const Icon(
                        CupertinoIcons.search,
                        color: AppColors.greyColor,
                      ),
                      hintText: "Search by Keyword or Product ID",
                      suffixIcon: const Icon(
                        Icons.sort,
                        color: AppColors.greyColor,
                      ),
                    )),
                AppServices.addHeight(10),

                // This widget show Highlights category top of the dashboard
                GetBuilder<AppData>(builder: (controller) {
                  return controller.categories.isEmpty
                      ? const SizedBox()
                      : SizedBox(
                          height: 90.h,
                          width: Get.width,
                          child: ListView.separated(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: controller.categories.length,
                            separatorBuilder: (context, index) => 5.w.widthBox,
                            itemBuilder: (context, index) {
                              return storyView(
                                  controller.categories[index].image,
                                  controller.categories[index].title, () {
                                var subcontroller =
                                    Get.find<SubCategoriesController>();
                                subcontroller.updateSubCategoriesList(
                                    controller.categories[index].id);

                                Get.to(SubCategoriesItemView(
                                  currentCategories:
                                      controller.categories[index],
                                ));
                              });
                            },
                          ),
                        );
                }),
                AppServices.addHeight(5),

                BannerController.largeBanner.isNotEmpty
                    ? Column(
                        children: [
                          CachedNetworkImage(
                            imageUrl: BannerController.largeBanner.first,
                            errorWidget: (context, url, error) =>
                                Utils.imageError(),
                          ),
                          AppServices.addHeight(15),
                        ],
                      )
                    : const SizedBox(),

                // Ads Banner
                BannerController.salesOffers.isNotEmpty
                    ? showcarouselslider(BannerController.salesOffers)
                    : const SizedBox(),
                AppServices.addHeight(15),

                // Weekly Top Deals
                TitleComponent.titleWidgetWithView(
                  LanguagesKey.weeklyTopDeals.tr,
                  onTap: () => Get.to(() => ItemlistScreen(
                      title: "Weekly Top Deals", products: data.weeklyproduct)),
                ),
                AppServices.addHeight(15),
// weekly deal list
                CategoriesLayoutTile.oneByThreewithProduct(data.weeklyproduct),
                AppServices.addHeight(20),

                // pati Banner
                BannerController.smallPattBanner.isNotEmpty
                    ? CachedNetworkImage(
                        imageUrl: BannerController.smallPattBanner.first,
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      )
                    : const SizedBox(),
                AppServices.addHeight(5),

                // Delivery Banner
                const DeliveryBannerView(),
                AppServices.addHeight(20),

                // Budget Storer
                const BudgetStoreView(),
                AppServices.addHeight(10),
                ...data.categories.map((e) {
                  switch (e.homepagelayout.trim()) {
                    case "oneByThree":
                      return CategoriesLayoutTile.oneByThree(e);
                    case "threeByTwo":
                      return CategoriesLayoutTile.threeByTwo(e);
                    case "twoByTwo":
                      return CategoriesLayoutTile.twoByTwo(e);
                    case "twoByTwoWithList":
                      return CategoriesLayoutTile.twoByTwoWithList(e);
                    case "threeByThree":
                      return CategoriesLayoutTile.threeByThree(e);

                    default:
                      return const SizedBox();
                  }
                }).toList(),
                //

                // Banner View
                // 2nd pati banner

                BannerController.smallPattBanner.length > 1
                    ? CachedNetworkImage(
                        imageUrl: BannerController.smallPattBanner[2],
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      )
                    : const SizedBox(),
                AppServices.addHeight(20),

                // Banner
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.sp),
                  child: BannerController.animalSupliments.isNotEmpty
                      ? Column(
                          children: [
                            showcarouselslider(
                                BannerController.animalSupliments),
                            AppServices.addHeight(20),
                          ],
                        )
                      : const SizedBox(),
                ),

                // 2nd pati banner

                BannerController.largeBanner.length >= 2
                    ? Column(
                        children: [
                          CachedNetworkImage(
                            imageUrl: BannerController.largeBanner.first,
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                          AppServices.addHeight(20),
                        ],
                      )
                    : const SizedBox(),

                // Shop by Brands
                // TitleComponent.titleWidgetWithView(
                //   LanguagesKey.shopByBrand.tr,
                //   onTap: () =>
                //       Utils.flushBarErrorMessage("Comming Soon", context),
                // ),
                // 5.h.heightBox,
                // AppServices.addHeight(5),
                // const ShowByBrandsView(),
                // AppServices.addHeight(30),

                // Products For You
                TitleComponent.taglineGradient("Products For You"),
                AppServices.addHeight(20),
                const ProductsForYouView(),
                AppServices.addHeight(20),
              ],
            ),
          ),
          loading ? const ShowLoading() : const SizedBox()
        ],
      ),
    );
  }
}
