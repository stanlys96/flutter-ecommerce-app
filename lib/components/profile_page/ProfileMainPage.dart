import 'package:another_flushbar/flushbar.dart';
import 'package:ecommerce_app/components/profile_page/ProfileCategoryBox.dart';
import 'package:ecommerce_app/provider/HomeProvider.dart';
import 'package:ecommerce_app/provider/ProfileProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileMainPage extends StatelessWidget {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  @override
  Widget build(BuildContext context) {
    return Consumer2<HomeProvider, ProfileProvider>(
        builder: (secondContext, homeProvider, profileProvider, child) {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "My Profile",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 34.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    children: [
                      Image.asset(
                        'images/people.png',
                        width: 84,
                        height: 84,
                      ),
                      const SizedBox(width: 16.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            homeProvider.name,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 2.5),
                          Text(
                            homeProvider.email,
                            style: TextStyle(
                              color: Color(0xFF9B9B9B),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            homeProvider.admin
                ? ProfileCategoryBox(
                    title: 'My Chats',
                    subTitle: '1 Chat',
                    setCurrentPage: () {
                      profileProvider.setCurrentPage("My Chats", context);
                    },
                  )
                : const SizedBox(),
            ProfileCategoryBox(
              title: 'My Orders',
              subTitle: '12 Orders',
              setCurrentPage: () {
                profileProvider.setCurrentPage("My Orders", context);
              },
            ),
            ProfileCategoryBox(
              title: 'Shipping Addresses',
              subTitle: '3 Addresses',
              setCurrentPage: () async {
                await Flushbar(
                  flushbarPosition: FlushbarPosition.TOP,
                  title: "Not available",
                  message: "Service not available yet",
                  duration: const Duration(milliseconds: 1500),
                  backgroundColor: Colors.orange,
                ).show(context);
              },
            ),
            ProfileCategoryBox(
              title: 'Payment Methods',
              subTitle: 'Visa **34',
              setCurrentPage: () async {
                await Flushbar(
                  flushbarPosition: FlushbarPosition.TOP,
                  title: "Not available",
                  message: "Service not available yet",
                  duration: const Duration(milliseconds: 1500),
                  backgroundColor: Colors.orange,
                ).show(context);
              },
            ),
            ProfileCategoryBox(
              title: 'Promo Codes',
              subTitle: 'You have special Promo Codes',
              setCurrentPage: () async {
                await Flushbar(
                  flushbarPosition: FlushbarPosition.TOP,
                  title: "Not available",
                  message: "Service not available yet",
                  duration: const Duration(milliseconds: 1500),
                  backgroundColor: Colors.orange,
                ).show(context);
              },
            ),
            ProfileCategoryBox(
              title: 'My Reviews',
              subTitle: 'Reviewed 4 products',
              setCurrentPage: () async {
                await Flushbar(
                  flushbarPosition: FlushbarPosition.TOP,
                  title: "Not available",
                  message: "Service not available yet",
                  duration: const Duration(milliseconds: 1500),
                  backgroundColor: Colors.orange,
                ).show(context);
              },
            ),
            ProfileCategoryBox(
              title: 'Settings',
              subTitle: 'Notifications, password',
              setCurrentPage: () {
                profileProvider.setCurrentPage("Settings", context);
              },
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  child: ElevatedButton(
                    onPressed: () async {
                      final SharedPreferences prefs = await _prefs;
                      await prefs.remove('member');
                      Navigator.of(context).pushNamed('/auth');
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      backgroundColor: const Color(0xFFDB3022),
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                    ),
                    child: const Text('Log Out'),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
