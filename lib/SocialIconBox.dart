import 'package:flutter/material.dart';

class SocialIconBox extends StatelessWidget {
  const SocialIconBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: new Icon(
        IconData(0xe255, fontFamily: 'MaterialIcons'),
      ),
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.all(
          Radius.circular(5.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 3,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
    );
  }
}
