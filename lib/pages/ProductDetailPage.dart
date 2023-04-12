import 'package:ecommerce_app/components/StarsDummy.dart';
import 'package:ecommerce_app/models/Product.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductDetailsPage extends StatelessWidget {
  static const String routeName = '/product-details';

  @override
  Widget build(BuildContext context) {
    Product product = ModalRoute.of(context)!.settings.arguments as Product;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          product.name ?? "",
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 100.0),
              decoration: const BoxDecoration(
                color: Color(0xFFF9F9F9),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 413.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: product.imageDetailUrl?.length ?? 0,
                      itemBuilder: (context, index) {
                        String currentImage =
                            product.imageDetailUrl?[index] ?? "";
                        return Row(
                          children: [
                            Image.asset(currentImage),
                            const SizedBox(width: 10),
                          ],
                        );
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: (MediaQuery.of(context).size.width - 20) *
                                  0.4,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1.0,
                                  color: const Color.fromARGB(50, 0, 0, 0),
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(16.0),
                                ),
                              ),
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    'Size',
                                  ),
                                  Icon(
                                    Icons.arrow_drop_down,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: (MediaQuery.of(context).size.width - 20) *
                                  0.4,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1.0,
                                  color: const Color.fromARGB(50, 0, 0, 0),
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(16.0),
                                ),
                              ),
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    'Black',
                                  ),
                                  Icon(
                                    Icons.arrow_drop_down,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 3,
                                    offset: const Offset(
                                        0, 1), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: const FaIcon(
                                FontAwesomeIcons.heart,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.name ?? "",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 5.0),
                                Text(
                                  product.subtitle ?? "",
                                  style: const TextStyle(
                                    fontSize: 11.0,
                                    color: Color(0xFF9B9B9B),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '\$${((int.tryParse(product.price ?? "0") ?? 0) - (int.tryParse(product.discount ?? "0") ?? 0)).toString()}.00',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10.0),
                        const StarsDummy(),
                        const SizedBox(height: 10.0),
                        Text(
                          product.description ?? "",
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              backgroundColor: const Color(0xFFDB3022),
              padding: const EdgeInsets.symmetric(vertical: 15.0),
            ),
            child: const Text('ADD TO CART'),
          ),
        ),
      ),
    );
  }
}
