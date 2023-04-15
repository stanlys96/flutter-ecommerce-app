import 'package:ecommerce_app/pages/CheckOutPage.dart';
import 'package:ecommerce_app/pages/ForgotPasswordPage.dart';
import 'package:ecommerce_app/pages/MainPage.dart';
import 'package:ecommerce_app/pages/OrderDetailsPage.dart';
import 'package:ecommerce_app/pages/OrderSuccess.dart';
import 'package:ecommerce_app/pages/ProductDetailPage.dart';
import 'package:ecommerce_app/pages/SignIn.dart';
import 'package:ecommerce_app/pages/SignUp.dart';
import 'package:ecommerce_app/pages/UserAuthPage.dart';
import 'package:ecommerce_app/provider/FavoritesProvider.dart';
import 'package:ecommerce_app/provider/HomeProvider.dart';
import 'package:ecommerce_app/provider/MainProvider.dart';
import 'package:ecommerce_app/provider/ProfileProvider.dart';
import 'package:ecommerce_app/provider/AuthProvider.dart';
import 'package:ecommerce_app/provider/ShopProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.getInstance().then((value) {
    bool _isLoggedIn;

    String str = value.getString("member") ?? "";

    if (str == null || str.isEmpty) {
      _isLoggedIn = false;
    } else {
      _isLoggedIn = true;
    }

    runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProfileProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => HomeProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ShopProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => MainProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => FavoritesProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: _isLoggedIn ? MainPage.routeName : AuthPage.routeName,
        routes: {
          AuthPage.routeName: (context) => AuthPage(),
          SignUpPage.routeName: (context) => SignUpPage(),
          SignInPage.routeName: (context) => SignInPage(),
          MainPage.routeName: (context) => MainPage(),
          ProductDetailsPage.routeName: (context) => ProductDetailsPage(),
          ForgotPasswordPage.routeName: (context) => ForgotPasswordPage(),
          OrderDetailsPage.routeName: (context) => OrderDetailsPage(),
          CheckOutPage.routeName: (context) => CheckOutPage(),
          OrderSuccess.routeName: (context) => OrderSuccess(),
        },
      ),
    ));
  });
}
