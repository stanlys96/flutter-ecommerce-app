import 'package:ecommerce_app/components/StarsDummy.dart';
import 'package:flutter/material.dart';

class ProductBox extends StatelessWidget {
  final int index;
  final int totalCount;

  const ProductBox({
    super.key,
    required this.index,
    required this.totalCount,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/product-detail');
      },
      child: Container(
        margin: index != totalCount - 1
            ? EdgeInsets.only(right: 10.0)
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
                    Image.asset('images/evening_dress.png'),
                    Positioned(
                      bottom: -22.5,
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 3,
                              offset:
                                  Offset(0, 1), // changes position of shadow
                            ),
                          ],
                        ),
                        child: new Icon(
                          IconData(0xf060f, fontFamily: 'MaterialIcons'),
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.all(5.0),
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    'NEW',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.0),
            StarsDummy(),
            SizedBox(height: 5.0),
            Text(
              'Dorothy Perkins',
              style: TextStyle(
                fontSize: 12.0,
                color: Color(0xFF9B9B9B),
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              'Evening Dress',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5.0),
            Row(
              children: [
                Text(
                  '\$15',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF9B9B9B),
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                SizedBox(width: 5.0),
                Text(
                  '\$12',
                  style: TextStyle(
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
