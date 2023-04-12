import 'package:ecommerce_app/components/profile_page/MyOrders.dart';
import 'package:ecommerce_app/components/profile_page/ProfileMainPage.dart';
import 'package:ecommerce_app/pages/Settings.dart';
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
    return Consumer<ProfileProvider>(
        builder: (secondContext, profileProvider, child) {
      if (profileProvider.currentPage == "Profile") {
        return ProfileMainPage();
      } else if (profileProvider.currentPage == "Settings") {
        return Settings();
      } else if (profileProvider.currentPage == "My Orders") {
        return MyOrders();
      } else {
        return const SizedBox();
      }
    });
  }
}
