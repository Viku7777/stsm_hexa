import 'package:cattel_feed/model/sub_category.dart';
import 'package:get/get.dart';

class SubCatController extends GetxController {
  late OldSubCategoriesModel subCategories;
  updateSubCategories(OldSubCategoriesModel subCat) {
    subCategories = subCat;
    update();
  }
}
