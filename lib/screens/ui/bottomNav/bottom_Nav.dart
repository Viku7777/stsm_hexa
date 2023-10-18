import 'package:cattel_feed/Helper/textstyle.dart';
import 'package:cattel_feed/const/colors.dart';
import 'package:cattel_feed/const/icon.dart';
import 'package:cattel_feed/screens/component/custom_text.dart';
import 'package:cattel_feed/screens/component/icon_with_gradinet.dart';
import 'package:cattel_feed/screens/ui/account_setting/home/account_home.dart';
import 'package:cattel_feed/screens/ui/categories/ui/categories_view.dart';
import 'package:cattel_feed/screens/ui/homepage/home_view/home_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class BottomNavView extends StatefulWidget {
    static String routes = "/bottomnav";

  const BottomNavView({super.key});

  @override
  State<BottomNavView> createState() => _BottomNavViewState();
}

class _BottomNavViewState extends State<BottomNavView> {
  @override
  // ignore: override_on_non_overriding_member
  int currentindex = 0;
  List screens=[
    const HomeScreenView(),
    const CategoriesView(),
    Container(color: Colors.amber,),
         const AccountHomeView(),

    Container(color: Colors.red,),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: InkWell(
        onTap: () => setState(() {
          currentindex=4;
        }),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(color: Colors.grey, blurRadius: 4, spreadRadius: 4)
          ], color: Colors.black, shape: BoxShape.circle),
          child:customIconWithGradient(Icons.shopping_cart_outlined)
        ),
      ),
      bottomNavigationBar: Container(
          height: 65.h,
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.grey, blurRadius: 1, spreadRadius: 4)
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              bottomNavItem(BottomNavIcons.home, "Home", 0),
              bottomNavItem(BottomNavIcons.category, "Category", 1),
              const SizedBox(),
              bottomNavItem(BottomNavIcons.notification, "Notifications", 2),
              bottomNavItem(BottomNavIcons.options, "Options", 3),
            ],
          )),
         
          body: screens[currentindex],
    );
  }

  Widget bottomNavItem(String icon, String name, int index) {
    return InkWell(
      onTap: () => setState(() {
        currentindex = index;
      }),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            icon,
            height: 24.h,
            width: 24.w,
            color:
                index == currentindex ? AppColors.primaryColor : Colors.black,
          ),
          3.h.heightBox,
          customText(name, GetTextTheme.fs10_regular)
        ],
      ),
    );
  }
}
