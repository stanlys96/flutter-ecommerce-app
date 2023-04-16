import 'package:another_flushbar/flushbar.dart';
import 'package:ecommerce_app/components/InputBox.dart';
import 'package:ecommerce_app/provider/HomeProvider.dart';
import 'package:ecommerce_app/provider/ProfileProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController =
      TextEditingController(text: "********");

  @override
  Widget build(BuildContext context) {
    return Consumer2<HomeProvider, ProfileProvider>(
        builder: (secondContext, homeProvider, profileProvider, child) {
      nameController.text = homeProvider.name;
      emailController.text = homeProvider.email;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(16.0),
                width: double.infinity,
                child: GestureDetector(
                  onTap: () {
                    profileProvider.setCurrentPage("Profile", context);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
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
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Personal Information',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    InputBox(
                      title: "Full Name",
                      controller: nameController,
                    ),
                    const SizedBox(height: 16.0),
                    InputBox(
                      title: "Email",
                      controller: emailController,
                    ),
                    const SizedBox(height: 32.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
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
                    const SizedBox(height: 16.0),
                    InputBox(
                      title: "Password",
                      controller: passwordController,
                      disabled: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  await Flushbar(
                    flushbarPosition: FlushbarPosition.TOP,
                    title: "Not available",
                    message: "Service not available yet",
                    duration: const Duration(milliseconds: 1500),
                    backgroundColor: Colors.orange,
                  ).show(context);
                },
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  backgroundColor: const Color(0xFFDB3022),
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                ),
                child: const Text('SAVE'),
              ),
            ),
          )
        ],
      );
    });
  }
}
