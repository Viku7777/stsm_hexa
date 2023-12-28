// ignore_for_file: use_build_context_synchronously

import 'package:cattel_feed/resource/utils/utils.dart';
import 'package:cattel_feed/view_model/controller/logged_in_user_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:velocity_x/velocity_x.dart';

class NotificationServices {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static Future<void> requestNotification(BuildContext context) async {
    await Permission.notification.request();
    if (await Permission.notification.status == PermissionStatus.denied ||
        await Permission.notification.status ==
            PermissionStatus.permanentlyDenied) {
      Utils.flushBarErrorMessage(
          "Please Allow Notification Permission", context);
    } else {
      var user = Get.find<LoggedInUserController>();
      String? token = await FirebaseMessaging.instance.getToken();
      if (token.isNotEmptyAndNotNull) {
        bool isfind =
            user.userModel!.devicesToken.any((element) => element == token);
        if (!isfind) {
          user.userModel!.devicesToken.add(token!);
          await updateToken(user.userModel!.uid, token);
        }
      }
    }
  }

  static Future<void> initNotification() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('drawable/ic_launcher');
    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );
  }

  static showNotification(String title, body) async {
    final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;

    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      "stsmnotification112",
      'Stsm Notification',
      color: Colors.green,
      channelShowBadge: true,
      channelDescription: 'stsm channel description',
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
    );
    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await flutterLocalNotificationsPlugin
        .show(id, title, body, notificationDetails, payload: 'item x');
  }

  static updateToken(dynamic uid, String token) async {
    await FirebaseFirestore.instance.collection("customers").doc(uid).update({
      "devices_token": FieldValue.arrayUnion([token])
    });
  }
}
