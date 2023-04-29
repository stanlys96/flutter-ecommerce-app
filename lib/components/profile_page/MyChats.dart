import 'package:ecommerce_app/components/profile_page/ChatBox.dart';
import 'package:ecommerce_app/components/profile_page/MyOrderCard.dart';
import 'package:ecommerce_app/models/AdminChats.dart';
import 'package:ecommerce_app/models/OrderDetail.dart';
import 'package:ecommerce_app/provider/HomeProvider.dart';
import 'package:ecommerce_app/provider/ProfileProvider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class MyChats extends StatefulWidget {
  @override
  State<MyChats> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyChats> {
  ScrollController scrollController = ScrollController();

  void scrollToTop() {
    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<HomeProvider, ProfileProvider>(
        builder: (secondContext, homeProvider, profileProvider, child) {
      List<int> userIds = [];
      List<AdminChat> users = [];
      for (AdminChat adminChat in (homeProvider.adminChats ?? [])) {
        if (!userIds.contains(adminChat.userId)) {
          userIds.add(adminChat.userId ?? 0);
          users.add(adminChat);
        }
      }
      return SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(16.0),
              width: double.infinity,
              child: GestureDetector(
                onTap: () {
                  profileProvider.setCurrentPage("Profile", context);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Icon(
                      Icons.arrow_back,
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Text(
                      "My Chats",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 34.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  users.isEmpty
                      ? Column(
                          children: [
                            Lottie.asset(
                              'images/bag-empty.json',
                              width: double.infinity,
                            ),
                            const Text('No items for this category...'),
                          ],
                        )
                      : Column(
                          children: [
                            for (AdminChat adminChat in users) ...[
                              ChatBox(adminChat: adminChat),
                              const SizedBox(height: 16.0),
                            ]
                          ],
                        )
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
