import 'package:ecommerce_app/provider/AuthProvider.dart';
import 'package:flutter/material.dart';
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
        decoration: const BoxDecoration(
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
    } else if (authProvider.success) {
      return Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.black54,
            ),
            height: double.infinity,
            width: double.infinity,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    'images/success.json',
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          40.0,
                        ),
                      ),
                    ),
                    child: const Text(
                      'Register Successful!',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () async {
              await authProvider.setSuccess(false);
              if (mounted && authProvider.currentPage == "Sign Up") {
                authProvider.setCurrentPage("Sign In");
              }
            },
            child: Container(
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.all(10.0),
              decoration: const BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.close,
                color: Colors.white,
              ),
            ),
          )
        ],
      );
    } else {
      return Container();
    }
  }
}
