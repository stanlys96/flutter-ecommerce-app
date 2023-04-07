import 'package:ecommerce_app/pages/ForgotPasswordPage.dart';
import 'package:ecommerce_app/components/InputBox.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

class SignInPage extends StatefulWidget {
  static const String routeName = '/sign-in';

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
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
                    'Sign In',
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
                  SizedBox(height: 20.0),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('/forgot-password');
                    },
                    child: Text(
                      'Forgot your password?',
                      textAlign: TextAlign.right,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Sign In'),
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
                      Text('Or sign in with social account'),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.all(10.0),
                              child: new Icon(
                                IconData(0xe255, fontFamily: 'MaterialIcons'),
                              ),
                              decoration: BoxDecoration(
                                color: Color(0xFFFFFFFF),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5.0),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 3,
                                    offset: Offset(
                                        0, 1), // changes position of shadow
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFFFFFFF),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5.0),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 3,
                                    offset: Offset(
                                        0, 1), // changes position of shadow
                                  ),
                                ],
                              ),
                              padding: EdgeInsets.all(10.0),
                              child: new Icon(
                                IconData(0xe255, fontFamily: 'MaterialIcons'),
                              ),
                            ),
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