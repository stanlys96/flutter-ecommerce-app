import 'dart:convert';

import 'package:ecommerce_app/models/Login.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<LoginModel?> getUser() {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  return _prefs.then((value) {
    String str = value.getString('member') ?? "";
    if (str.isEmpty) {
      return null;
    } else {
      return LoginModel.fromJson(jsonDecode(str));
    }
  });
}
