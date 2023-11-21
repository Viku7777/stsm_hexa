import 'package:cattel_feed/view/screens/account_setting/app_settings/app_settings_view.dart';
import 'package:cattel_feed/view/screens/account_setting/app_settings/edit_profile/user_profile_setting.dart';
import 'package:cattel_feed/view/screens/account_setting/app_settings/language/language_setting_view.dart';
import 'package:cattel_feed/view/screens/account_setting/app_settings/notification_settings/notification_settings_view.dart';
import 'package:cattel_feed/view/screens/account_setting/help_centre/help_view.dart';
import 'package:cattel_feed/view/screens/account_setting/home/account_home.dart';
import 'package:cattel_feed/view/screens/account_setting/my_favorites/favorites.dart';
import 'package:cattel_feed/view/screens/account_setting/my_orders/my_order_view.dart';
import 'package:cattel_feed/view/screens/account_setting/privacy_policy/privacy_policy_view.dart';
import 'package:cattel_feed/view/screens/account_setting/refer_earn/refer_earn_view.dart';
import 'package:cattel_feed/view/screens/address/add_address/add_new_address.dart';
import 'package:cattel_feed/view/screens/address/all_address/all_address.dart';
import 'package:cattel_feed/view/screens/auth/screens/createaccountwithemail.dart';
import 'package:cattel_feed/view/screens/auth/screens/createaccounwithphone.dart';
import 'package:cattel_feed/view/screens/auth/screens/loginwithEmail.dart';
import 'package:cattel_feed/view/screens/auth/screens/loginwithNumber.dart';
import 'package:cattel_feed/view/screens/auth/screens/otp_verification.dart';
import 'package:cattel_feed/view/screens/bottomNav/bottom_Nav.dart';
import 'package:cattel_feed/view/screens/cart_view/cart_view.dart';
import 'package:cattel_feed/view/screens/cart_view/empty_cart.dart';
import 'package:cattel_feed/view/screens/categories/ui/categories_view.dart';
import 'package:cattel_feed/view/screens/homepage/show_rating/reviews_Comments.dart';
import 'package:cattel_feed/view/screens/notification_screens/empty_notification.dart';
import 'package:cattel_feed/view/screens/test.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  "/test": (p0) => const StartUI(),
  // RoutesName.homescreenroute: (p0) => const HomeScreenView(),
  RoutesName.categoiresview: (p0) => const CategoriesView(),
  RoutesName.cart: (p0) => const CartView(),
  AccountHomeView.routes: (p0) => const AccountHomeView(),
  FavoritesItemView.routes: (p0) => const FavoritesItemView(),
  MyOrderView.routes: (p0) => const MyOrderView(),
  ReferEarnView.routes: (p0) => ReferEarnView(),
  AppSettingView.routes: (p0) => const AppSettingView(),
  PrivacyPolicyView.routes: (p0) => const PrivacyPolicyView(),
  HelpView.routes: (p0) => const HelpView(),
  NotificationSettingView.routes: (p0) => const NotificationSettingView(),
  ChangeLanguageView.routes: (p0) => const ChangeLanguageView(),
  UserProfileSettingView.routes: (p0) => const UserProfileSettingView(),
  CreateAccountWithEmail.routes: (p0) => const CreateAccountWithEmail(),
  CreateAccountWithPhone.routes: (p0) => const CreateAccountWithPhone(),
  LoginWithNumber.routes: (p0) => const LoginWithNumber(),
  LoginwithEmailScreen.routes: (p0) => const LoginwithEmailScreen(),
  OtpverificationScreen.routes: (p0) => const OtpverificationScreen(),
  BottomNavView.routes: (p0) => const BottomNavView(),
  AllAddressView.routes: (p0) => const AllAddressView(),
  AddNewAddressView.routes: (p0) => AddNewAddressView(),
  EmptyNotificationView.routes: (p0) => const EmptyNotificationView(),
  ShowAllRatingsView.routes: (p0) => const ShowAllRatingsView(),
  EmptyCartView.routes: (p0) => const EmptyCartView(),
};

class RoutesName {
  static const String start = "/test";
  static const String homescreenroute = "/home";
  static const String categoiresview = "/categories";
  static const String itemdetails = "/itemdetails";
  static const String cart = "/cart";
}
