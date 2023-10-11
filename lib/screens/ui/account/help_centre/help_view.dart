import 'package:cattel_feed/screens/component/appbar_component.dart';
import 'package:flutter/material.dart';

class HelpView extends StatefulWidget {
  static String routes = "/help";
  const HelpView({super.key});

  @override
  State<HelpView> createState() => _HelpViewState();
}

class _HelpViewState extends State<HelpView> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: customAppbar("Help"),
    );
  }
}