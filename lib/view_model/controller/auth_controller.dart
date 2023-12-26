// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:cattel_feed/data/network/network_api_services.dart';
import 'package:cattel_feed/model/user_model/user_model.dart';
import 'package:cattel_feed/repository/auth_repository/auth_repository.dart';
import 'package:cattel_feed/repository/firebase_repository/firebase_repository.dart';
import 'package:cattel_feed/resource/sf/offline_storage.dart';
import 'package:cattel_feed/resource/utils/utils.dart';
import 'package:cattel_feed/view/auth/screens/createaccounwithphone.dart';
import 'package:cattel_feed/view/auth/screens/otp_verification.dart';
import 'package:cattel_feed/view/bottomNav/bottom_Nav.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  bool loading = false;
  updateLoadingstatus() {
    loading = !loading;
    update();
  }

  NetworkApiServices networkapi = NetworkApiServices();

  AuthRepository authapis = AuthRepository();
  Future<dynamic> loginwithEmail(
      String email, password, BuildContext context) async {
    updateLoadingstatus();
    authapis.loginwithemail(email, password).then((value) {
      FirebaseRepository.getUserProfile(value).then((v) async {
        await SFStorage.setSFData(SFStorage.savedUser, jsonEncode(v!.toJson()));
        Get.offAll(const BottomNavView());
        updateLoadingstatus();
      }).onError((error, stackTrace) {
        updateLoadingstatus();
        Utils.flushBarErrorMessage(error.toString(), context);
      });
    }).onError((error, stackTrace) {
      updateLoadingstatus();
      Utils.flushBarErrorMessage(error.toString(), context);
    });
  }

  Future<void> createAccountWithEmail(
      String email, password, String name, BuildContext context) async {
    updateLoadingstatus();
    var user = await authapis
        .checkUserAvailableornot({"value": email, "type": "email"});

    if (user["method"].contains("phone")) {
      Utils.flushBarErrorMessage(
          "your are already logged in with another method", context);
      updateLoadingstatus();
    } else if (user["method"].contains("email")) {
      Utils.flushBarErrorMessage(
          "your are already logged in with with us", context);
      updateLoadingstatus();
    } else {
      authapis.createwithemail(email, password).then((value) async {
        UserModel model = UserModel(
            uid: value,
            authenticationMethod: "email",
            name: name,
            email: email,
            isCustomer: true,
            createdAt: DateTime.now().toIso8601String(),
            addresses: [],
            devicesToken: []);

        await FirebaseRepository.createProfile(model).then((value) async {
          await SFStorage.setSFData(
              SFStorage.savedUser, jsonEncode(model.toJson()));

          Get.offAll(const BottomNavView());

          updateLoadingstatus();
        }).onError((error, stackTrace) {
          updateLoadingstatus();
          Utils.flushBarErrorMessage(error.toString(), context);
        });
      }).onError((error, stackTrace) {
        updateLoadingstatus();
        throw Exception(error);
      });
    }
  }

  Future<dynamic> sendOtp(
    String phoneNumber,
    BuildContext context,
  ) async {
    updateLoadingstatus();
    authapis.sendotp(phoneNumber).then((value) {
      updateLoadingstatus();
      return value;
    }).onError((error, stackTrace) {
      updateLoadingstatus();
      Utils.flushBarErrorMessage(error.toString(), context);
    });
  }

  Future<void> verifyOtp(String otp, BuildContext context, bool isCreateProfile,
      String name, String number) async {
    updateLoadingstatus();
    authapis.verifyOtp(otp).then((value) async {
      String credential = value["credential"];
      if (OtpverificationScreen.isCreateProfile) {
        UserModel model = UserModel(
            uid: credential,
            authenticationMethod: "phone",
            name: name,
            phone: number,
            isCustomer: true,
            createdAt: DateTime.now().toIso8601String(),
            addresses: [],
            devicesToken: []);

        await FirebaseRepository.createProfile(model).then((value) async {
          await SFStorage.setSFData(
              SFStorage.savedUser, jsonEncode(model.toJson()));
          Get.offAll(const BottomNavView());
          updateLoadingstatus();
        }).onError((error, stackTrace) {
          updateLoadingstatus();
          Utils.flushBarErrorMessage(error.toString(), context);
        });
      } else {
        FirebaseRepository.getUserProfile(credential).then((value) async {
          // await SFStorage.setSFData(
          //     SFStorage.savedUser, jsonEncode(value!.toJson()));
          Get.offAll(const BottomNavView());
          updateLoadingstatus();
        }).onError((error, stackTrace) {
          updateLoadingstatus();
          Utils.flushBarErrorMessage(error.toString(), context);
        });
      }
    }).onError((error, stackTrace) {
      updateLoadingstatus();
      Utils.flushBarErrorMessage(error.toString(), context);
    });
  }

  Future<dynamic> checkUser(dynamic data, BuildContext context) async {
    updateLoadingstatus();
    authapis.checkUserAvailableornot(data).then((v) {
      updateLoadingstatus();
      String val = v["value"];
      String meth = v["method"];
      if (meth.contains("notfound")) {
        Get.toNamed(CreateAccountWithPhone.routes, arguments: val);
      } else {
        if (meth.contains("email")) {
          Utils.flushBarErrorMessage(
              "your are already logged in with another method", context);
        } else {
          sendOtp(val, context).then((value) =>
              Get.toNamed(OtpverificationScreen.routes, arguments: val));
        }
      }
    }).onError((error, stackTrace) {
      updateLoadingstatus();
      Utils.flushBarErrorMessage(error.toString(), context);
    });
  }
}
