import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:small_shop/core/colors.dart';
import 'package:small_shop/core/securestorge/flutter_secure_storge.dart';
import 'package:small_shop/feature/HomePage/presintation/provider/prodcut_provider.dart';
import 'package:small_shop/feature/auth/logIn/presintation/view/login_page.dart';

class AppbarWidget extends StatefulWidget implements PreferredSizeWidget {
  const AppbarWidget({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<AppbarWidget> createState() => _AppbarWidgetState();
}

class _AppbarWidgetState extends State<AppbarWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, provider, child) {
        return AppBar(
          elevation: 3,
          backgroundColor: AppColor.backgroundColor,
          surfaceTintColor: Colors.transparent,
          shadowColor: AppColor.cardColor,
          title: provider.isSearching
              ? TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: 'search product',
                    hintStyle: TextStyle(color: AppColor.textFieldHintText),
                    fillColor: AppColor.cardColor,
                    filled: true,
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(vertical: 10),
                    prefixIcon: Icon(
                      Icons.search,
                      color: AppColor.primaryColor,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onChanged: (text) {
                    provider.searchProduct(text);
                  },
                )
              : Text(
                  'Products',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'mmmm',
                    color: AppColor.textColor,
                  ),
                ),
          actions: provider.isSearching
              ? [
                  IconButton(
                    onPressed: () => provider.stopSearch(),
                    icon: Icon(Icons.close, color: AppColor.textColor),
                  ),
                ]
              : [
                  IconButton(
                    onPressed: () => provider.startSearch(),
                    icon: Icon(Icons.search, color: AppColor.textColor),
                  ),
                  // restart button
                  IconButton(
                    onPressed: () {
                      provider.loadProducts();
                      provider.isSearching = false;
                    },
                    icon: Icon(Icons.restart_alt, color: AppColor.textColor),

                    //log out button
                  ),
                  const SizedBox(width: 4),
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),

                    child: IconButton(
                      onPressed: () {
                        GetIt.instance<SecureStorge>().delete('accessToken');
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.logout,
                        size: 20,
                        color: AppColor.onPrimaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                ],
        );
      },
    );
  }
}
