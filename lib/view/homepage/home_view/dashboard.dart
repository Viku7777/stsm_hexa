import 'package:cattel_feed/resource/const/base_getters.dart';
import 'package:cattel_feed/resource/const/nextscreen.dart';
import 'package:cattel_feed/model/categories_Model/categorymodel.dart';
import 'package:cattel_feed/resource/const/colors.dart';
import 'package:cattel_feed/resource/const/textstyle.dart';
import 'package:cattel_feed/resource/component/text_field.dart';
import 'package:cattel_feed/resource/utils/utils.dart';
import 'package:cattel_feed/screens/homepage/home_view/Components/weekly_deals_view.dart';
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
import 'package:cattel_feed/view/homepage/search_view/search_view.dart';
import 'package:cattel_feed/view/notification_screens/empty_notification.dart';
import 'package:cattel_feed/view_model/controller/address_controller.dart';
import 'package:cattel_feed/view_model/controller/app_data_controller.dart';
import 'package:cattel_feed/view_model/controller/banner_controller.dart';
import 'package:cattel_feed/view_model/controller/sub_categories_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:cattel_feed/resource/const/icon.dart';
import 'package:velocity_x/velocity_x.dart';

class DashboardScreenView extends StatefulWidget {
  const DashboardScreenView({super.key});

  @override
  State<DashboardScreenView> createState() => _DashboardScreenViewState();
}

class _DashboardScreenViewState extends State<DashboardScreenView> {
  final TextEditingController searchProductController = TextEditingController();
  BannerController banners = BannerController();
  var data = Get.find<AppData>();
  List<CategoriesModel> threeByTwo = [];
  List<CategoriesModel> oneByThree = [];
  List<CategoriesModel> twoByTwo = [];
  List<CategoriesModel> twoByTwoWithList = [];
  List<CategoriesModel> threeByThree = [];

