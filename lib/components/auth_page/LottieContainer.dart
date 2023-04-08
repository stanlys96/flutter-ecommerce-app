import 'package:ecommerce_app/provider/AuthProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class LottieContainer extends StatefulWidget {
  const LottieContainer({super.key});

  @override
  State<LottieContainer> createState() => _LottieContainerState();
}

class _LottieContainerState extends State<LottieContainer> {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    if (authProvider.loading) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.black54,
        ),
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Lottie.asset(
            'images/loading.json',
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
