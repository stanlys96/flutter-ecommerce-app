import 'package:ecommerce_app/pages/ProductDetailPage.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/components/StarsDummy.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ShopProductBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/product-detail');
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
                            Text(
                              'Pullover',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16.0),
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              'Dorothy Perkins',
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Color(0xFF9B9B9B),
                              ),
                            ),
                            SizedBox(height: 5.0),
                            StarsDummy(),
                            SizedBox(height: 5.0),
                            Text(
                              '\$15',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14.0),
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
                    color: Colors.white,
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
                  child: FaIcon(
                    FontAwesomeIcons.heart,
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
