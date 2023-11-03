import 'package:cattel_feed/view/component/appbar_component.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyView extends StatelessWidget {
  static String routes = "'account_&_settings/privacy_policy";

  const PrivacyPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar("Privacy Policy"),
    );
  }
}
