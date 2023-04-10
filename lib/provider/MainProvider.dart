import 'package:another_flushbar/flushbar.dart';
import 'package:ecommerce_app/utils/constants.dart';
import 'package:flutter/material.dart';

class MainProvider extends ChangeNotifier {
  List<String> availablePages = [
    'Sign Up',
    'Sign In',
    'Forgot Password',
    'Idle'
  ];

  PageState page = PageState.IDLE;
  PageState previousPage = PageState.HOME;

  AnimationController? blurController;

  PageState currentPage = PageState.HOME;
  bool loading = false;
  bool success = false;

  String currentProductType = "";
  String currentProductCategory = "";

  void setCurrentPage(PageState newValue) {
    page = newValue;
    blurController?.forward();
    notifyListeners();
  }

  void setPreviousPage(PageState newValue) {
    previousPage = newValue;
    notifyListeners();
  }

  void serviceNotAvailable(BuildContext context) async {
    await Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      title: 'Not Available Yet',
      message: 'This service is currently not available.',
      duration: Duration(milliseconds: 1500),
    ).show(context);
  }

  void setLoading(bool newValue) {
    loading = newValue;
    notifyListeners();
  }

  void switchState() {
    currentPage = page;
    page = PageState.IDLE;
  }

  Future<void> setSuccess(bool newValue) async {
    success = newValue;
    notifyListeners();
  }

  void setCurrentProductType(String newValue) {
    currentProductType = newValue;
    notifyListeners();
  }

  void setCurrentProductCategory(String newValue) {
    currentProductCategory = newValue;
    notifyListeners();
  }
}
