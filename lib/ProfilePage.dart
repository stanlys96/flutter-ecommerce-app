import 'package:ecommerce_app/ProfileCategoryBox.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "My Profile",
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 34.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Image.asset(
                    'images/profile_picture.png',
                    width: 64.0,
                    height: 64.0,
                  ),
                  SizedBox(width: 16.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Matilda Brown',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 2.5),
                      Text(
                        'matildabrown@mail.com',
                        style: TextStyle(
                          color: Color(0xFF9B9B9B),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        ProfileCategoryBox(title: 'My Orders', subTitle: '12 Orders'),
        ProfileCategoryBox(
            title: 'Shipping Addresses', subTitle: '3 Addresses'),
        ProfileCategoryBox(title: 'Payment Methods', subTitle: 'Visa **34'),
        ProfileCategoryBox(
            title: 'Promo Codes', subTitle: 'You have special Promo Codes'),
        ProfileCategoryBox(
            title: 'My Reviews', subTitle: 'Reviewed 4 products'),
        ProfileCategoryBox(
            title: 'Settings', subTitle: 'Notifications, password'),
      ],
    );
  }
}
