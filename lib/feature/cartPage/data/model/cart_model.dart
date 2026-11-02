import 'package:small_shop/feature/HomePage/data/model/product_model.dart';

class CartModel {
  final Product product;
  int quantity;

  CartModel({required this.product, this.quantity = 1});
}
