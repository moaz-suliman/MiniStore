
import 'package:flutter/material.dart';
import 'package:small_shop/core/app_state/app_state.dart';
import 'package:small_shop/core/colors.dart';
import 'package:small_shop/feature/auth/logIn/presintation/view/login_page.dart';
import 'package:small_shop/feature/auth/signIn/data/repository/signIn_repository.dart';

class SingupProvider extends ChangeNotifier {
  String errorMessage = '';
  AppState state = AppState.load;

  final SignUpRepository signUpRepository;

  SingupProvider(this.signUpRepository);

  Future<void> signUp(
    BuildContext context,
    String firstName,
    String email,
    String password,
  ) async {
    state = AppState.load;
    errorMessage = '';
    notifyListeners();

    try {
      await signUpRepository.signUp(
        context,
        firstName,
        email,
        password,
      );

      state = AppState.success;
      notifyListeners();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          elevation: 0,
          content: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.check_circle_outline,
                  color: Colors.white,
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Text(
                    'Sign up successful!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      );
    } catch (e) {
      errorMessage = e.toString();
      state = AppState.error;
      notifyListeners();
    }
  }
}
