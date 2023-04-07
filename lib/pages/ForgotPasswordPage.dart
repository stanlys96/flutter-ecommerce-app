import 'package:ecommerce_app/components/InputBox.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

class ForgotPasswordPage extends StatefulWidget {
  static const routeName = "/forgot-password";
  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("Fashionee"),
        backgroundColor: Colors.red,
      ),
      body: Container(
        padding: EdgeInsetsDirectional.all(20.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFFf9f9f9),
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
                    'Forgot Password',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  const Text(
                      'Please, enter your email address. You will receive a link to create a new password via email.'),
                  SizedBox(height: 10.0),
                  InputBox(),
                  SizedBox(height: 20.0),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Send'),
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        backgroundColor: Color(0xFFDB3022),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
