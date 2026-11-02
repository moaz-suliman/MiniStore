import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:small_shop/core/colors.dart';
import 'package:small_shop/feature/cartPage/data/model/cart_model.dart';

import 'package:small_shop/feature/cartPage/Presintation/provider/cart_page_provider.dart';
class CardWidget extends StatelessWidget {
  final CartModel item;
  const CardWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final product = item.product;
    final price = product.price ?? 0;

    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColor.surfaceColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColor.primaryColor.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            width: 90,
            height: 90,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                imageUrl: product.thumbnail!,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        product.title ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'mmmm',
                          color: AppColor.textColor,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        context.read<CartProvider>().removeProduct(product);
                      },
                      child: Icon(
                        Icons.delete_outline_outlined,
                        size: 22,
                        color: AppColor.subtitleColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  product.category ?? '',
                  style: TextStyle(
                    fontSize: 13,
                    fontFamily: 'mmmm',
                    color: AppColor.subtitleColor,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${(price * item.quantity).toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'mmmm',
                        color: AppColor.primaryColor,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColor.borderColor.withOpacity(0.5),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          InkWell(
                            customBorder: const CircleBorder(),
                            onTap: () {
                              context.read<CartProvider>().decreaseQuantity(
                                item,
                              );
                            },
                            child: Container(
                              width: 28,
                              height: 28,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColor.surfaceColor,
                              ),
                              child: Icon(
                                Icons.remove,
                                size: 16,
                                color: AppColor.textColor,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              '${item.quantity}',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'mmmm',
                                color: AppColor.textColor,
                              ),
                            ),
                          ),
                          InkWell(
                            customBorder: const CircleBorder(),
                            onTap: () {
                              context.read<CartProvider>().increaseQuantity(
                                item,
                              );
                            },
                            child: Container(
                              width: 28,
                              height: 28,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColor.surfaceColor,
                              ),
                              child: Icon(
                                Icons.add,
                                size: 16,
                                color: AppColor.textColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
