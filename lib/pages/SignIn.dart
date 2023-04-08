import 'package:ecommerce_app/components/SocialIconBox.dart';
import 'package:ecommerce_app/pages/ForgotPasswordPage.dart';
import 'package:ecommerce_app/components/InputBox.dart';
import 'package:ecommerce_app/provider/AuthProvider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:developer';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  static const String routeName = '/sign-in';

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    return Visibility(
      visible: authProvider.currentPage == 'Sign In',
      child: Opacity(
        opacity: 1,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
              top: 20.0,
              left: 20.0,
              right: 20.0,
              bottom: 50.0,
            ),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFFF9F9F9),
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
                      InputBox(
                        title: 'Email',
                        placeholder: 'Enter Email',
                        controller: emailController,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      InputBox(
                        title: 'Password',
                        placeholder: 'Enter Password',
                        isPassword: true,
                        controller: passwordController,
                      ),
                      SizedBox(height: 20.0),
                      InkWell(
                        onTap: () {
                          authProvider.setCurrentPage(
                              'Forgot Password', context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Forgot your password?',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 10.0),
                            FaIcon(
                              FontAwesomeIcons.arrowRight,
                              size: 20.0,
                              color: Colors.red,
                            )
                          ],
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
                                SocialIconBox(
                                  icon: FontAwesomeIcons.google,
                                  iconColor: Colors.green,
                                ),
                                SizedBox(
                                  width: 20.0,
                                ),
                                SocialIconBox(
                                  icon: FontAwesomeIcons.facebook,
                                  iconColor: Colors.blue,
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
        ),
      ),
    );
  }
}
