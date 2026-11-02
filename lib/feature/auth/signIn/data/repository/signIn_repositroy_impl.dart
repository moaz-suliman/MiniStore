import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:small_shop/core/api_url.dart';
import 'package:small_shop/feature/auth/logIn/data/model/users_model.dart';
import 'package:http/http.dart' as http;
import 'package:small_shop/feature/auth/signIn/data/repository/signIn_repository.dart';

class SignUpRepositroyImpl implements SignUpRepository {
  @override
  Future<UsersModel> signUp(
    BuildContext context,
    String firstName,
    String email,
    String password,
  ) async {

    final response = await http.post(
      Uri.parse(ApiUrl.signUp), //convert form url string to uri object
      headers: {'Content-Type': 'application/json'},

      // json encode convert form dart to json
      body: jsonEncode({
        'firstName': firstName,
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 201) {
      //json decode convert form json to dart
      final data = jsonDecode(response.body);
      return UsersModel.fromJson(data);
    } else {
      debugPrint('status: ${response.statusCode}');
      debugPrint('body: ${response.body}');
      throw Exception('sign in  failed');
    }
  }
}
