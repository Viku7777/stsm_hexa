import 'dart:io';

import 'package:cattel_feed/global/global.dart';
import 'package:cattel_feed/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

FirebaseStorage fStorage = FirebaseStorage.instance;

class FirebaseApis {
  static Future<String> uploadImageOnFirebase(
      File uploadImage, String path) async {
    try {
      var imageName = DateTime.now().millisecondsSinceEpoch.toString();
      var storageRef =
          FirebaseStorage.instance.ref().child('$path/$imageName.jpg');
      var uploadTask = storageRef.putFile(uploadImage);
      return await (await uploadTask).ref.getDownloadURL();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<void> updateuserDetails(UserModel data) async {
    return FirebaseFirestore.instance
        .collection("customers")
        .doc(loggedInUserInfo!.uid)
        .update(data.toJson());
  }
}
