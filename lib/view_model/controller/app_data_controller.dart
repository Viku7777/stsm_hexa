import 'package:cattel_feed/model/categories_Model/categorymodel.dart';
import 'package:cattel_feed/model/product_model/product_model.dart';
import 'package:cattel_feed/model/categories_Model/sub_category.dart';
import 'package:cattel_feed/model/service_area_model/services_model.dart';
import 'package:cattel_feed/resource/utils/utils.dart';
import 'package:get/get.dart';

class AppData extends GetxController {
  late List<CategoriesModel> categories;
  late List<SubCategoriesModel> subCategories;
  late List<ProductModel> products;
  late List<ProductModel> productsforyou;
  late List<ProductModel> weeklyproduct;
  late List<ServiceAreaModel> servicesArea;
  String searchPinCode = "";
  int currentScreenIndex = 0;

  updateCategories(List<CategoriesModel> newcategorieslist) {
    categories = newcategorieslist;
    categories.removeWhere((element) => element.status == "hidden");
    update();
  }

  searcPinCode(String pincode) {
    searchPinCode = pincode;
    update();
  }

  updateServicesArea(List<ServiceAreaModel> area) {
    servicesArea = area;
    area.removeWhere((element) => element.serviceStatus != "live");

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
    products.removeWhere((element) =>
        element.status == "hidden" ||
        !categories.any((e) => e.id == element.categories!.parentId) ||
        !subCategories.any((e) => e.id == element.categories!.id));

    weeklyproduct = Utils.sortPrice(weeklyproduct);

    update();
  }

  updateScreenIndex(int index) {
    currentScreenIndex = index;
    update();
  }
}
