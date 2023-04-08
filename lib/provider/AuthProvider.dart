import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  List<String> availablePages = ['Sign Up', 'Sign In', 'Forgot Password'];

  String currentPage = 'Sign Up';
  bool loading = false;
  bool success = false;

  void setCurrentPage(String newValue, BuildContext context) {
    currentPage = newValue;
    notifyListeners();
  }

  void setLoading(bool newValue) {
    loading = newValue;
    notifyListeners();
  }

  Future<void> setSuccess(bool newValue) async {
    success = newValue;
    notifyListeners();
  }
}
