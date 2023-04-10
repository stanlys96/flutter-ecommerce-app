import 'package:ecommerce_app/components/shop_page/ShopProductBox.dart';
import 'package:ecommerce_app/models/Product.dart';
import 'package:ecommerce_app/provider/MainProvider.dart';
import 'package:ecommerce_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class ShopProductsPage extends StatelessWidget {
  final List<Product> productsData;

  ShopProductsPage({
    required this.productsData,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
        builder: (secondContext, mainProvider, child) {
      List<Product> currentProducts = productsData
          .where((element) =>
              element.productType?.toLowerCase() ==
                  mainProvider.currentProductType.toLowerCase() ||
              element.category?.toLowerCase() ==
                  mainProvider.currentProductCategory.toLowerCase())
          .toList();
      return Visibility(
        visible: mainProvider.currentPage == PageState.SHOP_PRODUCTS,
        child: Opacity(
          opacity: 1 - (mainProvider.blurController?.value ?? 0),
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
                      mainProvider.setCurrentPage(PageState.SHOP);
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
                          mainProvider.currentProductCategory == ""
                              ? mainProvider.currentProductType
                              : mainProvider.currentProductCategory,
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
                  child: currentProducts.length > 0
                      ? Column(
                          children: [
                            for (Product currentProduct in currentProducts) ...[
                              ShopProductBox(
                                currentProduct: currentProduct,
                                setCurrentPage: mainProvider.setCurrentPage,
                                setPreviousPage: mainProvider.setPreviousPage,
                              ),
                              SizedBox(height: 32.0),
                            ],
                          ],
                        )
                      : Column(
                          children: [
                            Lottie.asset(
                              'images/empty.json',
                              width: double.infinity,
                            ),
                            Text('No products to display for this category...'),
                          ],
                        ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
