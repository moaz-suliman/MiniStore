import 'package:flutter/material.dart';
import 'package:small_shop/core/colors.dart';

class BagLogo extends StatelessWidget {
  const BagLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
              alignment: Alignment.topCenter,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 112,
                    height: 112,
                    decoration: BoxDecoration(
                      color: AppColor.primaryColor.withOpacity(0.04),
                      shape: BoxShape.circle,
                    ),
                  ),
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: AppColor.primaryColor.withOpacity(0.12),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColor.primaryColor.withOpacity(0.04),
                        width: 2,
                      ),
                    ),
                    child: Icon(
                      Icons.shopping_bag,
                      size: 32,
                      color: AppColor.primaryColor,
                    ),
                  ),
                ],
              ),
            );
  }
}