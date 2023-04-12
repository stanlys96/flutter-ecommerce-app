import 'package:ecommerce_app/pages/BagPage.dart';
import 'package:ecommerce_app/pages/FavoritesPage.dart';
import 'package:ecommerce_app/pages/HomePage.dart';
import 'package:ecommerce_app/pages/ProfilePage.dart';
import 'package:ecommerce_app/pages/ShopPage.dart';
import 'package:ecommerce_app/provider/HomeProvider.dart';
import 'package:ecommerce_app/provider/MainProvider.dart';
import 'package:ecommerce_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  static const String routeName = '/main';

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _listPages = [
    HomePage(),
    ShopPage(),
    BagPage(),
    FavoritesPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer2<MainProvider, HomeProvider>(
        builder: (context, mainProvider, homeProvider, child) {
      return Scaffold(
        body: SafeArea(
          child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFF9F9F9),
              ),
              child: _listPages[_selectedIndex]),
        ),
        extendBody: true,
        bottomNavigationBar:
            mainProvider.currentPage != PageState.PRODUCT_DETAILS
                ? Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black38,
                            spreadRadius: 0,
                            blurRadius: 10),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      ),
                      child: BottomNavigationBar(
                        type: BottomNavigationBarType.fixed,
                        items: const <BottomNavigationBarItem>[
                          BottomNavigationBarItem(
                            icon: FaIcon(
                              FontAwesomeIcons.house,
                            ),
                            label: 'Home',
                          ),
                          BottomNavigationBarItem(
                            icon: FaIcon(
                              FontAwesomeIcons.shopify,
                            ),
                            label: 'Shop',
                          ),
                          BottomNavigationBarItem(
                            icon: FaIcon(
                              FontAwesomeIcons.cartShopping,
                            ),
                            label: 'Bag',
                          ),
                          BottomNavigationBarItem(
                            icon: FaIcon(
                              FontAwesomeIcons.solidHeart,
                            ),
                            label: 'Favorites',
                          ),
                          BottomNavigationBarItem(
                            icon: FaIcon(
                              FontAwesomeIcons.solidUser,
                            ),
                            label: 'Profile',
                          ),
                        ],
                        currentIndex: _selectedIndex,
                        selectedItemColor: Colors.amber[800],
                        onTap: _onItemTapped,
                      ),
                    ),
                  )
                : const SizedBox(),
      );
    });
  }
}
