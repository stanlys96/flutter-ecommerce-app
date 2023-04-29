import 'package:ecommerce_app/models/AdminChats.dart';
import 'package:ecommerce_app/models/ChatScreenArguments.dart';
import 'package:ecommerce_app/provider/ShopProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatBox extends StatelessWidget {
  final AdminChat adminChat;

  const ChatBox({
    required this.adminChat,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/chat',
            arguments: ChatScreenArguments(
                name: adminChat.name ?? "", toUser: adminChat.userId ?? 0));
      },
      child: Container(
        width: MediaQuery.of(context).size.width - 32,
        height: 100.0,
        padding: EdgeInsets.all(16.0),
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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'images/people.png',
              width: 60,
              height: 60,
            ),
            SizedBox(width: 16.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  adminChat.name ?? "",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  "(${adminChat.email ?? ""})",
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
