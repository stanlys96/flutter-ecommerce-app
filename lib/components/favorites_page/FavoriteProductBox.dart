import 'package:another_flushbar/flushbar.dart';
import 'package:ecommerce_app/models/Product.dart';
import 'package:ecommerce_app/provider/HomeProvider.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/components/StarsDummy.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class FavoriteProductBox extends StatefulWidget {
  Product currentProduct;

  FavoriteProductBox({required this.currentProduct});

  @override
  State<FavoriteProductBox> createState() => _FavoriteProductBoxState();
}

class _FavoriteProductBoxState extends State<FavoriteProductBox> {
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
      return GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushNamed('/product-details', arguments: widget.currentProduct);
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    widget.currentProduct.name ?? "",
                                    style: const TextStyle(
                                      fontSize: 12.0,
                                      color: Color(0xFF9B9B9B),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      if (isLoading) return;
                                      bool isConfirmed = false;
                                      await showDialog<String>(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            AlertDialog(
                                          title: const Text('Delete Favorite'),
                                          content: const Text(
                                              'Are you sure you want to delete this item from favorites?'),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  context, 'Cancel'),
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
                                            homeProvider.userId,
                                            widget.currentProduct.id ?? 0);
                                        setIsLoading(false);

                                        await Flushbar(
                                          flushbarPosition:
                                              FlushbarPosition.TOP,
                                          title: "Success",
                                          message:
                                              "Successfully deleted favorite",
                                          duration: const Duration(
                                              milliseconds: 1500),
                                          backgroundColor: Colors.green,
                                        ).show(context);
                                      }
                                    },
                                    child: isLoading
                                        ? SizedBox(
                                            width: 20.0,
                                            height: 20.0,
                                            child: CircularProgressIndicator(),
                                          )
                                        : const Icon(
                                            Icons.cancel,
                                            size: 20.0,
                                          ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5.0),
                              Text(
                                widget.currentProduct.subtitle ?? "",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0),
                              ),
                              const SizedBox(height: 5.0),
                              Row(
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: 'Color: ',
                                      style: const TextStyle(
                                        color: Color(0xFF9B9B9B),
                                        fontSize: 11.0,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text:
                                              widget.currentProduct.color ?? "",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 11.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 20.0),
                                  RichText(
                                    text: TextSpan(
                                      text: 'Size: ',
                                      style: const TextStyle(
                                        color: Color(0xFF9B9B9B),
                                        fontSize: 11.0,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text:
                                              widget.currentProduct.size ?? "",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 11.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5.0),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '\$${((int.tryParse(widget.currentProduct.price ?? "0") ?? 0) - (int.tryParse(widget.currentProduct.discount ?? "0") ?? 0)).toString()}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.0),
                                  ),
                                  const SizedBox(width: 35.0),
                                  const StarsDummy(),
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
                    child: const FaIcon(
                      FontAwesomeIcons.solidHeart,
                      color: Color(0xFFDB3022),
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
