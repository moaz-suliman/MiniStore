import 'package:flutter/material.dart';

abstract class SignUpRepository {

  Future<void> signUp(BuildContext context,String firstName,String email, String password,);

}