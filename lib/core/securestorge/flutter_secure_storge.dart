import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:small_shop/feature/auth/logIn/data/model/users_model.dart';

class SecureStorge {
late FlutterSecureStorage storage;
  void init() {
    storage = const FlutterSecureStorage();
  }

  Future<String?> read(String key) async {
    return await storage.read(key: key);
  }

  Future<void> delete(String key) async {
    await storage.delete(key: key);
  }

  Future<void> write(String key, UsersModel token) async {
    final jsonString = jsonEncode(token.toJson());
    await storage.write(key: key, value: jsonString);
  }
}