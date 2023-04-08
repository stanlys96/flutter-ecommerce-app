import 'package:ecommerce_app/components/InputBox.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  final Function(String, BuildContext) setCurrentPage;
  const Settings({required this.setCurrentPage});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          padding: EdgeInsets.all(16.0),
          width: double.infinity,
          child: GestureDetector(
            onTap: () {
              setCurrentPage('Profile', context);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.arrow_back,
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  "Settings",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 34.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Personal Information',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 16.0),
              InputBox(
                title: "Full Name",
                controller: nameController,
              ),
              SizedBox(height: 16.0),
              InputBox(
                title: "Email",
                controller: emailController,
              ),
              SizedBox(height: 32.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Password',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  InkWell(
                    child: Text(
                      'Change',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                        color: Color(0xFF9B9B9B),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              InputBox(
                title: "Password",
                controller: passwordController,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
