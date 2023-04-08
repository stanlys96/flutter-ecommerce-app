import 'package:flutter/material.dart';

class InputBox extends StatelessWidget {
  final String title;
  final String placeholder;
  final bool isPassword;
  final TextEditingController controller;

  InputBox({
    required this.title,
    this.placeholder = '',
    this.isPassword = false,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      width: double.infinity,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Color(0xFF9B9B9B),
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          TextField(
            controller: controller,
            obscureText: isPassword,
            decoration: InputDecoration(
              hintStyle: TextStyle(
                color: Colors.grey.withOpacity(0.35),
              ),
              isDense: true,
              border: InputBorder.none,
              hintText: placeholder,
            ),
          ),
        ],
      ),
    );
  }
}
