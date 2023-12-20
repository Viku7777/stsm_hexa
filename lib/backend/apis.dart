import 'dart:io';
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
}
