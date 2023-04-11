import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';

class ProfileProvider extends ChangeNotifier {
  List<String> availablePages = [
    'Profile',
    'Settings',
    'My Orders',
    'Order Details'
  ];

  String currentPage = 'Profile';

  void setCurrentPage(String newValue, BuildContext context) async {
    if (!availablePages.contains(newValue)) {
      await Flushbar(
        flushbarPosition: FlushbarPosition.TOP,
        title: 'Not Available Yet',
        message: 'This service is currently not available.',
        duration: Duration(milliseconds: 1500),
      ).show(context);
      return;
    }
    currentPage = newValue;
    notifyListeners();
  }
}
