import 'package:flutter/material.dart';
import 'package:small_shop/feature/auth/logIn/data/model/users_model.dart';

abstract class LoginRepository {

  Future<UsersModel> login(BuildContext context,String username, String password);

}