import 'package:ecommerce_app/components/profile_page/OrderDetailBox.dart';
import 'package:ecommerce_app/provider/MainProvider.dart';
import 'package:ecommerce_app/utils/constants.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyOrderDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
        builder: (secondContext, mainProvider, child) {
      return Visibility(
        visible: mainProvider.currentPage == PageState.MY_ORDER_DETAILS,
        child: Opacity(
          opacity: 1 - (mainProvider.blurController?.value ?? 0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 56.0,
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          mainProvider.setCurrentPage(PageState.MY_ORDERS);
                        },
                        child: Icon(
                          Icons.arrow_back,
                          size: 24.0,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 20 - 24,
                        child: Text(
                          "Order Details",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
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
                      SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: 'Tracking number: ',
                              style: TextStyle(
                                color: Color(0xFF9B9B9B),
                              ),
                              children: const <TextSpan>[
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
                          Text(
                            'Delivered',
                            style: TextStyle(
                              color: Color(0xFF2AA952),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        '3 items',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      OrderDetailBox(),
                      SizedBox(height: 16.0),
                      OrderDetailBox(),
                      SizedBox(height: 16.0),
                      OrderDetailBox(),
                      SizedBox(height: 32.0),
                      Text(
                        'Order Information',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width:
                                (MediaQuery.of(context).size.width - 32) * 0.37,
                            child: Text(
                              'Shipping Address: ',
                              style: TextStyle(
                                color: Color(0xFF9B9B9B),
                              ),
                            ),
                          ),
                          SizedBox(width: 5.0),
                          Expanded(
                            child: Container(
                              width: (MediaQuery.of(context).size.width - 32) *
                                  0.37,
                              child: Text(
                                '3 Newbridge Court, Chino Hills, CA 91709, United States',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width:
                                (MediaQuery.of(context).size.width - 32) * 0.37,
                            child: Text(
                              'Payment method: ',
                              style: TextStyle(
                                color: Color(0xFF9B9B9B),
                              ),
                            ),
                          ),
                          SizedBox(width: 5.0),
                          Expanded(
                            child: Container(
                              width: (MediaQuery.of(context).size.width - 32) *
                                  0.37,
                              child: Text(
                                '**** **** **** 3947',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width:
                                (MediaQuery.of(context).size.width - 32) * 0.37,
                            child: Text(
                              'Delivery method: ',
                              style: TextStyle(
                                color: Color(0xFF9B9B9B),
                              ),
                            ),
                          ),
                          SizedBox(width: 5.0),
                          Expanded(
                            child: Container(
                              width: (MediaQuery.of(context).size.width - 32) *
                                  0.37,
                              child: Text(
                                'FedEx, 3 days, \$15',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width:
                                (MediaQuery.of(context).size.width - 32) * 0.37,
                            child: Text(
                              'Discount: ',
                              style: TextStyle(
                                color: Color(0xFF9B9B9B),
                              ),
                            ),
                          ),
                          SizedBox(width: 5.0),
                          Expanded(
                            child: Container(
                              width: (MediaQuery.of(context).size.width - 32) *
                                  0.37,
                              child: Text(
                                '10%',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width:
                                (MediaQuery.of(context).size.width - 32) * 0.37,
                            child: Text(
                              'Total Amount: ',
                              style: TextStyle(
                                color: Color(0xFF9B9B9B),
                              ),
                            ),
                          ),
                          SizedBox(width: 5.0),
                          Expanded(
                            child: Container(
                              width: (MediaQuery.of(context).size.width - 32) *
                                  0.37,
                              child: Text(
                                '\$133',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width:
                                (MediaQuery.of(context).size.width - 32) * 0.47,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                'Reorder',
                                style: TextStyle(color: Colors.black),
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: StadiumBorder(),
                                backgroundColor: Colors.white,
                                side: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width:
                                (MediaQuery.of(context).size.width - 32) * 0.47,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                'Leave Feedback',
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: StadiumBorder(),
                                backgroundColor: Color(0xFFDB3022),
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
        ),
      );
    });
  }
}
