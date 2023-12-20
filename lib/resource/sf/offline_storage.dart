import 'dart:convert';

import 'package:cattel_feed/model/user_model.dart';
import 'package:cattel_feed/view_model/controller/logged_in_user_controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SFStorage {
  static String savedUser = "loggedInUser";
  static String savedFavoriteItemKey = "FavoriteItems";

  static Future<void> setSFData(String key, String data) async {
    var sf = await SharedPreferences.getInstance();
    var controller = Get.find<LoggedInUserController>();
    controller.updateUser(UserModel.fromJson(jsonDecode(data)));
    await sf.setString(key, data);
  }

  static Future<void> setSFList(String key, List<String> data) async {
    var sf = await SharedPreferences.getInstance();
    await sf.setStringList(key, data);
  }

  static Future<List<String>> getSFList(String key) async {
    var sf = await SharedPreferences.getInstance();
    List<String>? data = sf.getStringList(key);
    if (data == null) {
      return [];
    } else {
      return data;
    }
  }

  static Future<String?> getSFData(String key) async {
    var sf = await SharedPreferences.getInstance();
    return sf.getString(key);
  }
}

Future<void> setSFData(String key, String data) async {
  var sf = await SharedPreferences.getInstance();
  await sf.setString(key, data);
}

Future<String?> getSFData(String key) async {
  var sf = await SharedPreferences.getInstance();
  return sf.getString(key);
}
