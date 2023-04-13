import 'package:ecommerce_app/api/ApiService.dart';
import 'package:ecommerce_app/components/StarsDummy.dart';
import 'package:ecommerce_app/models/AddFavorite.dart';
import 'package:ecommerce_app/models/Product.dart';
import 'package:ecommerce_app/models/UserFavorites.dart';
import 'package:ecommerce_app/provider/HomeProvider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ProductBox extends StatefulWidget {
  final int index;
  final int totalCount;
  final Product product;
  final int userId;
  final List<UserFavorite> userFavorites;

  ProductBox({
    required this.index,
    required this.totalCount,
    required this.product,
    required this.userId,
    required this.userFavorites,
  });

  @override
  State<ProductBox> createState() => _ProductBoxState();
}

class _ProductBoxState extends State<ProductBox> {
  bool isLoading = false;

  ApiService apiService = ApiService();

  void setIsLoading(bool newValue) {
    if (!mounted) return;
    setState(() {
      isLoading = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isFavorite = false;
    int favorite = widget.userFavorites
        .indexWhere((element) => element.productId == widget.product.id);
    if (favorite != -1) {
      isFavorite = true;
    }
    return Consumer<HomeProvider>(
        builder: (secondContext, homeProvider, child) {
      return GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushNamed('/product-details', arguments: widget.product);
        },
        child: Container(
          margin: widget.index != widget.totalCount - 1
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
                      Image.asset(widget.product.imageUrl ?? ""),
                      InkWell(
                        onTap: () async {
                          if (isLoading) return;
                          if (!isFavorite) {
                            setIsLoading(true);
                            await homeProvider.addToFavorite(
                                widget.userId, widget.product.id ?? 0);
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
                                    onPressed: () =>
                                        Navigator.pop(context, 'Cancel'),
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
                                  widget.userId, widget.product.id ?? 0);
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
                                offset: const Offset(
                                    0, 1), // changes position of shadow
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
                  Container(
                    margin: const EdgeInsets.all(5.0),
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: widget.product.category?.toUpperCase() == "SALE"
                          ? Colors.red
                          : Colors.black,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text(
                      widget.product.category?.toUpperCase() ?? "",
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
                widget.product.subtitle ?? "",
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Color(0xFF9B9B9B),
                ),
              ),
              const SizedBox(height: 5.0),
              Text(
                widget.product.name ?? "",
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
                    '\$${widget.product.price.toString()}',
                    style: const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF9B9B9B),
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  const SizedBox(width: 5.0),
                  Text(
                    '\$${((int.tryParse(widget.product.price ?? "0") ?? 0) - (int.tryParse(widget.product.discount ?? "0") ?? 0)).toString()}',
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
    });
  }
}
