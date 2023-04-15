import 'dart:convert';
import 'dart:math';

import 'package:another_flushbar/flushbar.dart';
import 'package:ecommerce_app/api/ApiService.dart';
import 'package:ecommerce_app/components/SocialIconBox.dart';
import 'package:ecommerce_app/models/Login.dart';
import 'package:ecommerce_app/components/InputBox.dart';
import 'package:ecommerce_app/provider/AuthProvider.dart';
import 'package:ecommerce_app/provider/HomeProvider.dart';
import 'package:ecommerce_app/provider/MainProvider.dart';
import 'package:ecommerce_app/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInPage extends StatefulWidget {
  static const String routeName = '/sign-in';

  final AnimationController? blurController;

  SignInPage({this.blurController = null});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  ApiService apiService = ApiService();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  bool emailError = false;
  String emailErrorMessage = "";
  bool passwordError = false;
  String passwordErrorMessage = "";

  void handleSignIn(AuthProvider authProvider, BuildContext context,
      HomeProvider homeProvider) async {
    authProvider.setLoading(true);
    try {
      LoginModel? result =
          await apiService.login(emailController.text, passwordController.text);
      authProvider.setLoading(false);

      if (result?.msg == 'success') {
        final SharedPreferences prefs = await _prefs;

        await prefs.setString("member", jsonEncode(result?.toJson()));
        await homeProvider.refetchAll(relogin: true);
        emailController.clear();
        passwordController.clear();
        authProvider.setCurrentPage("Sign Up");
        if (mounted) {
          Navigator.of(context).pushNamed('/main');
        }
      } else {
        String message = "";
        if (result?.msg == 'email_not_found') {
          message = "Email not found!";
        } else if (result?.msg == 'password_incorrect') {
          message = "Password incorrect!";
        }
        await Flushbar(
          flushbarPosition: FlushbarPosition.TOP,
          title: "Error",
          message: message,
          duration: const Duration(milliseconds: 1500),
          backgroundColor: Colors.deepOrange,
        ).show(context);
      }
    } catch (e) {
      print(e);
      authProvider.setLoading(false);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    emailController.addListener(() {
      setState(() {
        if (emailController.text == "") {
          emailError = true;
          emailErrorMessage = "Email cannot be empty.";
        } else if (!checkEmail(emailController.text)) {
          emailError = true;
          emailErrorMessage = "Invalid email format";
        } else {
          emailError = false;
          emailErrorMessage = "";
        }
      });
    });

    passwordController.addListener(() {
      setState(() {
        if (passwordController.text == "") {
          passwordError = true;
          passwordErrorMessage = "Password cannot be empty.";
        } else if (passwordController.text.trim().length < 6) {
          passwordError = true;
          passwordErrorMessage = "Password length must be more than 6.";
        } else {
          passwordError = false;
          passwordErrorMessage = "";
        }
      });
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<AuthProvider, HomeProvider>(
        builder: (secondContext, authProvider, homeProvider, child) {
      return Visibility(
        visible: authProvider.currentPage == 'Sign In',
        child: Opacity(
          opacity: 1 - (widget.blurController?.value ?? 0),
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(
                top: 20.0,
                left: 20.0,
                right: 20.0,
                bottom: 50.0,
              ),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFFF9F9F9),
              ),
              height: MediaQuery.of(context).size.height - 56.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
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
                      const SizedBox(
                        height: 20.0,
                      ),
                      InputBox(
                        title: 'Email',
                        placeholder: 'Enter Email',
                        controller: emailController,
                      ),
                      emailError
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10),
                                Text(
                                  emailErrorMessage,
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            )
                          : SizedBox(),
                      const SizedBox(
                        height: 20.0,
                      ),
                      InputBox(
                        title: 'Password',
                        placeholder: 'Enter Password',
                        isPassword: true,
                        controller: passwordController,
                      ),
                      passwordError
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10),
                                Text(
                                  passwordErrorMessage,
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            )
                          : SizedBox(),
                      const SizedBox(height: 20.0),
                      InkWell(
                        onTap: () {
                          widget.blurController?.forward();
                          authProvider.setCurrentPage('Forgot Password');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
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
                              color: Colors.deepOrange,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            FocusScope.of(context).unfocus();
                            if (emailController.text == "" ||
                                passwordController.text == "") {
                              return await Flushbar(
                                flushbarPosition: FlushbarPosition.TOP,
                                title: "Error",
                                message: "All fields must be filled!",
                                duration: const Duration(milliseconds: 1500),
                                backgroundColor: Colors.deepOrange,
                              ).show(context);
                            } else if (emailError || passwordError) {
                              return await Flushbar(
                                flushbarPosition: FlushbarPosition.TOP,
                                title: "Error",
                                message: "Please check on the error field!",
                                duration: const Duration(milliseconds: 1500),
                                backgroundColor: Colors.deepOrange,
                              ).show(context);
                            }
                            handleSignIn(authProvider, context, homeProvider);
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            backgroundColor: Colors.blueAccent,
                          ),
                          child: const Text('Sign In'),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text('Or sign in with social account'),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
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
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
