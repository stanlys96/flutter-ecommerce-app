import 'package:ecommerce_app/ProductDetailPage.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/StarsDummy.dart';

class FavoriteProductBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsPage(),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            clipBehavior: Clip.none,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: Offset(0, 1), // changes position of shadow
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
                            image: AssetImage('images/pullover.png'),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'Dorothy Perkins',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Color(0xFF9B9B9B),
                                  ),
                                ),
                                GestureDetector(
                                  child: Icon(
                                    Icons.cancel,
                                    size: 20.0,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              'Pullover',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16.0),
                            ),
                            SizedBox(height: 5.0),
                            Row(
                              children: [
                                Text(
                                  'Color: ',
                                  style: TextStyle(
                                    color: Color(0xFF9B9B9B),
                                    fontSize: 11.0,
                                  ),
                                ),
                                Text(
                                  'Blue',
                                  style: TextStyle(fontSize: 11.0),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  'Size: ',
                                  style: TextStyle(
                                    color: Color(0xFF9B9B9B),
                                    fontSize: 11.0,
                                  ),
                                ),
                                Text(
                                  'L',
                                  style: TextStyle(fontSize: 11.0),
                                ),
                              ],
                            ),
                            SizedBox(height: 5.0),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '\$15',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.0),
                                ),
                                SizedBox(width: 35.0),
                                StarsDummy(),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: -22.5,
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Color(0xFFDB3022),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: new Icon(
                    IconData(0xf060f, fontFamily: 'MaterialIcons'),
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
