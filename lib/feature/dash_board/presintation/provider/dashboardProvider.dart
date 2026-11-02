import 'package:flutter/material.dart';

class Dashboardprovider extends ChangeNotifier{
 int  pageNumber=0;

 void changePageNumver(int value){
pageNumber=value;
notifyListeners();
 }
}