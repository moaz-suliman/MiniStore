import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:small_shop/core/colors.dart';
import 'package:small_shop/feature/cartPage/Presintation/provider/cart_page_provider.dart';
import 'package:small_shop/feature/cartPage/Presintation/widgets/card_widget.dart';
import 'package:small_shop/feature/cartPage/Presintation/widgets/checkout_row.dart';
import 'package:small_shop/feature/cartPage/Presintation/widgets/order_total_row.dart';

class CartPageView extends StatefulWidget {
  const CartPageView({super.key});

  @override
  State<CartPageView> createState() => _CartPageViewState();
}

class _CartPageViewState extends State<CartPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        elevation: 3,
        backgroundColor: AppColor.backgroundColor,
        surfaceTintColor: Colors.transparent,
        shadowColor: AppColor.cardColor,
        title: Text(
          'My Cart',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w600,
            fontFamily: 'mmmm',
            color: AppColor.textColor,
          ),
        ),
      ),
      body: Consumer<CartProvider>(
        builder: (context, value, child) {
          return value.items.isEmpty?Center(child: Text('cart is empty')): Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: value.items.length,
                  itemBuilder: (context, index) {
                    return CardWidget(item: value.items[index]);
                  },
                ),
              ),
              const SizedBox(height: 8),
              OrderTotalRow(),
              const SizedBox(height: 16),
              CheckoutRow(),
            ],
          );
        },
      ),
    );
  }
}
