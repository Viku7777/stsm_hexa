import 'package:cattel_feed/model/address_model/addressModel.dart';
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
}
