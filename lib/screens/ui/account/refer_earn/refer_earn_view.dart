import 'package:cattel_feed/screens/component/appbar_component.dart';
import 'package:flutter/material.dart';

class ReferEarnView extends StatelessWidget {
      static String routes = "/refer_earn";

  const ReferEarnView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: customAppbar("Refer & Earn"),
    );
  }
}