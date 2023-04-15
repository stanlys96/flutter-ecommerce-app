import 'package:ecommerce_app/api/ApiService.dart';
import 'package:ecommerce_app/components/StarsDummy.dart';
import 'package:ecommerce_app/components/input_text_dialog.dart';
import 'package:ecommerce_app/models/AddToCart.dart';
import 'package:ecommerce_app/models/Product.dart';
import 'package:ecommerce_app/provider/HomeProvider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ProductDetailsPage extends StatefulWidget {
  static const String routeName = '/product-details';

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  ApiService apiService = ApiService();
  bool isLoading = false;

  void setIsLoading(bool newValue) {
    setState(() {
      isLoading = newValue;
    });
  }

  TextEditingController numberController = TextEditingController();

  Future<String> addToCart(userId, productId, amount) async {
    AddToCartResponse? result =
        await apiService.addToCart(userId, productId, amount);
    return result?.msg ?? "";
  }

  @override
  Widget build(BuildContext context) {
    Product product = ModalRoute.of(context)!.settings.arguments as Product;
    HomeProvider homeProvider =
        Provider.of<HomeProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          product.name ?? "",
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Consumer<HomeProvider>(
            builder: (secondContext, homeProvider, child) {
          bool isFavorite = false;
          int favorite = (homeProvider.currentUserFavorites ?? [])
              .indexWhere((element) => element.productId == product.id);
          if (favorite != -1) {
            isFavorite = true;
          }
          return Column(
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 100.0),
                decoration: const BoxDecoration(
                  color: Color(0xFFF9F9F9),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 413.0,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: product.imageDetailUrl?.length ?? 0,
                        itemBuilder: (context, index) {
                          String currentImage =
                              product.imageDetailUrl?[index] ?? "";
                          return Row(
                            children: [
                              Image.asset(currentImage),
                              const SizedBox(width: 10),
                            ],
                          );
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Size: ${product.size ?? ""}',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Color: ${product.color ?? ""}',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  if (isLoading) return;
                                  if (!isFavorite) {
                                    setIsLoading(true);
                                    await homeProvider.addToFavorite(
                                        homeProvider.userId, product.id ?? 0);
                                    setIsLoading(false);
                                  } else {
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
                                          homeProvider.userId, product.id ?? 0);
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
                              ),
                            ],
                          ),
                          const SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.name ?? "",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5.0),
                                  Text(
                                    product.subtitle ?? "",
                                    style: const TextStyle(
                                      fontSize: 11.0,
                                      color: Color(0xFF9B9B9B),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                '\$${((int.tryParse(product.price ?? "0") ?? 0) - (int.tryParse(product.discount ?? "0") ?? 0)).toString()}.00',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const StarsDummy(),
                              Text(
                                'Stock: ${product.stock ?? ""}',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10.0),
                          Text(
                            product.description ?? "",
                            style: const TextStyle(
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
          );
        }),
      ),
      bottomSheet: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              displayTextInputDialog(context, numberController,
                  product.stock ?? 0, product.name ?? "", (stock) async {
                String result = await addToCart(
                    homeProvider.userId, product.id, int.tryParse(stock) ?? 0);
                if (result != "success") {
                  return false;
                }
                homeProvider.refetchUserCart();
                return true;
              });
            },
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              backgroundColor: const Color(0xFFDB3022),
              padding: const EdgeInsets.symmetric(vertical: 15.0),
            ),
            child: const Text('ADD TO CART'),
          ),
        ),
      ),
    );
  }
}
