import 'package:another_flushbar/flushbar.dart';
import 'package:ecommerce_app/api/ApiService.dart';
import 'package:ecommerce_app/components/input_text_dialog.dart';
import 'package:ecommerce_app/models/DeleteCart.dart';
import 'package:ecommerce_app/models/Product.dart';
import 'package:ecommerce_app/models/UpdateCart.dart';
import 'package:ecommerce_app/provider/HomeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BagProductBox extends StatefulWidget {
  Product product;
  int amount;

  BagProductBox({required this.product, required this.amount});

  @override
  State<BagProductBox> createState() => _BagProductBoxState();
}

class _BagProductBoxState extends State<BagProductBox> {
  ApiService apiService = ApiService();
  TextEditingController numberController = TextEditingController();

  bool isLoading = false;

  void setIsLoading(bool newValue) {
    setState(() {
      isLoading = newValue;
    });
  }

  Future<String> updateCart(userId, productId, amount) async {
    UpdateCartResponse? result =
        await apiService.updateCart(userId, productId, amount);
    return result?.msg ?? "";
  }

  Future<String> deleteCart(userId, productId) async {
    DeleteCartResponse? result = await apiService.deleteCart(userId, productId);
    return result?.msg ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
        builder: (secondContext, homeProvider, child) {
      return GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushNamed('/product-details', arguments: widget.product);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset: const Offset(0, 1), // changes position of shadow
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
                          image: AssetImage(widget.product.imageUrl ?? ""),
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
                      width: (MediaQuery.of(context).size.width - 32) * 0.70,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                widget.product.name ?? "",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0),
                              ),
                              isLoading
                                  ? SizedBox(
                                      width: 20.0,
                                      height: 20.0,
                                      child: CircularProgressIndicator(),
                                    )
                                  : PopupMenuButton<int>(
                                      child: Container(
                                        height: 20,
                                        width: 20,
                                        alignment: Alignment.centerRight,
                                        child: Icon(
                                          Icons.more_vert,
                                        ),
                                      ),
                                      iconSize: 20.0,
                                      padding: EdgeInsets.zero,
                                      itemBuilder: (BuildContext context) =>
                                          <PopupMenuItem<int>>[
                                            new PopupMenuItem<int>(
                                                value: 1,
                                                child:
                                                    new Text('Change Amount')),
                                            new PopupMenuItem<int>(
                                                value: 2,
                                                child: new Text('Delete Cart')),
                                          ],
                                      onSelected: (int value) async {
                                        if (value == 1) {
                                          displayTextInputDialog(
                                              context,
                                              numberController,
                                              widget.product.stock ?? 0,
                                              widget.product.name ?? "",
                                              (stock) async {
                                            String result = await updateCart(
                                                homeProvider.userId,
                                                widget.product.id,
                                                int.tryParse(stock) ?? 0);
                                            if (result != "success") {
                                              return false;
                                            }
                                            await homeProvider
                                                .refetchUserCart();
                                            return true;
                                          });
                                        }
                                        if (value == 2) {
                                          if (isLoading) return;
                                          bool isConfirmed = false;
                                          await showDialog<String>(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                AlertDialog(
                                              title:
                                                  const Text('Delete Favorite'),
                                              content: const Text(
                                                  'Are you sure you want to delete this item from cart?'),
                                              actions: <Widget>[
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
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
                                            await deleteCart(
                                                homeProvider.userId,
                                                widget.product.id);

                                            await homeProvider
                                                .refetchUserCart();
                                            setIsLoading(false);
                                            await Flushbar(
                                              flushbarPosition:
                                                  FlushbarPosition.TOP,
                                              title: "Success",
                                              message:
                                                  "Successfully deleted cart",
                                              duration: const Duration(
                                                  milliseconds: 1500),
                                              backgroundColor: Colors.green,
                                            ).show(context);
                                          }
                                        }
                                      })
                            ],
                          ),
                          const SizedBox(height: 10.0),
                          Row(
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: 'Color: ',
                                  style: TextStyle(
                                    color: Color(0xFF9B9B9B),
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: widget.product.color ?? "",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 20.0),
                              RichText(
                                text: TextSpan(
                                  text: 'Size: ',
                                  style: TextStyle(
                                    color: Color(0xFF9B9B9B),
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: widget.product.size ?? "",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Amount: ',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Color(0xFF9B9B9B),
                                    ),
                                  ),
                                  Text(
                                    widget.amount.toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0),
                                  ),
                                ],
                              ),
                              Text(
                                '\$${((int.tryParse(widget.product.price ?? "0") ?? 0) - (int.tryParse(widget.product.discount ?? "0") ?? 0)) * widget.amount}',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
