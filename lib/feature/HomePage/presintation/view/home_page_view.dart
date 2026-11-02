import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:small_shop/core/app_state/app_state.dart';
import 'package:small_shop/feature/HomePage/presintation/provider/prodcut_provider.dart';
import 'package:small_shop/feature/HomePage/presintation/view/product_page_details.dart';
import 'package:small_shop/feature/HomePage/presintation/widget/appbar_widget.dart';
import 'package:small_shop/feature/HomePage/presintation/widget/card_skeleton.dart';
import 'package:small_shop/feature/HomePage/presintation/widget/card_widget.dart';
class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  void initState() {
    super.initState();
    context.read<ProductProvider>().loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(),
      body: Consumer<ProductProvider>(
        builder: (context, value, child) {
          switch (value.state) {
            case AppState.initial: 
            case AppState.load:
              return ListView.builder(
                itemCount: 6,
                itemBuilder: (context, index) => const CardSkeleton(),
              );
            case AppState.error:
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(value.errorMessage),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () => value.loadProducts(),
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              );
            case AppState.success:
              final list = value.isSearching
                  ? value.filterdProducts
                  : value.products;
              return ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  final product = list[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductPageDetails(product: product),
                        ),
                      );
                    },
                    child: CardWidget(
                      image: product.thumbnail ?? "",
                      title: product.title ?? "",
                      description: product.description ?? "",
                      category: product.category ?? "",
                      price: product.price ?? 0,
                    ),
                  );
                },
              );
          }
        },
      ),
    );
  }
}
