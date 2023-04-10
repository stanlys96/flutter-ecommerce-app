import 'package:ecommerce_app/api/ApiService.dart';
import 'package:ecommerce_app/models/Product.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  bool isLoading = false;
  ApiService apiService = ApiService();

  List<Product> allProducts = [];

  List<Product> newProducts = [];
  List<Product> saleProducts = [];
  List<Product> clothesProducts = [];

  HomeProvider() {
    init();
  }

  void init() async {
    isLoading = true;
    try {
      ProductResponseModel? result = await apiService.getAllProducts();

      allProducts = result?.data ?? [];
      newProducts =
          allProducts.where((element) => element.category == "new").toList();
      saleProducts =
          allProducts.where((element) => element.category == "sale").toList();
      clothesProducts = allProducts
          .where((element) => element.productType == "clothes")
          .toList();
      isLoading = false;
    } catch (e) {
      print(e);
      isLoading = false;
    }
    isLoading = false;
    notifyListeners();
  }
}
