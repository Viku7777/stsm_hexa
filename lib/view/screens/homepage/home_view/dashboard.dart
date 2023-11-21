import 'package:cattel_feed/Helper/base_getters.dart';
import 'package:cattel_feed/Helper/colors.dart';
import 'package:cattel_feed/Helper/icon.dart';
import 'package:cattel_feed/Helper/nextscreen.dart';
import 'package:cattel_feed/Helper/textstyle.dart';
import 'package:cattel_feed/controller/addressController/addressController.dart';
import 'package:cattel_feed/controller/categories_controller.dart/categories_controller.dart';
import 'package:cattel_feed/model/categorymodel.dart';
import 'package:cattel_feed/model/sub_category.dart';
import 'package:cattel_feed/view/component/text_field.dart';
import 'package:cattel_feed/view/screens/account_setting/my_favorites/favorites.dart';
import 'package:cattel_feed/view/screens/address/add_address/add_new_address.dart';
import 'package:cattel_feed/view/screens/address/all_address/all_address.dart';
import 'package:cattel_feed/view/screens/cart_view/cart_view.dart';
import 'package:cattel_feed/view/screens/homepage/home_view/Components/budget_store_view.dart';
import 'package:cattel_feed/view/screens/homepage/home_view/Components/caraousel_slider.dart';
import 'package:cattel_feed/view/screens/homepage/home_view/Components/category_view.dart';
import 'package:cattel_feed/view/screens/homepage/home_view/Components/delivery_banner.dart';
import 'package:cattel_feed/view/screens/homepage/home_view/Components/electronics_view.dart';
import 'package:cattel_feed/view/screens/homepage/home_view/Components/explore_more.dart';
import 'package:cattel_feed/view/screens/homepage/home_view/Components/home_kitchen_view.dart';
import 'package:cattel_feed/view/screens/homepage/home_view/Components/kids_garments.dart';
import 'package:cattel_feed/view/screens/homepage/home_view/Components/mens_budget_store_view.dart';
import 'package:cattel_feed/view/screens/homepage/home_view/Components/other_electronic.dart';
import 'package:cattel_feed/view/screens/homepage/home_view/Components/products_for_you.dart';
import 'package:cattel_feed/view/screens/homepage/home_view/Components/shop_by_brands.dart';
import 'package:cattel_feed/view/screens/homepage/home_view/Components/title_bar.dart';
import 'package:cattel_feed/view/screens/homepage/home_view/Components/trending_widget_view.dart';
import 'package:cattel_feed/view/screens/homepage/home_view/Components/weekly_deals_view.dart';
import 'package:cattel_feed/view/screens/homepage/home_view/Components/women_budget_view.dart';
import 'package:cattel_feed/view/screens/homepage/home_view/Components/discount_view.dart';
import 'package:cattel_feed/view/screens/notification_screens/empty_notification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DashboardScreenView extends StatefulWidget {
  const DashboardScreenView({super.key});

  @override
  State<DashboardScreenView> createState() => _DashboardScreenViewState();
}

class _DashboardScreenViewState extends State<DashboardScreenView> {
  final TextEditingController searchProductController = TextEditingController();
  List<CategoiresModel> categories = [];
  List<SubCategoriesModel> subcategories = [];
  var categoirescontroller = Get.put(AddressController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.whiteColor,
        leadingWidth: 0,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.only(top: 5.h),
          child: Row(
            children: [
              Container(
                  height: 50.h,
                  width: 50.w,
                  margin: EdgeInsets.only(right: 12.w),
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
              nextscreen(context, FavoritesItemView.routes);
            },
            icon: const Icon(Icons.favorite, color: AppColors.blackColor),
          ),
          IconButton(
            onPressed: () {
              nextscreen(context, CartView.route);
            },
            icon: const Icon(Icons.shopping_cart_outlined,
                color: AppColors.blackColor),
          ),
          IconButton(
            onPressed: () {
              nextscreen(context, EmptyNotificationView.routes);
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
            GetBuilder<AddressController>(
              builder: (controller) {
                if (controller.userAllAddresses.isEmpty) {
                  return InkWell(
                      onTap: () =>
                          nextscreen(context, AddNewAddressView.routes),
                      child: TitleComponent.locationTitleComponent());
                }
                return const SizedBox();
              },
            ),
            AppServices.addHeight(10),

            Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: CustomTextfield(
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
            GetBuilder<CategoriesController>(
              builder: (controller) {
                return controller.allCategories.isEmpty
                    ? const SizedBox()
                    : const DashboardCategoryView();
              },
            ),
            AppServices.addHeight(5),

            // Discount View
            // This Widget show discounts view on the dashboard
            const DiscountView(),
            AppServices.addHeight(15),

            // Ads Banner
            showcarouselslider(),
            AppServices.addHeight(20),

            // Weekly Top Deals
            TitleComponent.titleWidgetWithView("Weekly Top Deals"),
            AppServices.addHeight(10),
            const WeeklyDealsView(),
            AppServices.addHeight(30),

            // Kids Garments
            TitleComponent.taglineGradient("Kids Garments & Accessories"),
            AppServices.addHeight(20),
            const KidsGarmentsView(),
            AppServices.addHeight(20),

            // Banner
            Image.asset(AppImages.banner2),
            AppServices.addHeight(5),

            // Delivery Banner
            const DeliveryBannerView(),
            AppServices.addHeight(20),

            // Budget Store
            const BudgetStoreView(),
            AppServices.addHeight(20),
            TitleComponent.taglineGradient("Men’s Budget Store"),
            AppServices.addHeight(20),

            // Mens Budget Store
            const MensBudgetStoreView(),
            AppServices.addHeight(20),
            TitleComponent.taglineGradient("Womens Budget Store"),
            AppServices.addHeight(20),

            // Womens Budget Store
            const WomenBudgetStoreView(),
            AppServices.addHeight(20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.sp),
              child: Image.asset(AppImages.banner1),
            ),
            AppServices.addHeight(20),

            // Home & Kitchen
            TitleComponent.taglineGradient("Home & Kitchen"),
            AppServices.addHeight(20),
            const HomeAndKitchenView(),
            AppServices.addHeight(20),

            // Banner
            Image.asset(AppImages.banner2),
            AppServices.addHeight(20),

            // Trending
            TitleComponent.titleWidgetWithView("Trending"),
            AppServices.addHeight(20),
            const TrendingWidgetView(),
            AppServices.addHeight(20),

            // Electronics
            TitleComponent.taglineGradient("Electronics"),
            AppServices.addHeight(20),
            Stack(
              children: [
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: 400.h,
                    width: Get.width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          const Color(0xffFFFFFF),
                          const Color.fromARGB(255, 250, 214, 135)
                              .withOpacity(0.1),
                        ],
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    const ElectronicsStoreView(),
                    AppServices.addHeight(20),
                    const OtherElectronicView(),
                  ],
                )
              ],
            ),
            AppServices.addHeight(20),

            // Banner View
            Image.asset(AppImages.banner2),
            AppServices.addHeight(20),
            Image.network(
                "https://img.freepik.com/free-vector/mega-sale-purple-abstract-background-professional-multipurpose-design-banner_1340-17419.jpg?w=2000"),
            AppServices.addHeight(5),

            // Explore More
            TitleComponent.taglineGradient("Explore More"),
            AppServices.addHeight(10),
            const ExploreMoreView(),
            AppServices.addHeight(20),

            // Banner
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.sp),
              child: Image.asset(AppImages.banner1),
            ),
            AppServices.addHeight(20),

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
}
