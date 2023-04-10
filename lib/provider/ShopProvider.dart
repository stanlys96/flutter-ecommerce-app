import 'package:flutter/material.dart';

class ShopProvider extends ChangeNotifier {
  List<String> availablePages = ['Profile', 'Settings', 'My Orders'];

  String currentState = 'Shop';

  void setCurrentState(String newValue) {
    currentState = newValue;
    notifyListeners();
  }
}
