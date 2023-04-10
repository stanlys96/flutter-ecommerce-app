import 'package:ecommerce_app/pages/ForgotPasswordPage.dart';
import 'package:ecommerce_app/pages/MainPage.dart';
import 'package:ecommerce_app/pages/ProductDetailPage.dart';
import 'package:ecommerce_app/pages/SignIn.dart';
import 'package:ecommerce_app/pages/SignUp.dart';
import 'package:ecommerce_app/pages/UserAuthPage.dart';
import 'package:ecommerce_app/provider/HomeProvider.dart';
import 'package:ecommerce_app/provider/MainProvider.dart';
import 'package:ecommerce_app/provider/ProfileProvider.dart';
import 'package:ecommerce_app/provider/AuthProvider.dart';
import 'package:ecommerce_app/provider/ShopProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:developer';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
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
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: AuthPage.routeName,
        routes: {
          AuthPage.routeName: (context) => AuthPage(),
          SignUpPage.routeName: (context) => SignUpPage(),
          SignInPage.routeName: (context) => SignInPage(),
          MainPage.routeName: (context) => MainPage(),
          ProductDetailsPage.routeName: (context) => ProductDetailsPage(),
          ForgotPasswordPage.routeName: (context) => ForgotPasswordPage(),
        },
      ),
    );
  }
}
