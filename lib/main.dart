import 'package:cattel_feed/resource/const/colors.dart';
import 'package:cattel_feed/firebase_options.dart';
import 'package:cattel_feed/resource/const/routes.dart';
import 'package:cattel_feed/services/notification_services.dart';
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
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

late Size screenSize;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);

  NotificationServices.initNotification();
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    NotificationServices.showNotification(
        message.notification!.title.toString(),
        message.notification!.body.toString());
  });
  FirebaseMessaging.onMessageOpenedApp.listen((event) {
    if (kDebugMode) {
      print("recive a on app notification");
    }
  });

  runApp(const MyApp()
      // DevicePreview(
      //   enabled: false,
      //   builder: (context) => const MyApp(), // Wrap your app
      // ),
      );
}

@pragma('vm:entry-point')
Future backgroundHandler(RemoteMessage message) async {
  if (kDebugMode) {
    print("recive a background notification");
  }
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
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        getPages: getPagesRoutes,
        initialBinding: InitBinding(),
        title: 'Flutter Demo',
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
    Get.put(OrderController());
    Get.put(NewCartController());
    Get.put(SubCategoriesController());
    Get.put(UserAddressController());
  }
}








/* key 

storePassword=Rohitv
keyPassword=Rohitv
keyAlias=upload
storeFile=key/upload-keystore.jks

*/