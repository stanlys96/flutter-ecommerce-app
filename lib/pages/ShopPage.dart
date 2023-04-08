import 'package:ecommerce_app/pages/ShopMainPage.dart';
import 'package:ecommerce_app/pages/ShopProductsPage.dart';
import 'package:flutter/material.dart';

class ShopPage extends StatefulWidget {
  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  String currentState = 'shop';

  void changeCurrentState(String newState) {
    setState(() {
      currentState = newState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ShopMainPage(
          changeCurrentState: changeCurrentState,
          currentState: currentState,
        ),
        ShopProductsPage(
            changeCurrentState: changeCurrentState, currentState: currentState),
      ],
    );
  }
}
