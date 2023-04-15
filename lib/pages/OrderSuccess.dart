import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lottie/lottie.dart';

class OrderSuccess extends StatelessWidget {
  static String routeName = '/order-success';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'images/order-success.json',
              width: double.infinity,
            ),
            SizedBox(height: 25.0),
            Container(
              padding: EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/main');
                  },
                  child: const Text('CONTINUE SHOPPING'),
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    backgroundColor: const Color(0xFFDB3022),
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
