import 'package:ecommerce_app/utils/constants.dart';
import 'package:flutter/material.dart';

class MyOrderCard extends StatelessWidget {
  final Function setCurrentState;
  const MyOrderCard({required this.setCurrentState});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
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
          SizedBox(height: 12.5),
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
          SizedBox(height: 12.5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Quantity: ',
                  style: TextStyle(
                    color: Color(0xFF9B9B9B),
                  ),
                  children: const <TextSpan>[
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
                text: TextSpan(
                  text: 'Total Amount: ',
                  style: TextStyle(
                    color: Color(0xFF9B9B9B),
                  ),
                  children: const <TextSpan>[
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
          SizedBox(height: 12.5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: (MediaQuery.of(context).size.width - 20) * 0.3,
                child: ElevatedButton(
                  onPressed: () {
                    setCurrentState(PageState.MY_ORDER_DETAILS);
                  },
                  child: Text(
                    'Details',
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
              Text(
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
