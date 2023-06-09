import 'package:flutter/material.dart';

class ProfileCategoryBox extends StatelessWidget {
  final String title;
  final String subTitle;
  final Function() setCurrentPage;

  ProfileCategoryBox({
    required this.title,
    required this.subTitle,
    required this.setCurrentPage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setCurrentPage();
      },
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
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
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 7.5),
                Text(
                  subTitle,
                  style: const TextStyle(
                    color: Color(0xFF9B9B9B),
                    fontSize: 11.0,
                  ),
                ),
              ],
            ),
            const Icon(
              Icons.arrow_right,
            ),
          ],
        ),
      ),
    );
  }
}
