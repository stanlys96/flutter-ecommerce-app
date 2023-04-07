import 'package:ecommerce_app/InputBox.dart';
import 'package:ecommerce_app/SignIn.dart';
import 'package:ecommerce_app/SocialIconBox.dart';
import 'package:ecommerce_app/provider/ProfileProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:developer';

import 'MainPage.dart';

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
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("Fashionee"),
        backgroundColor: Colors.red,
        // elevation: 0,
      ),
      body: Container(
        padding: EdgeInsetsDirectional.all(20.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFFF9F9F9),
        ),
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Sign Up',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  InputBox(),
                  SizedBox(
                    height: 20.0,
                  ),
                  InputBox(),
                  SizedBox(
                    height: 20.0,
                  ),
                  InputBox(),
                  SizedBox(height: 20.0),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignInPage(),
                        ),
                      );
                    },
                    child: Text(
                      'Already have an account?',
                      textAlign: TextAlign.right,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MainPage(),
                          ),
                        );
                      },
                      child: Text('Sign Up'),
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        backgroundColor: Color(0xFFDB3022),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Or sign up with social account'),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SocialIconBox(),
                            SizedBox(
                              width: 10.0,
                            ),
                            SocialIconBox(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
