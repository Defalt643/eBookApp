import 'package:flutter/material.dart';

class NaviagationController extends ChangeNotifier{
  String screenName='/';

  void changeScreen(String newScreenName){
    screenName = newScreenName;
    notifyListeners();
  }
}