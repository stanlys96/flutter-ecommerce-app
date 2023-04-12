import 'package:ecommerce_app/components/auth_page/LottieContainer.dart';
import 'package:ecommerce_app/pages/ForgotPasswordPage.dart';
import 'package:ecommerce_app/pages/SignIn.dart';
import 'package:ecommerce_app/pages/SignUp.dart';
import 'package:ecommerce_app/provider/AuthProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:ui';
import 'package:ecommerce_app/views/front_view.dart';

class AuthPage extends StatefulWidget {
  static const String routeName = '/auth';

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage>
    with SingleTickerProviderStateMixin
    implements FrontView {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Animation<double>? _blurAnimation;
  AnimationController? _blurController;

  Animation<double> _animation() {
    return Tween<double>(begin: 0.0, end: 1.0).animate(_blurController!)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          if (Provider.of<AuthProvider>(context, listen: false).page !=
              "Idle") {
            Provider.of<AuthProvider>(context, listen: false).switchState();
            _blurController?.reverse();
          }
        } else if (status == AnimationStatus.dismissed) {
          //controller.forward();
        }
      });
  }

  AnimationController _controller() {
    return AnimationController(
        vsync: this, duration: const Duration(milliseconds: 350));
  }

  @override
  void initState() {
    super.initState();

    _blurController = _controller();
    _blurAnimation = _animation();
  }

  @override
  void dispose() {
    _blurAnimation = null;
    _blurController = null;
  }

  @override
  void backToSignInPage() {
    Provider.of<AuthProvider>(context, listen: false).setCurrentPage('Sign In');
  }

  @override
  void backToSignUpPage() {
    Provider.of<AuthProvider>(context, listen: false).setCurrentPage('Sign Up');
  }

  @override
  void goToSignInPage() {
    Provider.of<AuthProvider>(context, listen: false).setCurrentPage('Sign In');
  }

  @override
  void goToResetPasswordPage() {
    Provider.of<AuthProvider>(context, listen: false)
        .setCurrentPage('Forgot Password');
  }

  Widget _blur() {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: BackdropFilter(
        filter: ImageFilter.blur(
            sigmaX:
                Provider.of<AuthProvider>(context, listen: false).currentPage ==
                        "Sign In"
                    ? 6.0
                    : (_blurAnimation?.value ?? 1) * 6,
            sigmaY:
                Provider.of<AuthProvider>(context, listen: false).currentPage ==
                        "Sign In"
                    ? 6.0
                    : (_blurAnimation?.value ?? 1) * 6),
        child: Container(
            //color: Colors.black87.withOpacity(0.1),
            ),
      ),
    );
  }

  void goBack(AuthProvider authProvider, BuildContext context) {
    if (authProvider.currentPage == 'Sign In') {
      backToSignUpPage();
    } else if (authProvider.currentPage == 'Forgot Password') {
      backToSignInPage();
    }
    _blurController?.forward();
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
                  child: const Icon(
                    Icons.arrow_back,
                  ),
                )
              : null,
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text("Fashionee"),
          backgroundColor: Colors.red,
          // elevation: 0,
        ),
        body: Stack(
          children: [
            _blur(),
            ForgotPasswordPage(
              blurController: _blurController,
            ),
            SignInPage(
              blurController: _blurController,
            ),
            SignUpPage(
              blurController: _blurController,
            ),
            const LottieContainer(),
          ],
        ),
      );
    });
  }
}
