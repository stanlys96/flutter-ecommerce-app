import 'dart:convert';
import 'dart:math';

import 'package:ecommerce_app/api/ApiService.dart';
import 'package:ecommerce_app/models/AddOrder.dart';
import 'package:ecommerce_app/models/DeleteCart.dart';
import 'package:ecommerce_app/models/UserCart.dart';
import 'package:ecommerce_app/provider/HomeProvider.dart';
import 'package:ecommerce_app/provider/ProfileProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class CheckOutPage extends StatefulWidget {
  static String routeName = '/checkout';

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  static const String _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  ApiService apiService = ApiService();
  int deliveryFee = 15;

  bool isLoading = false;

  void setIsLoading(bool newValue) {
    setState(() {
      isLoading = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<HomeProvider, ProfileProvider>(
        builder: (secondContext, homeProvider, profileProvider, child) {
      int total = 0;
      homeProvider.userCart?.forEach((element) {
        total += ((element.amount ?? 0) * (element.price ?? 0)) -
            (element.discount ?? 0);
      });
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          title: const Text(
            "Checkout",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Color(0xFFF9F9F9),
          ),
          child: Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Shipping Address',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            8.0,
                          ),
                        ),
                        color: Colors.white,
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
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                profileProvider.name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                ),
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                  minimumSize: Size.zero,
                                  padding: EdgeInsets.zero,
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                onPressed: () {},
                                child: Text(
                                  'Change',
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.0),
                          Container(
                            width:
                                (MediaQuery.of(context).size.width - 52) * 0.6,
                            child: Text(
                              profileProvider.shippingAddress,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Payment',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            minimumSize: Size.zero,
                            padding: EdgeInsets.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          onPressed: () {},
                          child: Text(
                            'Change',
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset("images/mastercard.png"),
                        SizedBox(width: 5.0),
                        Text(
                          profileProvider.paymentNumber,
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      'Delivery Method',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: (MediaQuery.of(context).size.width - 42) * 0.3,
                          padding: EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                8.0,
                              ),
                            ),
                            color: Colors.white,
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
                          child: Column(
                            children: [
                              Image.asset(
                                'images/fedex.png',
                                width: 61,
                                height: 17,
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                '2 - 3 days',
                                style: TextStyle(
                                  color: Color(
                                    0xFF9B9B9B,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: (MediaQuery.of(context).size.width - 42) * 0.3,
                          padding: EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                8.0,
                              ),
                            ),
                            color: Colors.white,
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
                          child: Column(
                            children: [
                              Image.asset(
                                'images/usps.png',
                                width: 61,
                                height: 17,
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                '2 - 3 days',
                                style: TextStyle(
                                  color: Color(
                                    0xFF9B9B9B,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: (MediaQuery.of(context).size.width - 42) * 0.3,
                          padding: EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                8.0,
                              ),
                            ),
                            color: Colors.white,
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
                          child: Column(
                            children: [
                              Image.asset(
                                'images/dhl.png',
                                width: 61,
                                height: 17,
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                '2 - 3 days',
                                style: TextStyle(
                                  color: Color(
                                    0xFF9B9B9B,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Order:',
                          style: TextStyle(
                            color: Color(
                              0xFF9B9B9B,
                            ),
                            fontSize: 16.0,
                          ),
                        ),
                        Text(
                          '\$$total',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Delivery:',
                          style: TextStyle(
                            color: Color(
                              0xFF9B9B9B,
                            ),
                            fontSize: 16.0,
                          ),
                        ),
                        Text(
                          '\$$deliveryFee',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total:',
                          style: TextStyle(
                            color: Color(
                              0xFF9B9B9B,
                            ),
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '\$${total + deliveryFee}',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(16.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (isLoading) return;
                      bool isConfirmed = false;
                      await showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Checkout'),
                          content: Text(
                            'Sure you want to checkout \$${total + deliveryFee}?',
                          ),
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
                      if (!isConfirmed) return;
                      setIsLoading(true);
                      try {
                        var json = homeProvider.userCart
                            ?.map((element) => element.toJson())
                            .toList();
                        AddOrderResponse? result = await apiService.addOrder(
                            getRandomString(15),
                            getRandomString(15),
                            "delivered",
                            profileProvider.shippingAddress,
                            profileProvider.paymentMethod,
                            profileProvider.paymentNumber,
                            "FedEx",
                            deliveryFee,
                            0,
                            total,
                            jsonEncode(json ?? []),
                            homeProvider.userId);
                        if (result?.msg == "success") {
                          DeleteCartResponse? deleteResponse = await apiService
                              .deleteAllCart(homeProvider.userId);
                          if (deleteResponse?.msg == "success") {
                            await homeProvider.refetchAll();

                            setIsLoading(false);
                            Navigator.of(context).pushNamed('/order-success');
                          }
                        }
                      } catch (e) {
                        setIsLoading(false);
                        print(e);
                      }
                    },
                    child: isLoading
                        ? SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(),
                          )
                        : const Text(
                            'SUBMIT ORDER',
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      backgroundColor: const Color(0xFFDB3022),
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
