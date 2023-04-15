import 'package:ecommerce_app/components/profile_page/MyOrderCard.dart';
import 'package:ecommerce_app/models/OrderDetail.dart';
import 'package:ecommerce_app/provider/HomeProvider.dart';
import 'package:ecommerce_app/provider/ProfileProvider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class MyOrders extends StatefulWidget {
  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
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
    return Consumer2<HomeProvider, ProfileProvider>(
        builder: (secondContext, homeProvider, profileProvider, child) {
      List<OrderDetail> orderResult = (homeProvider.currentUserOrders ?? [])
          .where((element) =>
              element.status?.toLowerCase() ==
              profileProvider.status.toLowerCase())
          .toList();
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
                            profileProvider.setStatus('delivered');
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            backgroundColor:
                                profileProvider.status == 'delivered'
                                    ? Colors.black
                                    : Colors.white,
                          ),
                          child: Text(
                            'Delivered',
                            style: TextStyle(
                              color: profileProvider.status == 'delivered'
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
                            profileProvider.setStatus('processing');
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            backgroundColor:
                                profileProvider.status == 'processing'
                                    ? Colors.black
                                    : Colors.white,
                          ),
                          child: Text(
                            'Processing',
                            style: TextStyle(
                              color: profileProvider.status == 'processing'
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
                            profileProvider.setStatus('cancelled');
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            backgroundColor:
                                profileProvider.status == 'cancelled'
                                    ? Colors.black
                                    : Colors.white,
                          ),
                          child: Text(
                            'Cancelled',
                            style: TextStyle(
                              color: profileProvider.status == 'cancelled'
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  orderResult.isEmpty
                      ? Column(
                          children: [
                            Lottie.asset(
                              'images/bag-empty.json',
                              width: double.infinity,
                            ),
                            const Text('No items for this category...'),
                          ],
                        )
                      : Column(
                          children: [
                            for (OrderDetail orderDetail in orderResult) ...[
                              const SizedBox(height: 16.0),
                              MyOrderCard(
                                orderDetail: orderDetail,
                              ),
                            ]
                          ],
                        )
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
