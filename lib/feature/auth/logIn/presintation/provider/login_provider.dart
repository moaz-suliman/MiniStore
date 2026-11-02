
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:small_shop/core/securestorge/flutter_secure_storge.dart';
import 'package:small_shop/feature/auth/logIn/data/repository/login_repository.dart';
import 'package:small_shop/core/app_state/app_state.dart';
import 'package:small_shop/feature/auth/logIn/data/repository/login_repository_impl.dart';
import 'package:small_shop/feature/dash_board/presintation/view/dashboard_view.dart';

class LoginProvider extends ChangeNotifier {
  String errorMessage = '';
  AppState state = AppState.initial;

  final LoginRepository loginRepository = LoginRepositoryImpl();

  Future<void> login(BuildContext context,String username,String password,) async {
    state = AppState.load;
    errorMessage = '';
    notifyListeners();

    try {
      final token = await loginRepository.login(
        context,
        username,
        password,
      );
    // Store user data in secure storage after successful login
      await GetIt.instance<SecureStorge>().write(
        'accessToken',
        token,
      );

      state = AppState.success;
      notifyListeners();

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => DashboardView(),
        ),
      );
    } catch (e) {
      errorMessage = e.toString();
      state = AppState.error;
      notifyListeners();
    }
  }
}
