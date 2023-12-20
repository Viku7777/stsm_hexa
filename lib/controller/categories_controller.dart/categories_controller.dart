import 'package:cattel_feed/model/categorymodel.dart';
import 'package:get/get.dart';

class CategoriesController extends GetxController {
  List<OldCategoiresModel> allCategories = [];
  updateCategories(List<OldCategoiresModel> categoires) {
    allCategories = categoires;
    update();
  }
}
