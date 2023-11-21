import 'package:cattel_feed/global/global.dart';
import 'package:cattel_feed/model/addressModel.dart';
import 'package:cattel_feed/view/screens/auth/apis/apis.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class AddressApis {
  static Future<Coordinates> userCurrentLatLng() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return Coordinates(position.latitude, position.longitude);
  }

  static Future<Address> latlngConvertIntoAddress(Coordinates position) async {
    var address = await Geocoder.local.findAddressesFromCoordinates(
        Coordinates(position.latitude, position.longitude));
    return address.first;
  }

  static Future<Coordinates> convertAddressIntoLatlnf(var qurey) async {
    var address = await Geocoder.local.findAddressesFromQuery(qurey);
    return address.first.coordinates;
  }

  static Future<PermissionStatus> requestPermission(
      Permission permissiontype) async {
    PermissionStatus status = await permissiontype.request();
    return status;
  }

  static Future<void> uploadUserLocationonFirebase(AddressModel address) async {
    await fcustomer.doc(loggedInUserInfo!.uid).update({
      "addresses": FieldValue.arrayUnion([address.toJson()])
    });
  }

  static Future<void> editAddress(List<AddressModel> addresses) async {
    List data = addresses.map((e) => e.toJson()).toList();
    await fcustomer.doc(loggedInUserInfo!.uid).update({
      "addresses": data,
    });
  }
}
