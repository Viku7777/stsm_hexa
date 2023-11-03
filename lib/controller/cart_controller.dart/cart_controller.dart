import 'package:cattel_feed/model/cart_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  List<CartModel> cartItems = [];

  addItemInCart(String id) {
    bool isExist = cartItems.any((element) => element.itemID == id);
    isExist ? increaseQuantity(id) : cartItems.add(CartModel(id, 1));
    update();
  }

  increaseQuantity(String itemId) {
    int index = cartItems.indexWhere((element) => element.itemID == itemId);
    cartItems[index].quantity += 1;
  }

  decreaseQuantity(String itemid) {
    int index = cartItems.indexWhere((element) => element.itemID == itemid);
    if (cartItems[index].quantity > 1) {
      cartItems[index].quantity -= 1;
      update();
    } else {
      cartItems.removeAt(index);
      update();
    }
  }

  deleteItem(String itemId) {
    int index = cartItems.indexWhere((element) => element.itemID == itemId);
    cartItems.removeAt(index);
    update();
  }
}
