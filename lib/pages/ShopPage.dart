import 'package:ecommerce_app/components/shop_page/ShopCategoryBox.dart';
import 'package:ecommerce_app/components/shop_page/ShopMainPage.dart';
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
  @override
  Widget build(BuildContext context) {
    return Consumer2<ShopProvider, HomeProvider>(
        builder: (secondContext, shopProvider, homeProvider, child) {
      if (shopProvider.currentPage == "Shop") {
        return ShopMainPage();
      } else {
        return ShopProductsPage(productsData: homeProvider.allProducts);
      }
    });
  }
}
