import 'package:cattel_feed/routes/routes.dart';
import 'package:cattel_feed/Helper/nextscreen.dart';
import 'package:flutter/material.dart';

class StartUI extends StatefulWidget {
  const StartUI({super.key});

  @override
  State<StartUI> createState() => _StartUIState();
}

class _StartUIState extends State<StartUI> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        nextscreen(context, RoutesName.homescreenroute);
      }),
      appBar: AppBar(),
    );
  }
}
