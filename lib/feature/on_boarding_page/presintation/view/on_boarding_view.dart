import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:small_shop/core/colors.dart';
import 'package:small_shop/core/shared_prefrence.dart';
import 'package:small_shop/feature/auth/logIn/presintation/view/login_page.dart';
import 'package:small_shop/feature/on_boarding_page/presintation/provider/on_boarding_provider.dart';
import 'package:small_shop/feature/on_boarding_page/presintation/widget/page_dot_widget.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController controller = PageController();
  int currentIndex = 0;

  final List<Map<String, String>> pages = const [
    {
      'image': 'assets/images/productImage.png',
      'title': 'Discover Quality Products',
      'text':
          'Browse through hundreds of items with instant pricing and seamless shopping.',
    },
    {
      'image': 'assets/images/productImage.png',
      'title': 'Save Your Favorites',
      'text': 'Keep the items you love in one place and come back anytime.',
    },
    {
      'image': 'assets/images/productImage.png',
      'title': 'Easy Checkout',
      'text': 'Order in a few taps and track everything from your account.',
    },
  ];

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 3.0),
          child: Row(
            children: [
              Icon(Icons.shopping_bag, color: AppColor.primaryColor),
              const SizedBox(width: 5),
              Text(
                'Small Shop     ',
                style: TextStyle(
                  color: AppColor.primaryColor,
                  fontFamily: 'mmmm',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              await AppPreferences().setOnboardingSeen();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
            child: Text(
              'Skip',
              style: TextStyle(
                color: AppColor.secondryColor,
                fontFamily: 'mmmm',
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Consumer<OnBoardingProvider>(
        builder: (context, value, child) {
          return Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: controller,
                  itemCount: pages.length,
                  onPageChanged: (index) {
                    value.changeCurrentIndex(index);
                  },
                  itemBuilder: (context, index) {
                    final page = pages[index];
                    return SingleChildScrollView(
                      child: Column(
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
                                    color: AppColor.secondryColor.withOpacity(
                                      0.15,
                                    ),
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
                                      page['image']!,
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
                                Text(
                                  page['title']!,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: -1,
                                    fontFamily: 'mmmm',
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  page['text']!,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 18,
                                    height: 1.6,
                                    color: AppColor.secondryColor,
                                    fontFamily: 'mmmm',
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              PageDots(
                currentIndex: value.currentIndex,
                count: pages.length,
                onDotTap: (index) {
                  controller.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
              ),
              const SizedBox(height: 32),
              Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: ElevatedButton(
                  onPressed: () async {
                    if (value.currentIndex < pages.length - 1) {
                      controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      await AppPreferences().setOnboardingSeen();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: Text(
                    value.currentIndex < pages.length - 1 ? 'Next' : 'Get Started',
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontFamily: 'mmmm',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          );
        },
      ),
    );
  }
}
