import 'package:ecommerce_app/MyOrders.dart';
import 'package:ecommerce_app/ProfileMainPage.dart';
import 'package:ecommerce_app/Settings.dart';
import 'package:ecommerce_app/provider/ProfileProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    ProfileProvider profileProvider = Provider.of<ProfileProvider>(context);
    if (profileProvider.currentPage == 'profile') {
      return ProfileMainPage(
        setCurrentPage: profileProvider.setCurrentPage,
      );
    } else if (profileProvider.currentPage == 'My Orders') {
      return MyOrders(
        setCurrentPage: profileProvider.setCurrentPage,
      );
    } else if (profileProvider.currentPage == 'Settings') {
      return Settings(
        setCurrentPage: profileProvider.setCurrentPage,
      );
    } else {
      return SizedBox();
    }
  }
}
