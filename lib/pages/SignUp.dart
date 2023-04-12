import 'package:ecommerce_app/api/ApiService.dart';
import 'package:ecommerce_app/provider/AuthProvider.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/components/InputBox.dart';
import 'package:ecommerce_app/components/SocialIconBox.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  static const String routeName = '/sign-up';

  final AnimationController? blurController;

  SignUpPage({this.blurController = null});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  ApiService apiService = ApiService();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void handleSignUp(AuthProvider authProvider) async {
    authProvider.setLoading(true);
    try {
      await apiService.register(
          nameController.text, emailController.text, passwordController.text);
      nameController.clear();
      emailController.clear();
      passwordController.clear();
      authProvider.setLoading(false);
      authProvider.setSuccess(true);
    } catch (e) {
      print(e);
      authProvider.setLoading(false);
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    return Visibility(
      visible: authProvider.currentPage == 'Sign Up',
      child: Opacity(
        opacity: 1 - (widget.blurController?.value ?? 0),
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height - 56.0,
            padding: const EdgeInsets.only(
              top: 20.0,
              left: 20.0,
              right: 20.0,
              bottom: 100.0,
            ),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFFF9F9F9),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SingleChildScrollView(
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
                      const SizedBox(
                        height: 20.0,
                      ),
                      InputBox(
                        title: 'Full Name',
                        placeholder: 'Enter full name',
                        controller: nameController,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      InputBox(
                        title: 'Email',
                        placeholder: 'Enter email',
                        controller: emailController,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      InputBox(
                        title: 'Password',
                        placeholder: 'Enter password',
                        isPassword: true,
                        controller: passwordController,
                      ),
                      const SizedBox(height: 20.0),
                      InkWell(
                        onTap: () {
                          widget.blurController?.forward();
                          authProvider.setCurrentPage('Sign In');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text(
                              'Already have an account?',
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
                            handleSignUp(authProvider);
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            backgroundColor: const Color(0xFFDB3022),
                          ),
                          child: const Text('Sign Up'),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text('Or sign up with social account'),
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
