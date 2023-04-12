import 'package:ecommerce_app/components/profile_page/OrderDetailBox.dart';

import 'package:flutter/material.dart';

class OrderDetailsPage extends StatelessWidget {
  static const String routeName = '/order-details';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: const Text(
          "Order Details",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Order No. 1947034',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                      Text(
                        '05-12-2019',
                        style: TextStyle(
                          color: Color(0xFF9B9B9B),
                          fontSize: 14.0,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RichText(
                        text: const TextSpan(
                          text: 'Tracking number: ',
                          style: TextStyle(
                            color: Color(0xFF9B9B9B),
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'IW347543455',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Text(
                        'Delivered',
                        style: TextStyle(
                          color: Color(0xFF2AA952),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    '3 items',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  OrderDetailBox(),
                  const SizedBox(height: 16.0),
                  OrderDetailBox(),
                  const SizedBox(height: 16.0),
                  OrderDetailBox(),
                  const SizedBox(height: 32.0),
                  const Text(
                    'Order Information',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: (MediaQuery.of(context).size.width - 32) * 0.37,
                        child: const Text(
                          'Shipping Address: ',
                          style: TextStyle(
                            color: Color(0xFF9B9B9B),
                          ),
                        ),
                      ),
                      const SizedBox(width: 5.0),
                      Expanded(
                        child: SizedBox(
                          width:
                              (MediaQuery.of(context).size.width - 32) * 0.37,
                          child: const Text(
                            '3 Newbridge Court, Chino Hills, CA 91709, United States',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: (MediaQuery.of(context).size.width - 32) * 0.37,
                        child: const Text(
                          'Payment method: ',
                          style: TextStyle(
                            color: Color(0xFF9B9B9B),
                          ),
                        ),
                      ),
                      const SizedBox(width: 5.0),
                      Expanded(
                        child: SizedBox(
                          width:
                              (MediaQuery.of(context).size.width - 32) * 0.37,
                          child: const Text(
                            '**** **** **** 3947',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: (MediaQuery.of(context).size.width - 32) * 0.37,
                        child: const Text(
                          'Delivery method: ',
                          style: TextStyle(
                            color: Color(0xFF9B9B9B),
                          ),
                        ),
                      ),
                      const SizedBox(width: 5.0),
                      Expanded(
                        child: SizedBox(
                          width:
                              (MediaQuery.of(context).size.width - 32) * 0.37,
                          child: const Text(
                            'FedEx, 3 days, \$15',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: (MediaQuery.of(context).size.width - 32) * 0.37,
                        child: const Text(
                          'Discount: ',
                          style: TextStyle(
                            color: Color(0xFF9B9B9B),
                          ),
                        ),
                      ),
                      const SizedBox(width: 5.0),
                      Expanded(
                        child: SizedBox(
                          width:
                              (MediaQuery.of(context).size.width - 32) * 0.37,
                          child: const Text(
                            '10%',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: (MediaQuery.of(context).size.width - 32) * 0.37,
                        child: const Text(
                          'Total Amount: ',
                          style: TextStyle(
                            color: Color(0xFF9B9B9B),
                          ),
                        ),
                      ),
                      const SizedBox(width: 5.0),
                      Expanded(
                        child: SizedBox(
                          width:
                              (MediaQuery.of(context).size.width - 32) * 0.37,
                          child: const Text(
                            '\$133',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: (MediaQuery.of(context).size.width - 32) * 0.47,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            backgroundColor: Colors.white,
                            side: const BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          child: const Text(
                            'Reorder',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width - 32) * 0.47,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            backgroundColor: const Color(0xFFDB3022),
                          ),
                          child: const Text(
                            'Leave Feedback',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
