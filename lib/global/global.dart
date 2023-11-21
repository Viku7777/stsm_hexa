import 'package:cattel_feed/model/categorymodel.dart';
import 'package:cattel_feed/model/productsModel.dart';
import 'package:cattel_feed/model/sub_category.dart';
import 'package:cattel_feed/model/user_model.dart';

UserModel? loggedInUserInfo;
String userCurrentAddress = "Unknown Location Found";

class AppConfig {
  static String googleMapKey = "";
}

class FirebaseData {
  static List<CategoiresModel>? categoires;
  static List<SubCategoriesModel>? subcategoires;
  static List<ProductItemModel>? products;
}

String dummyImage =
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQo9D28pzrIQOyEV2C4mq1-3WSkC3JIEQs1AW4h4JgDIVGz8ujABUzheBA1LIfPv7djcK0&usqp=CAU";
