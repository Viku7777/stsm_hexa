// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:io';
import 'package:cattel_feed/data/exception/app_exception.dart';
import 'package:cattel_feed/data/network/base_api_services.dart';
import 'package:cattel_feed/view/auth/screens/otp_verification.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NetworkApiServices extends BaseApiServices {
  @override
  Future authbase(String type, data, {bool islogin = false}) async {
    var fauth = FirebaseAuth.instance;
    try {
      if (type.contains("email")) {
        String email = data["email"];
        String password = data["password"];
        if (islogin) {
          UserCredential credential = await fauth.signInWithEmailAndPassword(
              email: email, password: password);
          return credential.user!.uid;
        } else {
          UserCredential credential = await fauth
              .createUserWithEmailAndPassword(email: email, password: password);
          return credential.user!.uid;
        }
      } else {
        dynamic returndata;

        if (type.contains("sendotp")) {
          String mobile = data["mobile"];
          await fauth
              .verifyPhoneNumber(
                phoneNumber: "+91$mobile",
                timeout: const Duration(seconds: 60),
                verificationCompleted: (phoneAuthCredential) {},
                verificationFailed: (error) {
                  // showSnackbar(context, error.message.toString());
                },
                codeSent: (verificationId, forceResendingToken) {
                  OtpverificationScreen.verificationID = verificationId;
                },
                codeAutoRetrievalTimeout: (verificationId) {},
              )
              .onError(
                  (error, stackTrace) => throw Exception(error.toString()));
          return returndata;
        } else {
          String otp = data["otp"];
          print(OtpverificationScreen.verificationID);
          PhoneAuthCredential credential = PhoneAuthProvider.credential(
              verificationId: OtpverificationScreen.verificationID,
              smsCode: otp);
          UserCredential userCredential = await fauth
              .signInWithCredential(credential)
              .onError(
                  (error, stackTrace) => throw Exception(error.toString()));
          bool isnewUser = userCredential.additionalUserInfo!.isNewUser;
          String uid = userCredential.user!.uid;
          returndata = {"isnewUser": isnewUser, "credential": uid};
          return returndata;
        }
      }
    } on SocketException {
      throw InternetException();
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<dynamic> getData(DocumentReference reference) async {
    try {
      var data = await reference.get();
      return data;
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    } on SocketException {
      throw InternetException();
    }
  }

  Future<dynamic> updatefieldData(DocumentReference reference,
      String filedValue, List<dynamic> elements) async {
    try {
      var data = reference
        ..update({filedValue: FieldValue.arrayUnion(elements)});
      return data;
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    } on SocketException {
      throw InternetException();
    }
  }

  Future<dynamic> removefieldData(DocumentReference reference,
      String filedValue, List<dynamic> elements) async {
    try {
      var data = reference
        ..update({filedValue: FieldValue.arrayRemove(elements)});
      return data;
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    } on SocketException {
      throw InternetException();
    }
  }

  @override
  Future postFirestore(reference, data) async {
    try {
      return await reference.set(data);
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    } on SocketException {
      throw InternetException();
    }
  }

  @override
  Future getfirestore(reference) {
    // TODO: implement getfirestore
    throw UnimplementedError();
  }
}
