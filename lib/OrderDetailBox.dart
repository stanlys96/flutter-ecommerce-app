import 'package:ecommerce_app/ProductDetailPage.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/StarsDummy.dart';

class OrderDetailBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: (MediaQuery.of(context).size.width - 32) * 0.30,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('images/pullover.png'),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(8.0),
                        topRight: Radius.circular(8.0),
                      ),
                      color: Colors.white,
                    ),
                    width: (MediaQuery.of(context).size.width - 32) * 0.70,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Pullover',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16.0),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          'Mango',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Color(
                              0xFF9B9B9B,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          children: [
                            RichText(
                              text: TextSpan(
                                text: 'Color: ',
                                style: TextStyle(
                                  color: Color(0xFF9B9B9B),
                                ),
                                children: const <TextSpan>[
                                  TextSpan(
                                    text: 'Gray',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 20.0),
                            RichText(
                              text: TextSpan(
                                text: 'Size: ',
                                style: TextStyle(
                                  color: Color(0xFF9B9B9B),
                                ),
                                children: const <TextSpan>[
                                  TextSpan(
                                    text: 'L',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: 'Units: ',
                                style: TextStyle(
                                  color: Color(0xFF9B9B9B),
                                ),
                                children: const <TextSpan>[
                                  TextSpan(
                                    text: '1',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              '\$15',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
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
        ],
      ),
    );
  }
}
