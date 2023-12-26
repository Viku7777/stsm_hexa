import 'package:cattel_feed/model/categories_Model/sub_category.dart';
import 'package:cattel_feed/view_model/controller/app_data_controller.dart';
import 'package:get/get.dart';

class SubCategoriesController extends GetxController {
  List<SubCategoriesModel> subCategories = [];
  late SubCategoriesModel currentSubCategories;

  updateSubCategoriesList(String categoriesId) {
    var controller = Get.find<AppData>();
    subCategories = controller.subCategories
        .where((element) => element.catID == categoriesId)
        .toList();
    if (subCategories.isNotEmpty) {
      currentSubCategories = subCategories.first;
    }
    update();
  }

  updateCurrentSubcategories(SubCategoriesModel subcat) {
    currentSubCategories = subcat;
    update();
  }
}
