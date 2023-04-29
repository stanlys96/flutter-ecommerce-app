import 'package:ecommerce_app/models/Product.dart';
import 'package:ecommerce_app/provider/HomeProvider.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/components/StarsDummy.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ShopProductBox extends StatefulWidget {
  final Product currentProduct;

  ShopProductBox({
    required this.currentProduct,
  });

  @override
  State<ShopProductBox> createState() => _ShopProductBoxState();
}

class _ShopProductBoxState extends State<ShopProductBox> {
  bool isLoading = false;

  void setIsLoading(bool newValue) {
    setState(() {
      isLoading = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
        builder: (secondContext, homeProvider, child) {
      bool isFavorite = false;
      int favorite = (homeProvider.currentUserFavorites ?? []).indexWhere(
          (element) => element.productId == widget.currentProduct.id);
      if (favorite != -1) {
        isFavorite = true;
      }
      return GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushNamed('/product-details', arguments: widget.currentProduct);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.centerRight,
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
                        offset:
                            const Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width:
                              (MediaQuery.of(context).size.width - 32) * 0.30,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                  widget.currentProduct.imageUrl ?? ""),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(8.0),
                              topRight: Radius.circular(8.0),
                            ),
                            color: Colors.white,
                          ),
                          width:
                              (MediaQuery.of(context).size.width - 32) * 0.70,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                widget.currentProduct.name ?? "",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0),
                              ),
                              const SizedBox(height: 5.0),
                              Text(
                                widget.currentProduct.subtitle ?? "",
                                style: const TextStyle(
                                  fontSize: 12.0,
                                  color: Color(0xFF9B9B9B),
                                ),
                              ),
                              const SizedBox(height: 5.0),
                              const StarsDummy(),
                              const SizedBox(height: 5.0),
                              Text(
                                '\$${((widget.currentProduct.price ?? 0) - (widget.currentProduct.discount ?? 0)).toString()}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    if (isLoading) return;
                    if (!isFavorite) {
                      setIsLoading(true);
                      await homeProvider.addToFavorite(
                          homeProvider.userId, widget.currentProduct.id ?? 0);
                      setIsLoading(false);
                    } else {
                      bool isConfirmed = false;
                      await showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Delete Favorite'),
                          content: const Text(
                              'Are you sure you want to delete this item from favorites?'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'Cancel'),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                isConfirmed = true;
                                Navigator.pop(context);
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                      if (isConfirmed) {
                        setIsLoading(true);
                        await homeProvider.deleteFavorite(
                            homeProvider.userId, widget.currentProduct.id ?? 0);
                        setIsLoading(false);
                      }
                    }
                  },
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
                    child: isLoading
                        ? SizedBox(
                            width: 24.0,
                            height: 24.0,
                            child: CircularProgressIndicator(),
                          )
                        : isFavorite
                            ? const FaIcon(
                                FontAwesomeIcons.solidHeart,
                                color: Colors.red,
                              )
                            : const FaIcon(
                                FontAwesomeIcons.heart,
                              ),
                  ),
                )
              ],
            ),
          ],
        ),
      );
    });
  }
}
