import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:small_shop/core/api_url.dart';
import 'package:small_shop/feature/HomePage/data/model/product_model.dart';
import 'package:small_shop/feature/HomePage/data/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  @override
  Future<List<Product>> getProducts() async {

    // Uri.parse converts the url text into a Uri object
    final response = await http.get(Uri.parse(ApiUrl.productUrl));
    if (response.statusCode == 200) {
      // jsonDecode converts the JSON text into a Dart Map
      final result = ProductsResponse.fromJson(jsonDecode(response.body));
      return result.products ?? [];
    } else {
      debugPrint('STATUS: ${response.statusCode}');
      debugPrint('BODY: ${response.body}');
      throw Exception('failed to get data : ${response.statusCode}');
    }
  }
}
