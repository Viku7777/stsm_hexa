// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:cattel_feed/firebase_options.dart';
import 'package:cattel_feed/language/language.dart';
import 'package:cattel_feed/resource/const/colors.dart';
import 'package:cattel_feed/resource/const/routes.dart';
import 'package:cattel_feed/resource/sf/offline_storage.dart';
import 'package:cattel_feed/services/firebase_Analytics_services.dart';
import 'package:cattel_feed/view_model/controller/address_controller.dart';
import 'package:cattel_feed/view_model/controller/app_data_controller.dart';
import 'package:cattel_feed/view_model/controller/auth_controller.dart';
import 'package:cattel_feed/view_model/controller/cart_controller.dart';
import 'package:cattel_feed/view_model/controller/item_detail_view_controller.dart';
import 'package:cattel_feed/view_model/controller/item_favorite.dart';
import 'package:cattel_feed/view_model/controller/logged_in_user_controller.dart';
import 'package:cattel_feed/view_model/controller/order_controller.dart';
import 'package:cattel_feed/view_model/controller/splash_controller.dart';
import 'package:cattel_feed/view_model/controller/sub_categories_controller.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

late Size screenSize;
String languageCode = "en";
String languageCountryCode = "IN";
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseAnalyticsServices().initServices();
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  String? _languagecode = await SFStorage.getSFData("deviceLanguageCode");
  String? _countryCode = await SFStorage.getSFData("deviceLanguageCountry");
  if (_languagecode.isNotEmptyAndNotNull && _countryCode.isNotEmptyAndNotNull) {
    languageCode = _languagecode!;
    languageCountryCode = _countryCode!;
  }

  runApp(const MyApp());
  // runApp(
  //   DevicePreview(
  //     enabled: true,
  //     builder: (context) => const MyApp(), // Wrap your app
  //   ),
  // );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      splitScreenMode: false,
      builder: (context, child) => GetMaterialApp(
        useInheritedMediaQuery: true,
        locale: Locale(languageCode, languageCountryCode),
        fallbackLocale: const Locale("en", "US"),
        translations: Languages(),
        builder: DevicePreview.appBuilder,
        getPages: getPagesRoutes,
        initialBinding: InitBinding(),
        title: 'STSM',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
            scaffoldBackgroundColor: AppColors.whiteColor,
            appBarTheme: const AppBarTheme(
                iconTheme: IconThemeData(color: Colors.black))),
      ),
    );
  }
}

class InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    Get.put(AppData());
    Get.put(LoggedInUserController());
    Get.put(ItemDetailsViewController());
    Get.put(FavoriteItemController());
    Get.put(SplashController());
    Get.put(NewCartController());
    Get.put(OrderController());
    Get.put(SubCategoriesController());
    Get.put(UserAddressController());
  }
}
