import 'package:ecommerce_app/BagPage.dart';
import 'package:ecommerce_app/FavoritesPage.dart';
import 'package:ecommerce_app/HomePage.dart';
import 'package:ecommerce_app/ProfilePage.dart';
import 'package:ecommerce_app/ShopPage.dart';
import 'package:ecommerce_app/provider/ProfileProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _widgetPages = <Widget>[
    HomePage(),
    ShopPage(),
    BagPage(),
    FavoritesPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(builder: (context, profileProvider, _) {
      return Scaffold(
        body: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xFFF9F9F9),
            ),
            child: _widgetPages[_selectedIndex],
          ),
        ),
        extendBody: true,
        bottomSheet: _selectedIndex == 2
            ? Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total amount:',
                          style: TextStyle(
                            color: Color(0xFF9B9B9B),
                          ),
                        ),
                        Text(
                          '\$124',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15.0),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('CHECK OUT'),
                        style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(),
                          backgroundColor: Color(0xFFDB3022),
                          padding: EdgeInsets.symmetric(vertical: 15.0),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : _selectedIndex == 4 && profileProvider.currentPage == 'Settings'
                ? Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.all(16.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('SAVE'),
                        style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(),
                          backgroundColor: Color(0xFFDB3022),
                          padding: EdgeInsets.symmetric(vertical: 15.0),
                        ),
                      ),
                    ),
                  )
                : SizedBox(),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30)),
            boxShadow: [
              BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
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
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.business),
                  label: 'Shop',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shop),
                  label: 'Bag',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.heart_broken),
                  label: 'Favorites',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.amber[800],
              onTap: _onItemTapped,
            ),
          ),
        ),
      );
    });
  }
}
