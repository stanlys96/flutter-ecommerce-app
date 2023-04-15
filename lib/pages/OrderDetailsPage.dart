import 'package:ecommerce_app/components/profile_page/OrderDetailBox.dart';
import 'package:ecommerce_app/models/OrderDetail.dart';

import 'package:flutter/material.dart';

class OrderDetailsPage extends StatelessWidget {
  static const String routeName = '/order-details';

  @override
  Widget build(BuildContext context) {
    OrderDetail orderDetail =
        ModalRoute.of(context)!.settings.arguments as OrderDetail;
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
                    children: [
                      Text(
                        'Order No. ${orderDetail.orderNumber ?? ""}',
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
                  const SizedBox(height: 16.0),
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
                      Text(
                        orderDetail.status ?? "",
                        style: TextStyle(
                          color: Color(0xFF2AA952),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    '${orderDetail.products?.length ?? 0} items',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  for (ProductDetail productDetail
                      in orderDetail.products ?? []) ...[
                    const SizedBox(height: 16.0),
                    OrderDetailBox(
                      name: productDetail.name ?? "",
                      imageUrl: productDetail.imageUrl ?? "",
                      subtitle: productDetail.subtitle ?? "",
                      color: productDetail.color ?? "",
                      size: productDetail.size ?? "",
                      amount: productDetail.amount ?? 0,
                      price: (int.tryParse(productDetail.price ?? "0") ?? 0) -
                          (int.tryParse(productDetail.discount ?? "0") ?? 0),
                    ),
                  ],
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
                          child: Text(
                            orderDetail.shippingAddress ?? "",
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
                          child: Text(
                            orderDetail.paymentMethod ?? "",
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
                          child: Text(
                            '${orderDetail.deliveryMethod ?? ""}, 1 second, \$${orderDetail.deliveryFee.toString()}',
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
                          child: Text(
                            '${orderDetail.discount ?? 0}%',
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
                          child: Text(
                            '\$${(orderDetail.totalAmount ?? 0) + (orderDetail.deliveryFee ?? 0)}',
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
