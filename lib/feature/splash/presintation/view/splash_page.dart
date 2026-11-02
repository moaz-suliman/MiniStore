import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:small_shop/core/colors.dart';
import 'package:small_shop/core/securestorge/flutter_secure_storge.dart';
import 'package:small_shop/core/shared_prefrence.dart';
import 'package:small_shop/feature/auth/logIn/presintation/view/login_page.dart';
import 'package:small_shop/feature/dash_board/presintation/view/dashboard_view.dart';
import 'package:small_shop/feature/on_boarding_page/presintation/view/on_boarding_view.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
 @override
void initState() {
  super.initState();
  startApp();
}

Future<void> startApp() async {
  await Future.delayed(const Duration(seconds: 3));

  final seen = await AppPreferences().isOnboardingSeen();
  final token = await GetIt.instance<SecureStorge>().read('accessToken');

  if (!mounted) return;

  if (seen == false) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => OnBoardingView()),
    );
    return;
  }

  // . يوجد توكن: اذهب إلى الداشبورد
  if (token != null && token.isNotEmpty) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => DashboardView()),
    );
    return;
  }

  // . غير ذلك: اذهب إلى صفحة الدخول
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => LoginPage()),
  );
}

 

@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: AppColor.backgroundColor,
    body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 120,
            height: 120,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 112,
                  height: 112,
                  decoration: BoxDecoration(
                    color: AppColor.primaryColor.withOpacity(0.04),
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: AppColor.primaryColor.withOpacity(0.12),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColor.primaryColor.withOpacity(0.04),
                      width: 2,
                    ),
                  ),
                  child: Icon(
                    Icons.shopping_bag,
                    size: 32,
                    color: AppColor.primaryColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Simple Shop',
            style: TextStyle(
              fontFamily: 'mmmm',
              fontWeight: FontWeight.w700,
              fontSize: 27,
              letterSpacing: -0.7,
              color: const Color(0xff20202A),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            'Your everyday shopping\ncompanion',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'mmmm',
              fontSize: 14,
              height: 1.5,
              color: AppColor.secondryColor,
            ),
          ),
        ],
      ),
    ),
  );
}
}