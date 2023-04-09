import 'package:ecommerce_app/components/home_page/ProductBox.dart';
import 'package:ecommerce_app/models/Product.dart';
import 'package:ecommerce_app/provider/HomeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (homeContext, homeProvider, child) {
      return SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 300.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('images/main_banner.png'),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Fashion',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 45.0),
                      ),
                      Text(
                        'Sale',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 45.0),
                      ),
                      SizedBox(height: 10.0),
                      SizedBox(
                        width: 150.0,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text('Check'),
                          style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            backgroundColor: Color(0xFFDB3022),
                          ),
                        ),
                      ),
                      SizedBox(height: 40.0),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height - 427,
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
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
                  SizedBox(height: 10.0),
                  Text(
                    "Super summer sale!",
                    style: TextStyle(
                      color: Color(0xFF9B9B9B),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  homeProvider.isLoading
                      ? Expanded(
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircularProgressIndicator(),
                                SizedBox(height: 30.0),
                                Text('Loading data... Please wait...')
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
                                totalCount: homeProvider.saleProducts.length,
                                product: currentProduct,
                              );
                            },
                          ),
                        ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 427,
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
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
                  SizedBox(height: 10.0),
                  Text(
                    "You've never seen it before!",
                    style: TextStyle(
                      color: Color(0xFF9B9B9B),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  homeProvider.isLoading
                      ? Expanded(
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircularProgressIndicator(),
                                SizedBox(height: 30.0),
                                Text('Loading data... Please wait...')
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
                              );
                            },
                          ),
                        ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
