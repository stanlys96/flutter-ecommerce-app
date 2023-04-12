import 'package:ecommerce_app/components/bag_page/BagProductBox.dart';
import 'package:ecommerce_app/provider/MainProvider.dart';
import 'package:ecommerce_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BagPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(
              top: 16.0,
              right: 16.0,
              left: 16.0,
              bottom: 100.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
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
                  decoration: const BoxDecoration(
                    color: Color(0xFFF9F9F9),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 16.0),
                      BagProductBox(),
                      const SizedBox(height: 32.0),
                      BagProductBox(),
                      const SizedBox(height: 32.0),
                      BagProductBox(),
                      const SizedBox(height: 32.0),
                      BagProductBox(),
                      const SizedBox(height: 32.0),
                      BagProductBox(),
                      const SizedBox(height: 32.0),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Total amount:',
                    style: TextStyle(
                      color: Color(0xFF9B9B9B),
                    ),
                  ),
                  Text(
                    '\$124',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('CHECK OUT'),
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    backgroundColor: const Color(0xFFDB3022),
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
