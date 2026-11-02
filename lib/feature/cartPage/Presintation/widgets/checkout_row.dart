import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:small_shop/core/colors.dart';
import 'package:small_shop/core/custom_widgets/share_button.dart';
import 'package:small_shop/feature/cartPage/Presintation/provider/cart_page_provider.dart';

class CheckoutRow extends StatelessWidget {
  const CheckoutRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Total',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'mmmm',
                    color: AppColor.subtitleColor,
                  ),
                ),
                Text(
                  '${context.read<CartProvider>().totalPrice.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'mmmm',
                    color: AppColor.primaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 16),
            Expanded(
              child: ShareButton(onPressed: () {}, text: 'Checkout'),
            ),
          ],
        ),
      ),
    );
  }
}
