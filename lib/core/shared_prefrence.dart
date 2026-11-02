import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {

  // هل رأى المستخدم الـ Onboarding
  Future<bool> isOnboardingSeen() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('onboardingSeen') ?? false;
  }

  // يُستدعى عند ضغط Get started أو Skip
  Future<void> setOnboardingSeen() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboardingSeen', true);
  }
}