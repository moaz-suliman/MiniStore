import 'package:small_shop/feature/HomePage/data/model/product_model.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts();
}
