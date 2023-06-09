import 'package:ecommerce_app/provider/ShopProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopCategoryBox extends StatelessWidget {
  final String title;
  final String imgUrl;

  const ShopCategoryBox({
    required this.title,
    required this.imgUrl,
  });

  @override
  Widget build(BuildContext context) {
    ShopProvider shopProvider =
        Provider.of<ShopProvider>(context, listen: false);
    return GestureDetector(
      onTap: () {
        shopProvider.setCurrentPage(title);
      },
      child: Container(
        width: MediaQuery.of(context).size.width - 32,
        height: 100.0,
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
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
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: (MediaQuery.of(context).size.width - 32) / 2,
              child: Center(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Container(
              width: (MediaQuery.of(context).size.width - 32) / 2,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(imgUrl),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
