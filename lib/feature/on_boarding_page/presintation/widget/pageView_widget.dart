import 'package:flutter/material.dart';
import 'package:small_shop/core/colors.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          Column(
            children: [
              Container(
                color: AppColor.backgroundColor,
                width: double.infinity,
                height: 320,
                margin: const EdgeInsets.only(top: 32),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 350,
                      height: 220,
                      decoration: BoxDecoration(
                        color: AppColor.secondryColor.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(135),
                      ),
                    ),
                    Container(
                      width: 235,
                      height: 235,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 20,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(22),
                        child: Image.asset(
                          'assets/images/productImage.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    const Text(
                      'Discover Quality Products',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -1,
                        fontFamily: 'mmmm',
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      textAlign: TextAlign.center,
                      'Browse through hundreds of items with instant pricing and seamless shopping.',
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.6,
                        color: AppColor.secondryColor,
                        fontFamily: 'mmmm',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}