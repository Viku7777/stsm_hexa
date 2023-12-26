import 'package:cattel_feed/data/network/network_api_services.dart';
import 'package:cattel_feed/model/categories_Model/categorymodel.dart';
import 'package:cattel_feed/model/product_model/product_model.dart';
import 'package:cattel_feed/model/categories_Model/sub_category.dart';
import 'package:cattel_feed/model/user_model/user_model.dart';
import 'package:cattel_feed/resource/const/reference.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseRepository {
  static NetworkApiServices apis = NetworkApiServices();
  static Future<dynamic> createProfile(
    UserModel model,
  ) async {
    try {
      await apis.postFirestore(
          CollectionRef.customersReference.doc(model.uid), model.toJson());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<UserModel?> getUserProfile(
    String uid,
  ) async {
    try {
      var data = await apis.getData(CollectionRef.customersReference.doc(uid));

      if (data.exists) {
        return UserModel.fromJson(data.data() as Map<String, dynamic>);
      } else {
        throw Exception("not found");
      }
    } on FirebaseException catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<QuerySnapshot> getData(
    CollectionReference collection,
  ) async {
    try {
      return await collection.get();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<CategoriesModel>> getCategories() async {
    try {
      var data =
          await FirebaseRepository.getData(CollectionRef.categoiresReference);
      return data.docs
          .map((e) =>
              CategoriesModel.fromJson(e.data() as Map<String, dynamic>, e.id))
          .toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<SubCategoriesModel>> getSubCategories() async {
    try {
      var data = await FirebaseRepository.getData(
          CollectionRef.subcategoiresReference);
      return data.docs
          .map((e) => SubCategoriesModel.fromJson(
              e.data() as Map<String, dynamic>, e.id))
          .toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<ProductModel>> getProducts() async {
    try {
      var data =
          await FirebaseRepository.getData(CollectionRef.productReference);
      return data.docs
          .map((e) =>
              ProductModel.fromJson(e.data() as Map<String, dynamic>, e.id))
          .toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
