import 'package:ecommerce_app/components/profile_page/ProfileCategoryBox.dart';
import 'package:ecommerce_app/provider/ProfileProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ProfileProvider profileProvider =
        Provider.of<ProfileProvider>(context, listen: false);
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
        ProfileCategoryBox(
          title: 'My Orders',
          subTitle: '12 Orders',
          setCurrentPage: () {
            profileProvider.setCurrentPage("My Orders", context);
          },
        ),
        ProfileCategoryBox(
          title: 'Shipping Addresses',
          subTitle: '3 Addresses',
          setCurrentPage: () {},
        ),
        ProfileCategoryBox(
          title: 'Payment Methods',
          subTitle: 'Visa **34',
          setCurrentPage: () {},
        ),
        ProfileCategoryBox(
          title: 'Promo Codes',
          subTitle: 'You have special Promo Codes',
          setCurrentPage: () {},
        ),
        ProfileCategoryBox(
          title: 'My Reviews',
          subTitle: 'Reviewed 4 products',
          setCurrentPage: () {},
        ),
        ProfileCategoryBox(
          title: 'Settings',
          subTitle: 'Notifications, password',
          setCurrentPage: () {
            profileProvider.setCurrentPage("Settings", context);
          },
        ),
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            padding: EdgeInsets.all(16.0),
            child: SizedBox(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/auth');
                },
                child: Text('Log Out'),
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  backgroundColor: Color(0xFFDB3022),
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
