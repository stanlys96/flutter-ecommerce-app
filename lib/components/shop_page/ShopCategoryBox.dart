import 'package:ecommerce_app/utils/constants.dart';
import 'package:flutter/material.dart';

class ShopCategoryBox extends StatelessWidget {
  final String title;
  final String imgUrl;
  final Function changeCurrentState;
  final Function changeProductCategory;
  final Function changeProductType;

  const ShopCategoryBox({
    required this.title,
    required this.imgUrl,
    required this.changeCurrentState,
    required this.changeProductCategory,
    required this.changeProductType,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        changeCurrentState(PageState.SHOP_PRODUCTS);
        if (title.toLowerCase() == "new") {
          changeProductCategory("New");
          changeProductType("");
        } else {
          changeProductType(title);
          changeProductCategory("");
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width - 32,
        height: 100.0,
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: (MediaQuery.of(context).size.width - 32) / 2,
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
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
