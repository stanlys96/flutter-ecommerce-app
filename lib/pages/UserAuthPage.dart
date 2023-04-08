import 'package:ecommerce_app/components/auth_page/LottieContainer.dart';
import 'package:ecommerce_app/pages/ForgotPasswordPage.dart';
import 'package:ecommerce_app/pages/SignIn.dart';
import 'package:ecommerce_app/pages/SignUp.dart';
import 'package:ecommerce_app/provider/AuthProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatefulWidget {
  static const String routeName = '/auth';

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Animation<double>? _blurAnimation;
  AnimationController? _blurController;

  void goBack(AuthProvider authProvider, BuildContext context) {
    if (authProvider.currentPage == 'Sign In') {
      authProvider.setCurrentPage('Sign Up', context);
    } else if (authProvider.currentPage == 'Forgot Password') {
      authProvider.setCurrentPage('Sign In', context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
        builder: (providerContext, authProvider, child) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: authProvider.currentPage != 'Sign Up'
              ? InkWell(
                  onTap: () {
                    goBack(authProvider, context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                  ),
                )
              : null,
          iconTheme: IconThemeData(color: Colors.white),
          title: Text("Fashionee"),
          backgroundColor: Colors.red,
          // elevation: 0,
        ),
        body: Stack(
          children: [
            ForgotPasswordPage(
              blurController: _blurController,
            ),
            SignInPage(
              blurController: _blurController,
            ),
            SignUpPage(
              blurController: _blurController,
            ),
            LottieContainer(),
          ],
        ),
      );
    });
  }
}
