import 'package:flutter/material.dart';

class ProfileCategoryBox extends StatelessWidget {
  final String title;
  final String subTitle;

  ProfileCategoryBox({
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0.5,
            color: Color(0xFF9B9B9B),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 7.5),
              Text(
                subTitle,
                style: TextStyle(
                  color: Color(0xFF9B9B9B),
                  fontSize: 11.0,
                ),
              ),
            ],
          ),
          Icon(
            Icons.arrow_right,
          ),
        ],
      ),
    );
  }
}