import 'package:flutter/material.dart';
import 'package:small_shop/feature/HomePage/data/model/product_model.dart';
import 'package:small_shop/feature/cartPage/data/model/cart_model.dart';

class CartProvider extends ChangeNotifier {
  List<CartModel> items = [];

  double get totalPrice {
    double sum = 0;
    for (final item in items) {
      sum += (item.product.price ?? 0) * item.quantity;
    }
    return sum;
  }

  void addProduct(Product product, int quantity) {
    final index = items.indexWhere((item) => item.product.id == product.id);
    if (index == -1) {
      items.add(CartModel(product: product, quantity: quantity));
    } else {
      items[index].quantity += quantity;
    }
    notifyListeners();
  }

  void increaseQuantity(CartModel item) {
    item.quantity++;
    notifyListeners();
  }

  void decreaseQuantity(CartModel item) {
    item.quantity--;
    notifyListeners();
  }

  void removeProduct(Product product) {
    final index = items.indexWhere((item) => item.product.id == product.id);
    if (index != -1) {
      items.removeAt(index);
    }
    notifyListeners();
  }

  void clearCart() {
    items.clear();
  }
}
