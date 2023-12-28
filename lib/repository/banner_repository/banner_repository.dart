// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:cattel_feed/data/network/network_api_services.dart';
import 'package:cattel_feed/model/banner_model/banner_model.dart';
import 'package:cattel_feed/resource/utils/utils.dart';
import 'package:cattel_feed/view_model/controller/banner_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BannerRepository {
  static NetworkApiServices apis = NetworkApiServices();
  static BannerController controller = BannerController();

  Future<void> getAllBanners(BuildContext context) async {
    try {
      var data = await apis
          .getCollectionData(FirebaseFirestore.instance.collection("Banner"));

      List<BannerModel> allBanners = data.docs
          .map((e) => BannerModel.fromJson(e.data() as Map<String, dynamic>))
          .toList();
      controller.updateBannerList(allBanners);
    } catch (e) {
      Utils.flushBarErrorMessage(e.toString(), context);
    }
  }
}
