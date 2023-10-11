import 'package:cattel_feed/screens/component/appbar_component.dart';
import 'package:flutter/material.dart';

class MyOrderView extends StatefulWidget {
  static String routes = "/my_order";
  const MyOrderView({super.key});

  @override
  State<MyOrderView> createState() => _MyOrderViewState();
}

class _MyOrderViewState extends State<MyOrderView> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: customAppbar("My Orders"),
    );
  }
}