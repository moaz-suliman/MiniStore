import 'package:flutter/material.dart';
import 'package:small_shop/core/colors.dart';

class PageDots extends StatelessWidget {
  final int currentIndex;
  final int count;
  final ValueChanged<int> onDotTap;

  const PageDots({
    super.key,
    required this.currentIndex,
    required this.count,
    required this.onDotTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [for (int i = 0; i < count; i++) buildDot(i)],
    );
  }

  Widget buildDot(int dotIndex) {
    final bool isActive = dotIndex == currentIndex;

    return GestureDetector(
      onTap: () => onDotTap(dotIndex),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        margin: const EdgeInsets.symmetric(horizontal: 4),
        width: isActive ? 24 : 8,
        height: 8,
        decoration: BoxDecoration(
          color: isActive
              ? AppColor.primaryColor
              : AppColor.secondryColor.withOpacity(0.4),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}