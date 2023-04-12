import 'package:ecommerce_app/components/shop_page/ShopProductBox.dart';
import 'package:ecommerce_app/models/Product.dart';
import 'package:ecommerce_app/provider/ShopProvider.dart';
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
    ShopProvider shopProvider =
        Provider.of<ShopProvider>(context, listen: false);
    List<Product> currentProducts = productsData
        .where((element) =>
            element.productType?.toLowerCase() ==
                shopProvider.currentPage.toLowerCase() ||
            element.category?.toLowerCase() ==
                shopProvider.currentPage.toLowerCase())
        .toList();
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(16.0),
            width: double.infinity,
            child: GestureDetector(
              onTap: () {
                shopProvider.setCurrentPage("Shop");
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.arrow_back,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Text(
                    shopProvider.currentPage,
                    style: const TextStyle(
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
            padding: const EdgeInsets.all(16.0),
            child: currentProducts.isNotEmpty
                ? Column(
                    children: [
                      for (Product currentProduct in currentProducts) ...[
                        ShopProductBox(
                          currentProduct: currentProduct,
                        ),
                        const SizedBox(height: 32.0),
                      ],
                    ],
                  )
                : Column(
                    children: [
                      Lottie.asset(
                        'images/empty.json',
                        width: double.infinity,
                      ),
                      const Text('No products to display for this category...'),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
