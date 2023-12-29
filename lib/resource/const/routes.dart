import 'package:cattel_feed/view/auth/screens/createaccountwithemail.dart';
import 'package:cattel_feed/view/auth/screens/createaccounwithphone.dart';
import 'package:cattel_feed/view/auth/screens/loginwithEmail.dart';
import 'package:cattel_feed/view/auth/screens/loginwithNumber.dart';
import 'package:cattel_feed/view/auth/screens/otp_verification.dart';
import 'package:cattel_feed/view/account_setting/app_settings/app_settings_view.dart';
import 'package:cattel_feed/view/account_setting/app_settings/edit_profile/user_profile_setting.dart';
import 'package:cattel_feed/view/account_setting/app_settings/language/language_setting_view.dart';
import 'package:cattel_feed/view/account_setting/app_settings/notification_settings/notification_settings_view.dart';
import 'package:cattel_feed/view/account_setting/help_centre/help_view.dart';
import 'package:cattel_feed/view/account_setting/my_favorites/favorites.dart';
import 'package:cattel_feed/view/account_setting/my_orders/my_order_view.dart';
import 'package:cattel_feed/view/account_setting/privacy_policy/privacy_policy_view.dart';
import 'package:cattel_feed/view/account_setting/refer_earn/refer_earn_view.dart';
import 'package:cattel_feed/view/address/add_address/add_new_address.dart';
import 'package:cattel_feed/view/address/all_address/all_address.dart';
import 'package:cattel_feed/view/bottomNav/bottom_Nav.dart';
import 'package:cattel_feed/view/cart_view/cart_view.dart';
import 'package:cattel_feed/view/homepage/search_view/search_view.dart';
import 'package:cattel_feed/view/notification_screens/empty_notification.dart';
import 'package:cattel_feed/view/splash_screen/splash_screen.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? getPagesRoutes = [
  GetPage(
    name: LoginWithNumber.routes,
    page: () => const LoginWithNumber(),
  ),
  GetPage(
    name: LoginwithEmailScreen.routes,
    page: () => const LoginwithEmailScreen(),
  ),
  GetPage(
    name: BottomNavView.routes,
    page: () => const BottomNavView(),
  ),
  GetPage(
    name: FavoritesItemView.routes,
    page: () => const FavoritesItemView(),
  ),
  GetPage(
    name: CreateAccountWithEmail.routes,
    page: () => const CreateAccountWithEmail(),
  ),
  GetPage(
    name: CreateAccountWithPhone.routes,
    page: () => const CreateAccountWithPhone(),
  ),
  GetPage(
    name: OtpverificationScreen.routes,
    page: () => const OtpverificationScreen(),
  ),
  GetPage(
    name: "/",
    page: () => const SplashScreenView(),
  ),
  GetPage(
    name: MyOrderView.routes,
    page: () => const MyOrderView(),
  ),
  GetPage(name: ReferEarnView.routes, page: () => ReferEarnView()),
  GetPage(
    name: AppSettingView.routes,
    page: () => const AppSettingView(),
  ),
  GetPage(
    name: PrivacyPolicyView.routes,
    page: () => const PrivacyPolicyView(),
  ),
  GetPage(
    name: HelpView.routes,
    page: () => const HelpView(),
  ),
  GetPage(
    name: UserProfileSettingView.routes,
    page: () => const UserProfileSettingView(),
  ),
  GetPage(
    name: ChangeLanguageView.routes,
    page: () => const ChangeLanguageView(),
  ),
  GetPage(
    name: NotificationSettingView.routes,
    page: () => const NotificationSettingView(),
  ),
  GetPage(
    name: EmptyNotificationView.routes,
    page: () => const EmptyNotificationView(),
  ),
  GetPage(
    name: AddNewAddressView.routes,
    page: () => AddNewAddressView(),
  ),
  GetPage(
    name: AllAddressView.routes,
    page: () => const AllAddressView(),
  ),
  GetPage(
    name: SearchView.routes,
    page: () => const SearchView(),
  ),
  // GetPage(
  //   name: CartView.route,
  //   page: () => const CartView(),
  // )
];
