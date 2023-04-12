import 'package:ecommerce_app/utils/constants.dart';
import 'package:flutter/material.dart';

class MyOrderCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
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
          const SizedBox(height: 12.5),
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
          const SizedBox(height: 12.5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: const TextSpan(
                  text: 'Quantity: ',
                  style: TextStyle(
                    color: Color(0xFF9B9B9B),
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: '3',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              RichText(
                text: const TextSpan(
                  text: 'Total Amount: ',
                  style: TextStyle(
                    color: Color(0xFF9B9B9B),
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: '\$112',
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
          const SizedBox(height: 12.5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: (MediaQuery.of(context).size.width - 20) * 0.3,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/order-details');
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    backgroundColor: Colors.white,
                    side: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  child: const Text(
                    'Details',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              const Text(
                'Delivered',
                style: TextStyle(
                  color: Color(0xFF2AA952),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
