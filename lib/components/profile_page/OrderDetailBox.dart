import 'package:flutter/material.dart';

class OrderDetailBox extends StatelessWidget {
  String imageUrl;
  String name;
  String subtitle;
  String color;
  String size;
  int amount;
  int price;

  OrderDetailBox({
    required this.imageUrl,
    required this.name,
    required this.subtitle,
    required this.color,
    required this.size,
    required this.amount,
    required this.price,
  });

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
                  offset: const Offset(0, 1), // changes position of shadow
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
                        image: AssetImage(imageUrl),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: const BoxDecoration(
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
                          name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16.0),
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                          subtitle,
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Color(
                              0xFF9B9B9B,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Row(
                          children: [
                            RichText(
                              text: TextSpan(
                                text: 'Color: ',
                                style: TextStyle(
                                  color: Color(0xFF9B9B9B),
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: color,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 20.0),
                            RichText(
                              text: TextSpan(
                                text: 'Size: ',
                                style: TextStyle(
                                  color: Color(0xFF9B9B9B),
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: size,
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
                        const SizedBox(height: 10.0),
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
                                children: <TextSpan>[
                                  TextSpan(
                                    text: amount.toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              '\$${price * amount}',
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
