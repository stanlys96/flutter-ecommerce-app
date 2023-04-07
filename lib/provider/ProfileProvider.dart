import 'package:flutter/material.dart';

class ProfileProvider extends ChangeNotifier {
  String currentPage = 'profile';

  void setCurrentPage(String newValue) {
    currentPage = newValue;
    notifyListeners();
  }
}
