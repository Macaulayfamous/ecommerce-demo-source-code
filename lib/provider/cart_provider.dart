import 'package:flutter/widgets.dart';
import 'package:flutter_ecommerce/models/cart_attr.dart';

class CartProvider with ChangeNotifier {
  Map<String, CartAttr> _cartItems = {};

  Map<String, CartAttr> get getCartItems {
    return {..._cartItems};
  }

  double get totalAmount {
    var total = 0.0;
    _cartItems.forEach((key, value) {
      total += value.price * value.quantity;
    });
    return total;
  }

  void addToCart(
      String productId, double price, String title, String imageUrl) {
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(
        productId,
        (exitingCartIten) => CartAttr(
            id: exitingCartIten.id,
            productId: exitingCartIten.productId,
            title: exitingCartIten.title,
            quantity: exitingCartIten.quantity + 1,
            price: exitingCartIten.price,
            imageUrl: exitingCartIten.imageUrl),
      );
    } else {
      _cartItems.putIfAbsent(
          productId,
          () => CartAttr(
              id: DateTime.now().toString(),
              productId: productId,
              title: title,
              quantity: 1,
              price: price,
              imageUrl: imageUrl));
    }
    notifyListeners();
  }

  void decrementCart(
      String productId, double price, String title, String imageUrl) {
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(
        productId,
        (exitingCartItem) => CartAttr(
            id: DateTime.now().toString(),
            productId: exitingCartItem.productId,
            title: exitingCartItem.title,
            quantity: exitingCartItem.quantity - 1,
            price: exitingCartItem.price.toDouble(),
            imageUrl: exitingCartItem.imageUrl),
      );
    }
    ;
    notifyListeners();
  }

  removeItem(String productId) {
    _cartItems.remove(productId);
    notifyListeners();
  }

  clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
