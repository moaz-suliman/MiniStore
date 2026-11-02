import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:small_shop/core/api_url.dart';
import 'package:small_shop/feature/auth/logIn/data/model/users_model.dart';
import 'package:small_shop/feature/auth/logIn/data/repository/login_repository.dart';
import 'package:http/http.dart' as http;

class LoginRepositoryImpl implements LoginRepository {
  @override
  Future<UsersModel> login(BuildContext context,String username, String password,) async {

    final response = await http.post(
      Uri.parse(ApiUrl.login), //convert form url string to uri object
      headers: {
        'Content-Type': 'application/json',
        'Accept': "application/json",
      },
      // json encode convert form dart to json
      body: json.encode({'username': username, 'password': password}),
    );

    if (response.statusCode == 200) {
      //json decode convert form json to dart
      final data = jsonDecode(response.body);
      return UsersModel.fromJson(data);
    } else {
      throw Exception('login failed');
    }
  }
}
