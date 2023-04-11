import 'package:ecommerce_app/components/profile_page/MyOrderCard.dart';
import 'package:ecommerce_app/provider/ProfileProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyOrders extends StatefulWidget {
  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  String currentCategory = "Delivered";
  String currentState = "Orders";
  ScrollController scrollController = ScrollController();

  void scrollToTop() {
    scrollController.animateTo(
      0,
      duration: Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    ProfileProvider profileProvider =
        Provider.of<ProfileProvider>(context, listen: false);
    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            padding: EdgeInsets.all(16.0),
            width: double.infinity,
            child: GestureDetector(
              onTap: () {
                profileProvider.setCurrentPage("Profile", context);
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
                    "My Orders",
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
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: (MediaQuery.of(context).size.width - 20) * 0.3,
                      child: ElevatedButton(
                        onPressed: () {
                          // setCurrentCategory('Delivered');
                        },
                        child: Text(
                          'Delivered',
                          style: TextStyle(
                            color: currentCategory == 'Delivered'
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(),
                          backgroundColor: currentCategory == 'Delivered'
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: (MediaQuery.of(context).size.width - 20) * 0.3,
                      child: ElevatedButton(
                        onPressed: () {
                          // setCurrentCategory('Processing');
                        },
                        child: Text(
                          'Processing',
                          style: TextStyle(
                            color: currentCategory == 'Processing'
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(),
                          backgroundColor: currentCategory == 'Processing'
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: (MediaQuery.of(context).size.width - 20) * 0.3,
                      child: ElevatedButton(
                        onPressed: () {
                          // setCurrentCategory('Cancelled');
                        },
                        child: Text(
                          'Cancelled',
                          style: TextStyle(
                            color: currentCategory == 'Cancelled'
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(),
                          backgroundColor: currentCategory == 'Cancelled'
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                MyOrderCard(),
                SizedBox(height: 16.0),
                MyOrderCard(),
                SizedBox(height: 16.0),
                MyOrderCard(),
                SizedBox(height: 16.0),
                MyOrderCard(),
                SizedBox(height: 16.0),
                MyOrderCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
