import 'package:ecommerce_app/components/favorites_page/FavoriteProductBox.dart';
import 'package:ecommerce_app/models/Product.dart';
import 'package:ecommerce_app/models/UserFavorites.dart';
import 'package:ecommerce_app/provider/FavoritesProvider.dart';
import 'package:ecommerce_app/provider/HomeProvider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:after_layout/after_layout.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatefulWidget {
  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
        builder: (secondContext, homeProvider, child) {
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
                padding: EdgeInsets.symmetric(
                  vertical: 16.0,
                ),
                width: double.infinity,
                height: MediaQuery.of(context).size.height - 50,
                decoration: const BoxDecoration(
                  color: Color(0xFFF9F9F9),
                ),
                child: homeProvider.isLoading
                    ? Expanded(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Lottie.asset(
                                'images/loading-2.json',
                                width: 200.0,
                                height: 200.0,
                              ),
                            ],
                          ),
                        ),
                      )
                    : (homeProvider.currentUserFavorites ?? []).isEmpty
                        ? Column(
                            children: [
                              Lottie.asset(
                                'images/favorites-empty.json',
                                width: double.infinity,
                              ),
                              const Text('No favorites added yet...'),
                            ],
                          )
                        : Column(
                            children: [
                              for (UserFavorite userFavorite
                                  in (homeProvider.currentUserFavorites ??
                                      [])) ...[
                                FavoriteProductBox(
                                  currentProduct: Product(
                                    id: userFavorite.productId,
                                    name: userFavorite.name,
                                    category: userFavorite.category,
                                    subtitle: userFavorite.subtitle,
                                    price: userFavorite.price,
                                    discount: userFavorite.discount,
                                    size: userFavorite.size,
                                    color: userFavorite.color,
                                    description: userFavorite.description,
                                    rating: userFavorite.rating,
                                    reviews: userFavorite.reviews,
                                    stock: userFavorite.stock,
                                    imageUrl: userFavorite.imageUrl,
                                    imageDetailUrl: userFavorite.imageDetailUrl,
                                    productType: userFavorite.productType,
                                  ),
                                ),
                                SizedBox(height: 32.0),
                              ],
                            ],
                          ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
