import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';

class CardSkeleton extends StatelessWidget {
  const CardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: const Row(
        children: [
          CardLoading(
            height: 90,
            width: 90,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CardLoading(height: 16, width: 180, borderRadius: BorderRadius.all(Radius.circular(8))),
                SizedBox(height: 8),
                CardLoading(height: 12, borderRadius: BorderRadius.all(Radius.circular(8))),
                SizedBox(height: 8),
                CardLoading(height: 14, width: 100, borderRadius: BorderRadius.all(Radius.circular(8))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}