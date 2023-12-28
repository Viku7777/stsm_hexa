import 'package:cattel_feed/model/categories_Model/categorymodel.dart';
import 'package:cattel_feed/model/product_model/product_model.dart';
import 'package:cattel_feed/model/categories_Model/sub_category.dart';
import 'package:cattel_feed/resource/utils/utils.dart';
import 'package:get/get.dart';

class AppData extends GetxController {
  late List<CategoriesModel> categories;
  late List<SubCategoriesModel> subCategories;
  late List<ProductModel> products;
  late List<ProductModel> productsforyou;
  late List<ProductModel> weeklyproduct;
  int currentScreenIndex = 0;

  updateCategories(List<CategoriesModel> newcategorieslist) {
    categories = newcategorieslist;
    categories.removeWhere((element) => element.status == "hidden");
    update();
  }

  updateSubCategories(List<SubCategoriesModel> newsubcategorieslist) {
    subCategories = newsubcategorieslist;
    subCategories.removeWhere((element) => element.status == "hidden");
    update();
  }

  updateProducts(List<ProductModel> newproductlist) {
    products = newproductlist;
    weeklyproduct = newproductlist;
    products.removeWhere((element) => element.status == "hidden");
    weeklyproduct = Utils.sortPrice(weeklyproduct);

    update();
  }

  updateScreenIndex(int index) {
    currentScreenIndex = index;
    update();
  }
}
