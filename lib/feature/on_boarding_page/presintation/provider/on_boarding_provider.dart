import 'package:flutter/material.dart';

class OnBoardingProvider extends ChangeNotifier {
  int currentIndex = 0;

  void changeCurrentIndex(int value) {
    currentIndex = value;
    notifyListeners();
  }
}