  @override
  void initState() {
    getData();
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
          padding: EdgeInsets.only(top: 8.h, bottom: 8.h),
          child: Row(
            children: [
              Container(
                  height: 50.h,
                  width: 50.w,
                  margin: EdgeInsets.only(
                    right: 12.w,
                  ),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.greyColor),
                  child: Image.asset(IconsClass.personIcon)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello",
                    style: GetTextTheme.fs12_regular,
                  ),
                  Text(
                    "Let’s explore!",
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
          IconButton(
            onPressed: () {
              Get.toNamed(CartView.route);
            },
            icon: const Icon(Icons.shopping_cart_outlined,
                color: AppColors.blackColor),
          ),
          IconButton(
            onPressed: () {
              Get.to(const EmptyNotificationView());
            },
            icon: const Icon(CupertinoIcons.bell, color: AppColors.blackColor),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppServices.addHeight(5),

            // This Widget show Location Title on dashboard
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
                  readOnly: false,
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
                          return storyView(controller.categories[index].image,
                              controller.categories[index].title, () {
                            var subcontroller =
                                Get.find<SubCategoriesController>();
                            subcontroller.updateSubCategoriesList(
                                controller.categories[index].id);

                            Get.to(SubCategoriesItemView(
                              currentCategories: controller.categories[index],
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
                      Image.network(
                        BannerController.largeBanner.first,
                        errorBuilder: (context, error, stackTrace) =>
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
            TitleComponent.titleWidgetWithView("Weekly Top Deals"),
            AppServices.addHeight(15),
            const WeeklyDealsView(),

            //  CategoryViewTiels.oneByThree(data.products),
            AppServices.addHeight(15),

            // Kids Garments

            //// 1 by 3
            if (oneByThree.isNotEmpty) ...[
              TitleComponent.taglineGradient(oneByThree.first.title),
              AppServices.addHeight(20),
              CategoriesLayoutTile.oneByThree(data.products),
              AppServices.addHeight(20),
            ],

            // pati Banner
            BannerController.smallPattBanner.isNotEmpty
                ? Image.network(
                    BannerController.smallPattBanner.first,
                    errorBuilder: (context, error, stackTrace) =>
                        Utils.imageError(),
                  )
                : const SizedBox(),
            AppServices.addHeight(5),

            // Delivery Banner
            const DeliveryBannerView(),
            AppServices.addHeight(20),

            // Budget Storer
            const BudgetStoreView(),
            AppServices.addHeight(20),
            if (threeByTwo.isNotEmpty) ...[
              ...threeByTwo.generate((index) {
                return Column(
                  children: [
                    TitleComponent.taglineGradient(threeByTwo[index].title),
                    AppServices.addHeight(20),
                    CategoriesLayoutTile.threeByTwo(data.products),
                    AppServices.addHeight(20),
                  ],
                );
              })
            ],

            // 2nd pati banner
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.sp),
              child: Image.asset(AppImages.banner1),
            ),
            AppServices.addHeight(20),

            // 2nd pati banner
            BannerController.smallPattBanner.length >= 2
                ? Column(
                    children: [
                      Image.network(
                        BannerController.smallPattBanner[1],
                        errorBuilder: (context, error, stackTrace) =>
                            Utils.imageError(),
                      ),
                      AppServices.addHeight(20),
                    ],
                  )
                : const SizedBox(),

            // Trending
            if (twoByTwo.isNotEmpty) ...[
              TitleComponent.titleWidgetWithView("Trending"),
              AppServices.addHeight(20),
              CategoriesLayoutTile.twoByTwo(data.products),
              AppServices.addHeight(20),
            ],

            // Electronics
            if (twoByTwoWithList.isNotEmpty) ...[
              TitleComponent.taglineGradient(twoByTwoWithList.first.title),
              AppServices.addHeight(20),
              CategoriesLayoutTile.twoByTwoWithList(data.products),
              AppServices.addHeight(20),
            ],

            // Banner View
            // 2nd pati banner
            BannerController.smallPattBanner.length > 2
                ? Column(
                    children: [
                      Image.network(
                        BannerController.smallPattBanner[2],
                        errorBuilder: (context, error, stackTrace) =>
                            Utils.imageError(),
                      ),
                      AppServices.addHeight(20),
                    ],
                  )
                : const SizedBox(),

            // 2nd pati banner
            BannerController.largeBanner.length >= 2
                ? Column(
                    children: [
                      Image.network(
                        BannerController.largeBanner.first,
                        errorBuilder: (context, error, stackTrace) =>
                            Utils.imageError(),
                      ),
                      AppServices.addHeight(5),
                    ],
                  )
                : const SizedBox(),

// 3 by 3
            if (threeByThree.isNotEmpty) ...[
              TitleComponent.taglineGradient(threeByThree.first.title),
              AppServices.addHeight(10),
              CategoriesLayoutTile.threeByThree(data.products),
              AppServices.addHeight(20),
            ],
            // Explore More

            // Banner
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.sp),
              child: BannerController.animalSupliments.isNotEmpty
                  ? Column(
                      children: [
                        showcarouselslider(BannerController.animalSupliments),
                        AppServices.addHeight(20),
                      ],
                    )
                  : const SizedBox(),
            ),

            // Shop by Brands
            TitleComponent.titleWidgetWithView("Shop by brands"),
            AppServices.addHeight(5),
            const ShowByBrandsView(),
            AppServices.addHeight(30),

            // Products For You
            TitleComponent.taglineGradient("Products For You"),
            AppServices.addHeight(20),
            const ProductsForYouView(),
            AppServices.addHeight(20),
          ],
        ),
      ),
    );
  }

  getData() {
    var data = Get.find<AppData>();
    threeByTwo = data.categories
        .where((element) =>
            element.homepagelayout.contains(CategoryViewType.threeByTwo.name))
        .toList();
    oneByThree = data.categories
        .where((element) =>
            element.homepagelayout.contains(CategoryViewType.oneByThree.name))
        .toList();
    twoByTwo = data.categories
        .where((element) =>
            element.homepagelayout.contains(CategoryViewType.twoByTwo.name))
        .toList();
    twoByTwoWithList = data.categories
        .where((element) => element.homepagelayout
            .contains(CategoryViewType.twoByTwoWithList.name))
        .toList();
    threeByThree = data.categories
        .where((element) =>
            element.homepagelayout.contains(CategoryViewType.threeByThree.name))
        .toList();
  }
}
