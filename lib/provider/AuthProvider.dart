import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  List<String> availablePages = ['Sign Up', 'Sign In', 'Forgot Password'];

  String currentPage = 'Sign Up';
  bool loading = false;

  void setCurrentPage(String newValue, BuildContext context) {
    currentPage = newValue;
    notifyListeners();
  }

  void setLoading(bool newValue) {
    loading = newValue;
    notifyListeners();
  }
}
