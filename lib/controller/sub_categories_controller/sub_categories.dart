import 'package:cattel_feed/model/sub_category.dart';
import 'package:get/get.dart';

class SubCatController extends GetxController {
  late SubCategoriesModel subCategories;
  updateSubCategories(SubCategoriesModel subCat) {
    subCategories = subCat;
    update();
  }
}
