import 'package:flutter/material.dart';

class StarsDummy extends StatelessWidget {
  const StarsDummy({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          'images/star_activated.png',
          width: 14.0,
          height: 14.0,
        ),
        Image.asset(
          'images/star_activated.png',
          width: 14.0,
          height: 14.0,
        ),
        Image.asset(
          'images/star_activated.png',
          width: 14.0,
          height: 14.0,
        ),
        Image.asset(
          'images/star_activated.png',
          width: 14.0,
          height: 14.0,
        ),
        Image.asset(
          'images/star_activated.png',
          width: 14.0,
          height: 14.0,
        ),
        const Text(
          '(10)',
          style: TextStyle(
            fontSize: 12.0,
            color: Color(0xFF9B9B9B),
          ),
        )
      ],
    );
  }
}
