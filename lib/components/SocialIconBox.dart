import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialIconBox extends StatelessWidget {
  final IconData icon;
  final Color iconColor;

  const SocialIconBox({required this.icon, this.iconColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await Flushbar(
          flushbarPosition: FlushbarPosition.TOP,
          title: "Not available",
          message: "Service not available yet",
          duration: const Duration(milliseconds: 1500),
          backgroundColor: Colors.orange,
        ).show(context);
      },
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: const BorderRadius.all(
            Radius.circular(5.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 3,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: FaIcon(
          icon,
          color: iconColor,
        ),
      ),
    );
  }
}
