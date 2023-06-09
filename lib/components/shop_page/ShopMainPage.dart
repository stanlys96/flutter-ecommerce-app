import 'package:ecommerce_app/components/shop_page/ShopCategoryBox.dart';
import 'package:ecommerce_app/models/ShopCategory.dart';
import 'package:flutter/material.dart';

class ShopMainPage extends StatelessWidget {
  List<ShopCategory> shopCategoryData = [
    ShopCategory(id: "1", title: "New", imgUrl: "images/new.png"),
    ShopCategory(id: "2", title: "Clothes", imgUrl: "images/clothes.png"),
    ShopCategory(id: "3", title: "Shoes", imgUrl: "images/shoes.png"),
    ShopCategory(id: "4", title: "Accesories", imgUrl: "images/accesories.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 100.0,
              decoration: BoxDecoration(
                color: const Color(0xFFDB3022),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    'SUMMER SALES',
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    'Up to 50% off',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            for (ShopCategory categoryData in shopCategoryData) ...[
              ShopCategoryBox(
                title: categoryData.title,
                imgUrl: categoryData.imgUrl,
              ),
              const SizedBox(height: 16.0),
            ],
          ],
        ),
      ),
    );
  }
}
