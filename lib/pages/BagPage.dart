import 'package:ecommerce_app/components/bag_page/BagProductBox.dart';
import 'package:ecommerce_app/models/Product.dart';
import 'package:ecommerce_app/models/UserCart.dart';
import 'package:ecommerce_app/provider/HomeProvider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class BagPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
        builder: (secondContext, homeProvider, child) {
      int total = 0;
      homeProvider.userCart?.forEach((element) {
        total += (element.amount ?? 0) *
            ((int.tryParse(element.price ?? "0") ?? 0) -
                (int.tryParse(element.discount ?? "0") ?? 0));
      });
      return Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          SingleChildScrollView(
            child: Container(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
              padding: const EdgeInsets.only(
                top: 16.0,
                right: 16.0,
                left: 16.0,
                bottom: 100.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "My Bag",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 34.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color(0xFFF9F9F9),
                    ),
                    child: homeProvider.userCart?.length == 0
                        ? Column(
                            children: [
                              Lottie.asset(
                                'images/bag-empty.json',
                                width: double.infinity,
                              ),
                              const Text('No items added to bag...'),
                            ],
                          )
                        : Column(
                            children: [
                              for (int i = 0;
                                  i < (homeProvider.userCart?.length ?? 0);
                                  i++) ...[
                                i != 0
                                    ? SizedBox(height: 32.0)
                                    : SizedBox(height: 16.0),
                                BagProductBox(
                                  amount: homeProvider.userCart?[i].amount ?? 0,
                                  product: Product(
                                    id: homeProvider.userCart?[i].productId,
                                    name: homeProvider.userCart?[i].name,
                                    category:
                                        homeProvider.userCart?[i].category,
                                    subtitle:
                                        homeProvider.userCart?[i].subtitle,
                                    price: homeProvider.userCart?[i].price,
                                    discount:
                                        homeProvider.userCart?[i].discount,
                                    size: homeProvider.userCart?[i].size,
                                    color: homeProvider.userCart?[i].color,
                                    description:
                                        homeProvider.userCart?[i].description,
                                    rating: homeProvider.userCart?[i].rating,
                                    reviews: homeProvider.userCart?[i].reviews,
                                    stock: homeProvider.userCart?[i].stock,
                                    imageUrl:
                                        homeProvider.userCart?[i].imageUrl,
                                    imageDetailUrl: homeProvider
                                        .userCart?[i].imageDetailUrl,
                                    productType:
                                        homeProvider.userCart?[i].productType,
                                  ),
                                ),
                              ],
                            ],
                          ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(16.0),
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
                      '\$$total',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15.0),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/checkout');
                    },
                    child: const Text('CHECK OUT'),
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      backgroundColor: const Color(0xFFDB3022),
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      );
    });
  }
}
