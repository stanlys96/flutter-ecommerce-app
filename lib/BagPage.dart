import 'package:ecommerce_app/BagProductBox.dart';
import 'package:flutter/material.dart';

class BagPage extends StatelessWidget {
  const BagPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "My Bag",
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Colors.black,
              fontSize: 34.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFFF9F9F9),
            ),
            child: Column(
              children: [
                SizedBox(height: 16.0),
                BagProductBox(),
                SizedBox(height: 32.0),
                BagProductBox(),
                SizedBox(height: 32.0),
                BagProductBox(),
                SizedBox(height: 32.0),
                BagProductBox(),
                SizedBox(height: 32.0),
                BagProductBox(),
                SizedBox(height: 32.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}