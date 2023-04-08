import 'package:ecommerce_app/components/InputBox.dart';
import 'package:ecommerce_app/provider/AuthProvider.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

import 'package:provider/provider.dart';

class ForgotPasswordPage extends StatefulWidget {
  static const routeName = "/forgot-password";

  final AnimationController? blurController;

  ForgotPasswordPage({this.blurController = null});
  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    return Visibility(
      visible: authProvider.currentPage == 'Forgot Password',
      child: Opacity(
        opacity: 1 - (widget.blurController?.value ?? 0),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsetsDirectional.all(20.0),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFFf9f9f9),
            ),
            height: MediaQuery.of(context).size.height - 56.0,
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
                      InputBox(
                        title: "Email",
                        controller: emailController,
                      ),
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
        ),
      ),
    );
  }
}
