import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get_it/get_it.dart';

import 'package:small_shop/core/securestorge/flutter_secure_storge.dart';
import 'package:small_shop/feature/HomePage/data/repositories/product_repository_impl.dart';
import 'package:small_shop/feature/HomePage/presintation/provider/prodcut_provider.dart';
import 'package:small_shop/feature/auth/signIn/data/repository/signIn_repositroy_impl.dart';
import 'package:small_shop/feature/auth/signIn/presintation/provider/singUp_provider.dart';
import 'package:small_shop/feature/cartPage/Presintation/provider/cart_page_provider.dart';
import 'package:small_shop/feature/dash_board/presintation/provider/dashboardProvider.dart';
import 'package:small_shop/feature/on_boarding_page/presintation/provider/on_boarding_provider.dart';
import 'package:small_shop/feature/splash/presintation/view/splash_page.dart';
import 'package:small_shop/feature/auth/logIn/presintation/provider/login_provider.dart';

void main() {
    WidgetsFlutterBinding.ensureInitialized();

  final getIt = GetIt.instance;

  getIt.registerLazySingleton<SecureStorge>(() {
    final storage = SecureStorge();
    storage.init();
    return storage;
  });

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductProvider(ProductRepositoryImpl()),
        ),
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: (context)=>Dashboardprovider()),
        ChangeNotifierProvider(create: (context)=>OnBoardingProvider()),
        ChangeNotifierProvider(
          create: (context) => SingupProvider(SignUpRepositroyImpl()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashPage(),
      ),
    ),
  );
}
