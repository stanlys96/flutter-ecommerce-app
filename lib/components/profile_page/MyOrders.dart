import 'package:ecommerce_app/components/profile_page/MyOrderDetails.dart';
import 'package:ecommerce_app/components/profile_page/MyOrdersBox.dart';
import 'package:flutter/material.dart';

class MyOrders extends StatefulWidget {
  final Function(String, BuildContext) setCurrentPage;

  MyOrders({required this.setCurrentPage});

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  String currentCategory = "Delivered";
  String currentState = "Orders";
  ScrollController scrollController = ScrollController();

  void scrollToTop() {
    scrollController.animateTo(
      0,
      duration: Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
    );
  }

  void setCurrentCategory(String newValue) {
    setState(() {
      scrollToTop();
      currentCategory = newValue;
    });
  }

  void setCurrentState(String newValue) {
    setState(() {
      currentState = newValue;
      scrollToTop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      child: currentState == 'Orders'
          ? MyOrdersBox(
              setCurrentPage: widget.setCurrentPage,
              setCurrentCategory: setCurrentCategory,
              setCurrentState: setCurrentState,
              currentCategory: currentCategory,
            )
          : MyOrderDetails(setCurrentState: setCurrentState),
    );
  }
}
