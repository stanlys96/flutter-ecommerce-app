import 'package:flutter/material.dart';

class ShopProvider extends ChangeNotifier {
  List<String> availablePages = ['Profile', 'Settings', 'My Orders'];

  String currentPage = 'Shop';

  void setCurrentPage(String newValue) {
    currentPage = newValue;
    notifyListeners();
  }
}
