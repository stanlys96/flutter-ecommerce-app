import 'package:another_flushbar/flushbar.dart';
import 'package:ecommerce_app/api/ApiService.dart';
import 'package:ecommerce_app/models/Register.dart';
import 'package:ecommerce_app/provider/AuthProvider.dart';
import 'package:ecommerce_app/utils/helper.dart';
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

  bool nameError = false;
  String nameErrorMessage = "";
  bool emailError = false;
  String emailErrorMessage = "";
  bool passwordError = false;
  String passwordErrorMessage = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    nameController.addListener(() {
      setState(() {
        if (nameController.text == "") {
          nameError = true;
          nameErrorMessage = "Name cannot be empty.";
        } else if (nameController.text.trim().length < 6) {
          nameError = true;
          nameErrorMessage = "Name length must be more than 6.";
        } else {
          nameError = false;
          nameErrorMessage = "";
        }
      });
    });

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

  void handleSignUp(AuthProvider authProvider, BuildContext thisContext) async {
    authProvider.setLoading(true);
    try {
      RegisterResponse? result = await apiService.register(
          nameController.text, emailController.text, passwordController.text);
      if (result?.msg == "success") {
        nameController.clear();
        emailController.clear();
        passwordController.clear();
        authProvider.setLoading(false);
        authProvider.setSuccess(true);
        if (authProvider.currentPage == "Sign Up") {
          authProvider.setTheCurrentPage("Sign In");
        }
      } else if (result?.msg == "email_exist") {
        authProvider.setLoading(false);
        await Flushbar(
          flushbarPosition: FlushbarPosition.TOP,
          title: "Error",
          message: "Email already registered!",
          duration: const Duration(milliseconds: 1500),
          backgroundColor: Colors.deepOrange,
        ).show(thisContext);
      } else {
        authProvider.setLoading(false);
        await Flushbar(
          flushbarPosition: FlushbarPosition.TOP,
          title: "Error",
          message: "error",
          duration: const Duration(milliseconds: 1500),
          backgroundColor: Colors.deepOrange,
        ).show(thisContext);
      }
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
    return Consumer<AuthProvider>(
        builder: (secondContext, authProvider, child) {
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
                        nameError
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 10),
                                  Text(
                                    nameErrorMessage,
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
                          title: 'Email',
                          placeholder: 'Enter email',
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
                          placeholder: 'Enter password',
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
                            onPressed: () async {
                              if (nameController.text == "" ||
                                  emailController.text == "" ||
                                  passwordController.text == "") {
                                return await Flushbar(
                                  flushbarPosition: FlushbarPosition.TOP,
                                  title: "Error",
                                  message: "All fields must be filled!",
                                  duration: const Duration(milliseconds: 1500),
                                  backgroundColor: Colors.deepOrange,
                                ).show(context);
                              } else if (nameError ||
                                  emailError ||
                                  passwordError) {
                                return await Flushbar(
                                  flushbarPosition: FlushbarPosition.TOP,
                                  title: "Error",
                                  message: "Please check on the error field!",
                                  duration: const Duration(milliseconds: 1500),
                                  backgroundColor: Colors.deepOrange,
                                ).show(context);
                              }
                              FocusScope.of(context).unfocus();
                              handleSignUp(authProvider, context);
                            },
                            style: ElevatedButton.styleFrom(
                              shape: const StadiumBorder(),
                              backgroundColor: Colors.blueAccent,
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
    });
  }
}
