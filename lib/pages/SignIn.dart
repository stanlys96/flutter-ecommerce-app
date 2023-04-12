import 'package:ecommerce_app/api/ApiService.dart';
import 'package:ecommerce_app/components/SocialIconBox.dart';
import 'package:ecommerce_app/models/Login.dart';
import 'package:ecommerce_app/components/InputBox.dart';
import 'package:ecommerce_app/provider/AuthProvider.dart';
import 'package:ecommerce_app/provider/MainProvider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

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

  void handleSignIn(AuthProvider authProvider, MainProvider mainProvider,
      BuildContext context) async {
    authProvider.setLoading(true);
    try {
      LoginModel? result =
          await apiService.login(emailController.text, passwordController.text);
      authProvider.setLoading(false);

      if (result?.msg == 'success') {
        emailController.clear();
        passwordController.clear();
        authProvider.setCurrentPage("Sign Up");
        if (mounted) {
          Navigator.of(context).pushNamed('/main');
        }

      }
      Navigator.of(context).pushNamed('/main');
    } catch (e) {
      print(e);
      authProvider.setLoading(false);
      Navigator.of(context).pushNamed('/main');
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    MainProvider mainProvider = Provider.of<MainProvider>(context);
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
                    const SizedBox(
                      height: 20.0,
                    ),
                    InputBox(
                      title: 'Password',
                      placeholder: 'Enter Password',
                      isPassword: true,
                      controller: passwordController,
                    ),
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
                            color: Colors.red,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          handleSignIn(authProvider, mainProvider, context);
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          backgroundColor: const Color(0xFFDB3022),
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
  }
}
