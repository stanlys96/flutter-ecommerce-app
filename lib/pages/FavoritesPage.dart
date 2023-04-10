import 'package:ecommerce_app/components/favorites_page/FavoriteProductBox.dart';
import 'package:ecommerce_app/provider/MainProvider.dart';
import 'package:ecommerce_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:
          Consumer<MainProvider>(builder: (secondContext, mainProvider, child) {
        return Visibility(
          visible: mainProvider.currentPage == PageState.FAVORITES,
          child: Opacity(
            opacity: 1 - (mainProvider.blurController?.value ?? 0),
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Favorites",
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
                        FavoriteProductBox(
                          setCurrentPage: mainProvider.setCurrentPage,
                          setPreviousPage: mainProvider.setPreviousPage,
                        ),
                        SizedBox(height: 32.0),
                        FavoriteProductBox(
                          setCurrentPage: mainProvider.setCurrentPage,
                          setPreviousPage: mainProvider.setPreviousPage,
                        ),
                        SizedBox(height: 32.0),
                        FavoriteProductBox(
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
        );
      }),
    );
  }
}
