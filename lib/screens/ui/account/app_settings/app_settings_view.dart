import 'package:cattel_feed/screens/component/appbar_component.dart';
import 'package:flutter/material.dart';

class AppSettingView extends StatefulWidget {
  static String routes = "/app_setting"; 
  const AppSettingView({super.key});

  @override
  State<AppSettingView> createState() => _AppSettingViewState();
}

class _AppSettingViewState extends State<AppSettingView> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: customAppbar("App Settings"),
    );
  }
}