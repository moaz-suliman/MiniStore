import 'package:flutter/material.dart';
import 'package:small_shop/feature/HomePage/data/model/product_model.dart';
import 'package:small_shop/feature/HomePage/data/repositories/product_repository.dart';
import 'package:small_shop/core/app_state/app_state.dart';

class ProductProvider extends ChangeNotifier {
  final ProductRepository repository;
  ProductProvider(this.repository);

  List<Product> products = [];
  List<Product> filterdProducts = [];
  String errorMessage = '';
  AppState state = AppState.load;
  bool isSearching = false;
  int productPageDetailsQuantity=1;
  void startSearch() {
    isSearching = true;
    notifyListeners();
  }

  void productPageDetailsQuantityIncreese(){
    productPageDetailsQuantity++;
    notifyListeners();
  }
  void productPageDetailsQuantityDecreese(){
    productPageDetailsQuantity--;
    notifyListeners();
  }

   
  // If the user stops searching, call searchProduct with an empty query string to retrieve all products
  void stopSearch() {
    isSearching = false;
    searchProduct('');
    notifyListeners();
  }

  List<Product> searchProduct(String text) {
    final text2 = text.toLowerCase().trim();
    if (text2.isEmpty) {
      filterdProducts = products;
      return filterdProducts;
    }
    filterdProducts = products
        .where((p) => p.title!.toLowerCase().contains(text2))
        .toList();
    notifyListeners();
    return filterdProducts;
  }

  Future<void> loadProducts() async {
    state = AppState.load;
    notifyListeners();

    try {
      products = await repository.getProducts();
      filterdProducts = products;
      state = AppState.success;
    } catch (e) {
      errorMessage = e.toString();
      state = AppState.error;
    }
    notifyListeners();
  }
}
