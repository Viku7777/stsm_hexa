// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:cattel_feed/Helper/nextscreen.dart';
import 'package:cattel_feed/Helper/show_snackbar.dart';
import 'package:cattel_feed/global/global.dart';
import 'package:cattel_feed/model/user_model.dart';
import 'package:cattel_feed/view/screens/auth/screens/createaccounwithphone.dart';
import 'package:cattel_feed/view/screens/auth/screens/otp_verification.dart';
import 'package:cattel_feed/view/screens/bottomNav/bottom_Nav.dart';
import 'package:cattel_feed/view/sf/offline_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

FirebaseAuth fAuth = FirebaseAuth.instance;
CollectionReference fcustomer =
    FirebaseFirestore.instance.collection("customers");
UserModel? createUser;

class AuthApis {
  static Future<void> loginwithEmail(
      String email, String password, BuildContext context) async {
    try {
      UserCredential credential = await fAuth.signInWithEmailAndPassword(
          email: email, password: password);
      DocumentSnapshot snapshot =
          await fcustomer.doc(credential.user!.uid).get();
      UserModel user =
          UserModel.fromJson(snapshot.data() as Map<String, dynamic>);
      await setSFData("loggedInUser", jsonEncode(user.toJson()));
      await setSFData("userAllAddresses", jsonEncode(user.addresses));

      loggedInUserInfo = user;
      nextscreenRemove(context, BottomNavView.routes);
    } on FirebaseAuthException catch (e) {
      showSnackbar(context, e.message.toString());
    }
  }

  static Future<void> signupwithPhone(
      BuildContext context, String name, String phone) async {
    createUser = UserModel(
        uid: "",
        authenticationMethod: "phone",
        name: name,
        isCustomer: true,
        phone: phone,
        createdAt: DateTime.now().toIso8601String(),
        addresses: [],
        devicesToken: []);
    QuerySnapshot snapshot =
        await fcustomer.where("phone", isEqualTo: phone).get();
    if (snapshot.docs.isEmpty) {
      sendOtp(phone, context, islogin: false);
    } else {
      showSnackbar(context, "Your are already logged in with us");
    }
  }

  static Future<void> loginwithPhone(
      String mobile, BuildContext context) async {
    try {
      QuerySnapshot snapshot =
          await fcustomer.where("phone", isEqualTo: mobile).get();
      if (snapshot.docs.isEmpty) {
        // new mobile number
        nextscreenwithargu(context, CreateAccountWithPhone.routes, mobile);
      } else {
        bool isLoggedInMethodPhone = snapshot.docs.first
            .get("authentication_method")
            .toString()
            .contains("phone");

        if (isLoggedInMethodPhone) {
          // logged in with phone
          sendOtp(mobile, context, islogin: true);
        } else {
          nextscreenwithargu(context, CreateAccountWithPhone.routes, mobile);
          // showSnackbar(context, "Your are logged in with another method");
        }
      }
    } on FirebaseAuthException catch (e) {
      showSnackbar(context, e.message.toString());
    }
  }

  static Future<void> sendOtp(String mobile, BuildContext context,
      {bool islogin = false}) async {
    // ignore: avoid_print
    print("------------ send otp--------------");
    await fAuth.verifyPhoneNumber(
      phoneNumber: "+91$mobile",
      timeout: const Duration(seconds: 60),
      verificationCompleted: (phoneAuthCredential) {},
      verificationFailed: (error) {
        showSnackbar(context, error.message.toString());
      },
      codeSent: (verificationId, forceResendingToken) {
        nextscreenwithargu(context, OtpverificationScreen.routes, {
          "verificationId": verificationId,
          "isLogin": islogin,
          "mobileNumber": mobile,
        });
      },
      codeAutoRetrievalTimeout: (verificationId) {},
    );
  }

  static Future<void> verifyOtp(
      String otp, String verificationID, BuildContext context,
      {bool isLoggedIn = false}) async {
    // ignore: avoid_print
    print("------------ verify--------------");

    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationID, smsCode: otp);

      UserCredential userCredential =
          await fAuth.signInWithCredential(credential);
      String uid = userCredential.user!.uid;

      if (isLoggedIn) {
        // logged in with phone
        DocumentSnapshot snapshot = await fcustomer.doc(uid).get();
        UserModel user =
            UserModel.fromJson(snapshot.data() as Map<String, dynamic>);
        await setSFData("loggedInUser", jsonEncode(user.toJson()));
        await setSFData("userAllAddresses", jsonEncode(user.addresses));
        loggedInUserInfo = user;
        nextscreenRemove(context, BottomNavView.routes);
      } else {
        createUser!.uid = uid;
        createProfiles(context, uid, createUser!);
        // sign up with phone
      }

      nextscreenRemove(context, BottomNavView.routes);
    } on FirebaseAuthException catch (e) {
      showSnackbar(context, e.message.toString());
    }
  }

  static Future<void> signupwithEmail(
      String email, String password, String name, BuildContext context) async {
    try {
      QuerySnapshot snapshot =
          await fcustomer.where("email", isEqualTo: email).get();

      if (snapshot.docs.isEmpty) {
        // email not found //
        UserCredential credential = await fAuth.createUserWithEmailAndPassword(
            email: email, password: password);
        UserModel user = UserModel(
            uid: credential.user!.uid,
            authenticationMethod: "email",
            name: name,
            isCustomer: true,
            email: email,
            createdAt: DateTime.now().toIso8601String(),
            addresses: [],
            devicesToken: []);
        await setSFData("loggedInUser", jsonEncode(user.toJson()));
        await createProfiles(context, credential.user!.uid, user);
      } else {
        showSnackbar(context, "Your are already logged in with us");
      }
    } on FirebaseAuthException catch (e) {
      showSnackbar(context, e.message.toString());
    }
  }

  static Future<void> createProfiles(
      BuildContext context, String uid, UserModel userdata) async {
    try {
      await fcustomer.doc(uid).set(userdata.toJson()).then((value) async {
        await setSFData("loggedInUser", jsonEncode(userdata.toJson()));
        // String? data = await getSFData("loggedInUser");
        loggedInUserInfo = userdata;
        nextscreenRemove(context, BottomNavView.routes);
      });
    } catch (e) {
      showSnackbar(context, e.toString());
    }
  }
}
