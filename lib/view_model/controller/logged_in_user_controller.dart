import 'package:cattel_feed/model/user_model/user_model.dart';
import 'package:get/get.dart';

class LoggedInUserController extends GetxController {
  UserModel? userModel;
  bool loggedInUserInfo = false;
  bool isGuestUser = false;

  UserModel get user => userModel!;
  updateUser(UserModel user) {
    userModel = user;
    loggedInUserInfo = true;
    update();
  }
}
