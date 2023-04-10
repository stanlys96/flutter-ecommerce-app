import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';

class ProfileProvider extends ChangeNotifier {
  List<String> availablePages = [
    'Profile',
    'Settings',
    'My Orders',
    'Idle',
    'Order Details'
  ];

  String page = "Idle";

  String currentPage = 'Profile';

  void switchState() {
    if (!availablePages.contains(currentPage) || !availablePages.contains(page))
      return;
    currentPage = page;
    page = "Idle";
  }

  void setCurrentPage(String newValue, BuildContext context) async {
    print(newValue);
    print("???");
    if (!availablePages.contains(newValue)) {
      await Flushbar(
        flushbarPosition: FlushbarPosition.TOP,
        title: 'Not Available Yet',
        message: 'This service is currently not available.',
        duration: Duration(milliseconds: 1500),
      ).show(context);
      return;
    }
    page = newValue;
    print(page);
    notifyListeners();
  }
}
