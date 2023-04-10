import 'package:ecommerce_app/components/shop_page/ShopCategoryBox.dart';
import 'package:ecommerce_app/models/ShopCategory.dart';
import 'package:ecommerce_app/pages/ShopProductsPage.dart';
import 'package:ecommerce_app/provider/HomeProvider.dart';
import 'package:ecommerce_app/provider/MainProvider.dart';
import 'package:ecommerce_app/provider/ShopProvider.dart';
import 'package:ecommerce_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  List<ShopCategory> shopCategoryData = [
    ShopCategory(id: "1", title: "New", imgUrl: "images/new.png"),
    ShopCategory(id: "2", title: "Clothes", imgUrl: "images/clothes.png"),
    ShopCategory(id: "3", title: "Shoes", imgUrl: "images/shoes.png"),
    ShopCategory(id: "4", title: "Accesories", imgUrl: "images/accesories.png"),
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer3<ShopProvider, HomeProvider, MainProvider>(builder:
        (secondContext, shopProvider, homeProvider, mainProvider, child) {
      return Visibility(
        visible: mainProvider.currentPage == PageState.SHOP,
        child: Opacity(
          opacity: 1 - (mainProvider.blurController?.value ?? 0),
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: Color(0xFFDB3022),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
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
                  SizedBox(height: 16.0),
                  for (ShopCategory categoryData in shopCategoryData) ...[
                    ShopCategoryBox(
                      changeCurrentState: mainProvider.setCurrentPage,
                      changeProductCategory:
                          mainProvider.setCurrentProductCategory,
                      changeProductType: mainProvider.setCurrentProductType,
                      title: categoryData.title,
                      imgUrl: categoryData.imgUrl,
                    ),
                    SizedBox(height: 16.0),
                  ],
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
