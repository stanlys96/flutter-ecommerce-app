import 'package:ecommerce_app/MainPage.dart';
import 'package:ecommerce_app/ProductDetailPage.dart';
import 'package:ecommerce_app/SignIn.dart';
import 'package:ecommerce_app/SignUp.dart';
import 'package:ecommerce_app/provider/ProfileProvider.dart';
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
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: SignUpPage.routeName,
        routes: {
          SignUpPage.routeName: (context) => SignUpPage(),
          SignInPage.routeName: (context) => SignInPage(),
          MainPage.routeName: (context) => MainPage(),
          ProductDetailsPage.routeName: (context) => ProductDetailsPage(),
        },
      ),
    );
  }
}
