import 'package:ecommerce_app/components/profile_page/ProfileCategoryBox.dart';
import 'package:ecommerce_app/components/profile_page/MyOrders.dart';
import 'package:ecommerce_app/pages/Settings.dart';
import 'package:ecommerce_app/provider/MainProvider.dart';
import 'package:ecommerce_app/provider/ProfileProvider.dart';
import 'package:ecommerce_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:ui';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(builder: (context, mainProvider, child) {
      return Visibility(
        visible: mainProvider.currentPage == PageState.PROFILE,
        child: Opacity(
          opacity: 1 - (mainProvider.blurController?.value ?? 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "My Profile",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 34.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      children: [
                        Image.asset(
                          'images/profile_picture.png',
                          width: 64.0,
                          height: 64.0,
                        ),
                        SizedBox(width: 16.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Matilda Brown',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 2.5),
                            Text(
                              'matildabrown@mail.com',
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
              ProfileCategoryBox(
                title: 'My Orders',
                subTitle: '12 Orders',
                setCurrentPage: () {
                  mainProvider.setCurrentPage(PageState.MY_ORDERS);
                },
              ),
              ProfileCategoryBox(
                title: 'Shipping Addresses',
                subTitle: '3 Addresses',
                setCurrentPage: () {
                  mainProvider.serviceNotAvailable(context);
                },
              ),
              ProfileCategoryBox(
                title: 'Payment Methods',
                subTitle: 'Visa **34',
                setCurrentPage: () {
                  mainProvider.serviceNotAvailable(context);
                },
              ),
              ProfileCategoryBox(
                title: 'Promo Codes',
                subTitle: 'You have special Promo Codes',
                setCurrentPage: () {
                  mainProvider.serviceNotAvailable(context);
                },
              ),
              ProfileCategoryBox(
                title: 'My Reviews',
                subTitle: 'Reviewed 4 products',
                setCurrentPage: () {
                  mainProvider.serviceNotAvailable(context);
                },
              ),
              ProfileCategoryBox(
                title: 'Settings',
                subTitle: 'Notifications, password',
                setCurrentPage: () {
                  mainProvider.setCurrentPage(PageState.SETTINGS);
                },
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  padding: EdgeInsets.all(16.0),
                  child: SizedBox(
                    child: ElevatedButton(
                      onPressed: () {
                        mainProvider.setCurrentPage(PageState.HOME);
                        mainProvider.setPreviousPage(PageState.HOME);
                        Navigator.of(context).pushNamed('/auth');
                      },
                      child: Text('Log Out'),
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        backgroundColor: Color(0xFFDB3022),
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
