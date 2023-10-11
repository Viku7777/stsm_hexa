import 'package:cattel_feed/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360,690),
      builder: (context, child) => 
     GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          iconTheme: const IconThemeData(color: Colors.white),
          appBarTheme:  const AppBarTheme(
      
            actionsIconTheme: IconThemeData(color: Color.fromARGB(255, 17, 15, 15)),
            iconTheme: IconThemeData(color: Colors.black),
            titleTextStyle: TextStyle(color: Colors.black),
            backgroundColor: Colors.white),
        ),
        routes: routes,
        initialRoute: RoutesName.homescreenroute,
      ),
    );
  }
}
