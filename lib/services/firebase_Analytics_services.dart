// ignore_for_file: file_names

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class FirebaseAnalyticsServices {
  FirebaseAnalytics fAnalytics = FirebaseAnalytics.instance;
  initServices() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();

      FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);
    } catch (e) {
      if (kDebugMode) {
        print("Failed to initialize Firebase: $e");
      }
    }

    await fAnalytics.setAnalyticsCollectionEnabled(true);
  }

  customEvent(String eventName, Map<String, Object?>? data) async {
    await fAnalytics.logEvent(name: eventName, parameters: data);
  }
}
