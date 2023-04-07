import 'package:ecommerce_app/MainPage.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/InputBox.dart';
import 'package:ecommerce_app/SocialIconBox.dart';

class SignUpPage extends StatefulWidget {
  static const String routeName = '/sign-up';

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("Fashionee"),
        backgroundColor: Colors.red,
        automaticallyImplyLeading: false,
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
                    'Sign Up',
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
                  SizedBox(
                    height: 20.0,
                  ),
                  InputBox(),
                  SizedBox(height: 20.0),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('/sign-in');
                    },
                    child: Text(
                      'Already have an account?',
                      textAlign: TextAlign.right,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/main');
                      },
                      child: Text('Sign Up'),
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
                      Text('Or sign up with social account'),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SocialIconBox(),
                            SizedBox(
                              width: 10.0,
                            ),
                            SocialIconBox(),
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
