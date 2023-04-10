import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  List<String> availablePages = [
    'Sign Up',
    'Sign In',
    'Forgot Password',
    'Idle'
  ];

  String page = 'Idle';

  String currentPage = 'Sign Up';
  bool loading = false;
  bool success = false;

  void setCurrentPage(String newValue) {
    page = newValue;
    notifyListeners();
  }

  void setLoading(bool newValue) {
    loading = newValue;
    notifyListeners();
  }

  void switchState() {
    currentPage = page;
    page = "Idle";
  }

  Future<void> setSuccess(bool newValue) async {
    success = newValue;
    notifyListeners();
  }
}
