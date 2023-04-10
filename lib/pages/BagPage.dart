import 'package:ecommerce_app/components/bag_page/BagProductBox.dart';
import 'package:ecommerce_app/provider/MainProvider.dart';
import 'package:ecommerce_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BagPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
        builder: (secondContext, mainProvider, child) {
      return Visibility(
        visible: mainProvider.currentPage == PageState.BAG,
        child: Opacity(
          opacity: 1 - (mainProvider.blurController?.value ?? 0),
          child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                    top: 16.0,
                    right: 16.0,
                    left: 16.0,
                    bottom: 100.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
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
                        decoration: BoxDecoration(
                          color: Color(0xFFF9F9F9),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 16.0),
                            BagProductBox(
                              setCurrentPage: mainProvider.setCurrentPage,
                              setPreviousPage: mainProvider.setPreviousPage,
                            ),
                            SizedBox(height: 32.0),
                            BagProductBox(
                              setCurrentPage: mainProvider.setCurrentPage,
                              setPreviousPage: mainProvider.setPreviousPage,
                            ),
                            SizedBox(height: 32.0),
                            BagProductBox(
                              setCurrentPage: mainProvider.setCurrentPage,
                              setPreviousPage: mainProvider.setPreviousPage,
                            ),
                            SizedBox(height: 32.0),
                            BagProductBox(
                              setCurrentPage: mainProvider.setCurrentPage,
                              setPreviousPage: mainProvider.setPreviousPage,
                            ),
                            SizedBox(height: 32.0),
                            BagProductBox(
                              setCurrentPage: mainProvider.setCurrentPage,
                              setPreviousPage: mainProvider.setPreviousPage,
                            ),
                            SizedBox(height: 32.0),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
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
                    SizedBox(height: 15.0),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('CHECK OUT'),
                        style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(),
                          backgroundColor: Color(0xFFDB3022),
                          padding: EdgeInsets.symmetric(vertical: 15.0),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
