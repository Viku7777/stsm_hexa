import 'package:cattel_feed/data/network/network_api_services.dart';
import 'package:cattel_feed/model/user_model.dart';
import 'package:cattel_feed/resource/const/reference.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthRepository {
  NetworkApiServices apis = NetworkApiServices();
  Future<dynamic> loginwithemail(String email, String password) async {
    var data = {
      "email": email,
      "password": password,
    };
    try {
      dynamic response = await apis.authbase("email", data, islogin: true);
      return response;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<dynamic> createwithemail(String email, String password) async {
    var data = {
      "email": email,
      "password": password,
    };
    try {
      dynamic response = await apis.authbase("email", data, islogin: false);
      return response;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<dynamic> sendotp(String phone) async {
    var data = {
      "mobile": phone,
    };

    try {
      dynamic response = await apis.authbase(
        "sendotp",
        data,
      );
      return response;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<dynamic> verifyOtp(
    String otp,
  ) async {
    try {
      var data = {"otp": otp};
      dynamic response = await apis.authbase(
        "otp",
        data,
      );
      return response;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Map> checkUserAvailableornot(dynamic data) async {
    String method = data['type'];
    String value = data['value'];
    QuerySnapshot snapshot;
    try {
      if (method.contains("email")) {
        snapshot = await CollectionRef.customersReference
            .where("email", isEqualTo: value)
            .get();
      } else {
        snapshot = await CollectionRef.customersReference
            .where("phone", isEqualTo: value)
            .get();
      }
      if (snapshot.docs.isNotEmpty) {
        UserModel user = UserModel.fromJson(
            snapshot.docs.first.data() as Map<String, dynamic>);

        return {"value": value, "method": user.authenticationMethod};
      } else {
        return {"value": value, "method": "notfound"};
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
