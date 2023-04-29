import 'package:ecommerce_app/components/home_page/ProductBox.dart';
import 'package:ecommerce_app/models/ChatScreenArguments.dart';
import 'package:ecommerce_app/models/Product.dart';
import 'package:ecommerce_app/provider/FavoritesProvider.dart';
import 'package:ecommerce_app/provider/HomeProvider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<HomeProvider, FavoritesProvider>(
        builder: (secondContext, homeProvider, favoritesProvider, child) {
      return Stack(
        alignment: Alignment.bottomRight,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height - 300.0,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('images/main_banner.png'),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Fashion',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 45.0),
                          ),
                          const Text(
                            'Sale',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 45.0),
                          ),
                          const SizedBox(height: 10.0),
                          SizedBox(
                            width: 150.0,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                shape: const StadiumBorder(),
                                backgroundColor: const Color(0xFFDB3022),
                              ),
                              child: const Text('Check'),
                            ),
                          ),
                          const SizedBox(height: 40.0),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 403,
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Text(
                            'Sale',
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('View All'),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      const Text(
                        "Super summer sale!",
                        style: TextStyle(
                          color: Color(0xFF9B9B9B),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      homeProvider.isLoading
                          ? Expanded(
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Lottie.asset(
                                      'images/loading-2.json',
                                      width: 200.0,
                                      height: 200.0,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Expanded(
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: homeProvider.saleProducts.length,
                                itemBuilder: (context, index) {
                                  Product currentProduct =
                                      homeProvider.saleProducts[index];
                                  return ProductBox(
                                    index: index,
                                    totalCount:
                                        homeProvider.saleProducts.length,
                                    product: currentProduct,
                                    userId: homeProvider.userId,
                                    userFavorites:
                                        homeProvider.currentUserFavorites ?? [],
                                  );
                                },
                              ),
                            ),
                    ],
                  ),
                ),
                Container(
                  height: 403,
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Text(
                            'New',
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('View All'),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      const Text(
                        "You've never seen it before!",
                        style: TextStyle(
                          color: Color(0xFF9B9B9B),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      homeProvider.isLoading
                          ? Expanded(
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Lottie.asset(
                                      'images/loading-2.json',
                                      width: 200.0,
                                      height: 200.0,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Expanded(
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: homeProvider.newProducts.length,
                                itemBuilder: (context, index) {
                                  Product currentProduct =
                                      homeProvider.newProducts[index];
                                  return ProductBox(
                                    index: index,
                                    totalCount: homeProvider.newProducts.length,
                                    product: currentProduct,
                                    userId: homeProvider.userId,
                                    userFavorites:
                                        homeProvider.currentUserFavorites ?? [],
                                  );
                                },
                              ),
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          !homeProvider.admin
              ? GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/chat',
                        arguments: ChatScreenArguments(
                            name: "Customer Support", toUser: 19));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      shape: BoxShape.circle,
                    ),
                    padding: EdgeInsets.all(20.0),
                    margin: EdgeInsets.all(20.0),
                    child: Icon(
                      Icons.chat_outlined,
                      color: Colors.white,
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      );
    });
  }
}
