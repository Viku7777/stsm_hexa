import 'package:cattel_feed/const/colors.dart';
import 'package:cattel_feed/routes/routes.dart';
import 'package:cattel_feed/screens/ui/auth/screens/loginwithNumber.dart';
import 'package:cattel_feed/screens/ui/bottomNav/bottom_Nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';

late Size screenSize;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    screenSize= MediaQuery.of(context).size;
    return ScreenUtilInit(
      designSize: const Size(360,690),
      builder: (context, child) => 
     GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        // theme: ThemeData.light().copyWith(appBarTheme: AppBarTheme(iconTheme: IconThemeData(color: Colors.black))),

        routes: routes,
        // home: const BottomNavView(),
      initialRoute: LoginWithNumber.routes,
      ),
    );
  }
}
