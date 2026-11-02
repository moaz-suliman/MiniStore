import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:small_shop/feature/HomePage/presintation/view/home_page_view.dart';
import 'package:small_shop/feature/cartPage/Presintation/view/cart_page_view.dart';
import 'package:small_shop/feature/dash_board/presintation/provider/dashboardProvider.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  final List<Widget> pages = const [HomePageView(), CartPageView()];

  @override
  Widget build(BuildContext context) {
    return Consumer<Dashboardprovider>(
      builder: (context, provider, child) {
        return Scaffold(
          body: IndexedStack(index: provider.pageNumber, children: pages),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: provider.pageNumber,
            onTap: (value) {
              provider.changePageNumver(value);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: "Home",
                activeIcon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined),
                label: "Cart",
                activeIcon: Icon(Icons.shopping_cart),
              ),
            ],
          ),
        );
      },
    );
  }
}
