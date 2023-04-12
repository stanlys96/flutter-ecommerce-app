import 'package:ecommerce_app/components/favorites_page/FavoriteProductBox.dart';
import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
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
              decoration: const BoxDecoration(
                color: Color(0xFFF9F9F9),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 16.0),
                  FavoriteProductBox(),
                  const SizedBox(height: 32.0),
                  FavoriteProductBox(),
                  const SizedBox(height: 32.0),
                  FavoriteProductBox(),
                  const SizedBox(height: 32.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
