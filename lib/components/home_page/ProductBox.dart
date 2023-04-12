import 'package:ecommerce_app/components/StarsDummy.dart';
import 'package:ecommerce_app/models/Product.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductBox extends StatelessWidget {
  final int index;
  final int totalCount;
  final Product product;

  const ProductBox({
    required this.index,
    required this.totalCount,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/product-details', arguments: product);
      },
      child: Container(
        margin: index != totalCount - 1
            ? const EdgeInsets.only(right: 10.0)
            : EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.bottomRight,
                  children: [
                    Image.asset(product.imageUrl ?? ""),
                    Positioned(
                      bottom: -22.5,
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 3,
                              offset:
                                  const Offset(0, 1), // changes position of shadow
                            ),
                          ],
                        ),
                        child: const FaIcon(
                          FontAwesomeIcons.heart,
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  margin: const EdgeInsets.all(5.0),
                  padding: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: product.category?.toUpperCase() == "SALE"
                        ? Colors.red
                        : Colors.black,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    product.category?.toUpperCase() ?? "",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5.0),
            const StarsDummy(),
            const SizedBox(height: 5.0),
            Text(
              product.subtitle ?? "",
              style: const TextStyle(
                fontSize: 12.0,
                color: Color(0xFF9B9B9B),
              ),
            ),
            const SizedBox(height: 5.0),
            Text(
              product.name ?? "",
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5.0),
            Row(
              children: [
                Text(
                  '\$${product.price.toString()}',
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF9B9B9B),
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                const SizedBox(width: 5.0),
                Text(
                  '\$${((int.tryParse(product.price ?? "0") ?? 0) - (int.tryParse(product.discount ?? "0") ?? 0)).toString()}',
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFDB3022),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
