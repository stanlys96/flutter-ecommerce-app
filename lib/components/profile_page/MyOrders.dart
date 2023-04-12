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
      duration: const Duration(milliseconds: 500),
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
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(16.0),
            width: double.infinity,
            child: GestureDetector(
              onTap: () {
                profileProvider.setCurrentPage("Profile", context);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
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
            padding: const EdgeInsets.all(10.0),
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
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          backgroundColor: currentCategory == 'Delivered'
                              ? Colors.black
                              : Colors.white,
                        ),
                        child: Text(
                          'Delivered',
                          style: TextStyle(
                            color: currentCategory == 'Delivered'
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: (MediaQuery.of(context).size.width - 20) * 0.3,
                      child: ElevatedButton(
                        onPressed: () {
                          // setCurrentCategory('Processing');
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          backgroundColor: currentCategory == 'Processing'
                              ? Colors.black
                              : Colors.white,
                        ),
                        child: Text(
                          'Processing',
                          style: TextStyle(
                            color: currentCategory == 'Processing'
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: (MediaQuery.of(context).size.width - 20) * 0.3,
                      child: ElevatedButton(
                        onPressed: () {
                          // setCurrentCategory('Cancelled');
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          backgroundColor: currentCategory == 'Cancelled'
                              ? Colors.black
                              : Colors.white,
                        ),
                        child: Text(
                          'Cancelled',
                          style: TextStyle(
                            color: currentCategory == 'Cancelled'
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                MyOrderCard(),
                const SizedBox(height: 16.0),
                MyOrderCard(),
                const SizedBox(height: 16.0),
                MyOrderCard(),
                const SizedBox(height: 16.0),
                MyOrderCard(),
                const SizedBox(height: 16.0),
                MyOrderCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
