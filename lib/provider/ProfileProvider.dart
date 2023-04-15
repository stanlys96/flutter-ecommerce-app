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

  String name = "Habibu";

  String shippingAddress =
      "3 Newbridge Court, Chino Hills, CA 91709, United States";

  String paymentMethod = "Mastercard";

  String paymentNumber = "3123 3123 3123 3947";

  String status = "delivered";

  void setCurrentPage(String newValue, BuildContext context) async {
    if (!availablePages.contains(newValue)) {
      await Flushbar(
        flushbarPosition: FlushbarPosition.TOP,
        title: 'Not Available Yet',
        message: 'This service is currently not available.',
        duration: const Duration(milliseconds: 1500),
      ).show(context);
      return;
    }
    currentPage = newValue;
    notifyListeners();
  }

  void setStatus(String newValue) {
    status = newValue;
    notifyListeners();
  }
}
