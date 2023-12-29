import 'package:cattel_feed/model/cart_model/cart_product_model.dart';
import 'package:get/get.dart';

class NewCartController extends GetxController {
  List<CartProductModel> cartItems = [];
  updateCartItem(List<CartProductModel> cart) {
    cartItems = cart;
    update();
  }

  updateNewCartItem(CartProductModel cartProduct) {
    if (cartItems.isEmpty) {
      cartItems.add(cartProduct);
    } else {
      for (var element in cartItems) {}
    }
  }
}
