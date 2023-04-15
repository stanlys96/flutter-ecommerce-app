import 'package:ecommerce_app/models/OrderDetail.dart';
import 'package:ecommerce_app/utils/constants.dart';
import 'package:flutter/material.dart';

class MyOrderCard extends StatelessWidget {
  OrderDetail orderDetail;

  MyOrderCard({
    required this.orderDetail,
  });

  @override
  Widget build(BuildContext context) {
    int quantity = 0;
    orderDetail.products?.forEach((element) => quantity += element.amount ?? 0);
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
            children: [
              Text(
                'Order No. ${orderDetail.orderNumber}',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              Text(
                orderDetail.orderDate?.substring(0, 10) ?? "",
                style: TextStyle(
                  color: Color(0xFF9B9B9B),
                  fontSize: 14.0,
                ),
              )
            ],
          ),
          const SizedBox(height: 12.5),
          RichText(
            text: TextSpan(
              text: 'Tracking number: ',
              style: TextStyle(
                color: Color(0xFF9B9B9B),
              ),
              children: <TextSpan>[
                TextSpan(
                  text: orderDetail.trackingNumber ?? "",
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
                text: TextSpan(
                  text: 'Quantity: ',
                  style: TextStyle(
                    color: Color(0xFF9B9B9B),
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: quantity.toString(),
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
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          '\$${(orderDetail.totalAmount ?? 0) + (orderDetail.deliveryFee ?? 0)}',
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
                    Navigator.of(context)
                        .pushNamed('/order-details', arguments: orderDetail);
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
