import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:small_shop/core/colors.dart';
import 'package:small_shop/feature/cartPage/Presintation/provider/cart_page_provider.dart';

class OrderTotalRow extends StatelessWidget {
  const OrderTotalRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColor.cardColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Order Total',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              fontFamily: 'mmmm',
              color: AppColor.textColor,
            ),
          ),
          Text(
            '${context.read<CartProvider>().totalPrice.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              fontFamily: 'mmmm',
              color: AppColor.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
