import 'package:ecommerce_app/components/StarsDummy.dart';
import 'package:ecommerce_app/models/Product.dart';
import 'package:ecommerce_app/provider/MainProvider.dart';
import 'package:ecommerce_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ProductDetailsPage extends StatelessWidget {
  static const String routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
      builder: (secondContext, mainProvider, child) {
        return Visibility(
          visible: mainProvider.currentPage == PageState.PRODUCT_DETAILS,
          child: Opacity(
            opacity: 1 - (mainProvider.blurController?.value ?? 0),
            child: Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                              top: 56.0,
                              bottom: 100.0,
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xFFF9F9F9),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 413.0,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    // itemCount: product.imageDetailUrl?.length ?? 0,
                                    itemCount: 3,
                                    itemBuilder: (context, index) {
                                      // String currentImage =
                                      //     product.imageDetailUrl?[index] ?? "";
                                      String currentImage =
                                          "images/evening_dress.png";
                                      return Row(
                                        children: [
                                          Image.asset(currentImage),
                                          SizedBox(width: 10),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: (MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    20) *
                                                0.4,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                width: 1.0,
                                                color:
                                                    Color.fromARGB(50, 0, 0, 0),
                                              ),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(16.0),
                                              ),
                                            ),
                                            padding: EdgeInsets.all(10.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
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
                                            width: (MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    20) *
                                                0.4,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                width: 1.0,
                                                color:
                                                    Color.fromARGB(50, 0, 0, 0),
                                              ),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(16.0),
                                              ),
                                            ),
                                            padding: EdgeInsets.all(10.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
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
                                            padding: EdgeInsets.all(10.0),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                  spreadRadius: 2,
                                                  blurRadius: 3,
                                                  offset: Offset(0,
                                                      1), // changes position of shadow
                                                ),
                                              ],
                                            ),
                                            child: FaIcon(
                                              FontAwesomeIcons.heart,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10.0),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                // product.name ?? "",
                                                "WALAO",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 24.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(height: 5.0),
                                              Text(
                                                // product.subtitle ?? "",
                                                "WALAO",
                                                style: TextStyle(
                                                  fontSize: 11.0,
                                                  color: Color(0xFF9B9B9B),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            // '\$${((int.tryParse(product.price ?? "0") ?? 0) - (int.tryParse(product.discount ?? "0") ?? 0)).toString()}.00',
                                            'WALAO',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 24.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10.0),
                                      StarsDummy(),
                                      SizedBox(height: 10.0),
                                      Text(
                                        // product.description ?? "",
                                        "WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO WALAO ",
                                        style: TextStyle(
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
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      height: 56.0,
                      padding: EdgeInsets.all(16.0),
                      width: double.infinity,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              mainProvider
                                  .setCurrentPage(mainProvider.previousPage);
                            },
                            child: Icon(
                              Icons.arrow_back,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              child: Text(
                                'WALAO',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('ADD TO CART'),
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        backgroundColor: Color(0xFFDB3022),
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
