import 'package:ecommerce_app/components/shop_page/ShopProductBox.dart';
import 'package:flutter/material.dart';

class ShopProductsPage extends StatelessWidget {
  final Function changeCurrentState;
  final String currentState;

  ShopProductsPage({
    required this.changeCurrentState,
    required this.currentState,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: currentState != "shop",
      child: Opacity(
        opacity: 1,
        child: SingleChildScrollView(
          child: Column(
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
                    changeCurrentState('shop');
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
                        currentState,
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
                  children: [
                    ShopProductBox(),
                    SizedBox(height: 32.0),
                    ShopProductBox(),
                    SizedBox(height: 32.0),
                    ShopProductBox(),
                    SizedBox(height: 32.0),
                    ShopProductBox(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
