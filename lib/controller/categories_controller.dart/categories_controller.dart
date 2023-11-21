import 'package:cattel_feed/model/categorymodel.dart';
import 'package:get/get.dart';

class CategoriesController extends GetxController {
  List<CategoiresModel> allCategories = [];
  updateCategories(List<CategoiresModel> categoires) {
    allCategories = categoires;
    update();
  }
}
