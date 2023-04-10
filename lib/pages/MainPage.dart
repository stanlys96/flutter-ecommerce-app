import 'package:ecommerce_app/components/profile_page/MyOrderDetails.dart';
import 'package:ecommerce_app/components/profile_page/MyOrders.dart';
import 'package:ecommerce_app/pages/BagPage.dart';
import 'package:ecommerce_app/pages/FavoritesPage.dart';
import 'package:ecommerce_app/pages/HomePage.dart';
import 'package:ecommerce_app/pages/ProductDetailPage.dart';
import 'package:ecommerce_app/pages/ProfilePage.dart';
import 'package:ecommerce_app/pages/Settings.dart';
import 'package:ecommerce_app/pages/ShopPage.dart';
import 'package:ecommerce_app/pages/ShopProductsPage.dart';
import 'package:ecommerce_app/provider/HomeProvider.dart';
import 'package:ecommerce_app/provider/MainProvider.dart';
import 'package:ecommerce_app/provider/ProfileProvider.dart';
import 'package:ecommerce_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'dart:ui';

PageState getCorrectPageState(int index) {
  switch (index) {
    case 0:
      return PageState.HOME;
    case 1:
      return PageState.SHOP;
    case 2:
      return PageState.BAG;
    case 3:
      return PageState.FAVORITES;
    case 4:
      return PageState.PROFILE;
    default:
      return PageState.HOME;
  }
}

class MainPage extends StatefulWidget {
  static const String routeName = '/main';

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;

  void _onItemTapped(int index, BuildContext context) {
    setState(() {
      _selectedIndex = index;
      Provider.of<MainProvider>(context, listen: false)
          .setCurrentPage(getCorrectPageState(index));
      print("????");
    });
  }

  Animation<double>? _blurAnimation;
  AnimationController? _blurController;

  Animation<double> _animation() {
    return Tween<double>(begin: 0.0, end: 1.0).animate(_blurController!)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          if (Provider.of<MainProvider>(context, listen: false).page !=
              PageState.IDLE) {
            Provider.of<MainProvider>(context, listen: false).switchState();
            Provider.of<MainProvider>(context, listen: false)
                .blurController
                ?.reverse();
          }
        } else if (status == AnimationStatus.dismissed) {
          //controller.forward();
        }
      });
  }

  AnimationController _controller() {
    return AnimationController(
        vsync: this, duration: Duration(milliseconds: 350));
  }

  Widget _blur() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: BackdropFilter(
        filter: ImageFilter.blur(
            sigmaX:
                Provider.of<MainProvider>(context, listen: false).currentPage ==
                        PageState.HOME
                    ? 6.0
                    : (_blurAnimation?.value ?? 1) * 6,
            sigmaY:
                Provider.of<MainProvider>(context, listen: false).currentPage ==
                        PageState.HOME
                    ? 6.0
                    : (_blurAnimation?.value ?? 1) * 6),
        child: Container(
            //color: Colors.black87.withOpacity(0.1),
            ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    _blurController = _controller();
    _blurAnimation = _animation();
    Provider.of<MainProvider>(context, listen: false).blurController =
        _blurController;
  }

  @override
  void dispose() {
    _blurAnimation = null;
    _blurController = null;
    Provider.of<MainProvider>(context, listen: false).blurController = null;
  }

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
            child: Stack(
              children: [
                _blur(),
                HomePage(),
                ShopPage(),
                BagPage(),
                FavoritesPage(),
                ProfilePage(),
                MyOrders(),
                Settings(),
                MyOrderDetails(),
                ShopProductsPage(productsData: homeProvider.allProducts),
                ProductDetailsPage(),
              ],
            ),
          ),
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
                        onTap: (int index) => _onItemTapped(index, context),
                      ),
                    ),
                  )
                : SizedBox(),
      );
    });
  }
}
