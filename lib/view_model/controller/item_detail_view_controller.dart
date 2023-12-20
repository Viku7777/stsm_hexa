import 'package:cattel_feed/model/product_model/product_model.dart';
import 'package:get/get.dart';

class ItemDetailsViewController extends GetxController {
  late Varients currentVarients;
  updateVarient(Varients newVarient) {
    currentVarients = newVarient;
    update();
  }
}
