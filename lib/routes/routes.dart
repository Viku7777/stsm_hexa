

import 'package:cattel_feed/screens/ui/account/app_settings/app_settings_view.dart';
import 'package:cattel_feed/screens/ui/account/help_centre/help_view.dart';
import 'package:cattel_feed/screens/ui/account/home/account_home.dart';
import 'package:cattel_feed/screens/ui/account/my_favorites/favorites.dart';
import 'package:cattel_feed/screens/ui/account/my_orders/my_order_view.dart';
import 'package:cattel_feed/screens/ui/account/privacy_policy/privacy_policy_view.dart';
import 'package:cattel_feed/screens/ui/account/refer_earn/refer_earn_view.dart';
import 'package:cattel_feed/screens/ui/cart_view/cart_view.dart';
import 'package:cattel_feed/screens/ui/categories/ui/categories_view.dart';
import 'package:cattel_feed/screens/ui/homepage/home_view/home_screen_view.dart';
import 'package:cattel_feed/screens/ui/homepage/item_List/item_list_screen.dart';
import 'package:cattel_feed/screens/ui/homepage/item_details/item_details.dart';
import 'package:cattel_feed/screens/ui/test.dart';
import 'package:flutter/material.dart';

Map<String,Widget Function(BuildContext)> routes={
  "/test":(p0) => const StartUI(),
RoutesName.homescreenroute:(p0) => const HomeScreenView(),
RoutesName.categoiresview :(p0) => const CategoriesView(),
RoutesName.itemlist:(p0) => const ItemlistScreen(),
RoutesName.itemdetails:(p0) =>  ItemDetailsView(id: ""),
RoutesName.cart:(p0) =>  const CartView(),
AccountHomeView.routes:(p0) => const AccountHomeView(),
FavoritesItemView.routes:(p0) => FavoritesItemView(),
MyOrderView.routes:(p0) => MyOrderView(),
ReferEarnView.routes:(p0) => ReferEarnView(),
AppSettingView.routes:(p0) => AppSettingView(),
PrivacyPolicyView.routes:(p0) => PrivacyPolicyView(),
HelpView.routes:(p0) => HelpView()
};

class RoutesName{
  static const String start= "/test";
 static const String homescreenroute="/home";
 static const String categoiresview = "/categories";
 static const String itemlist = "/itemlist";
 static const String itemdetails = "/itemdetails";
 static const String cart = "/cart";

}