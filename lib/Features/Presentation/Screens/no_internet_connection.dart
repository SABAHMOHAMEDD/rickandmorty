import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class NoInternetConnection extends StatelessWidget {
  const NoInternetConnection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/images/noconnection.json',
            width: double.infinity,
            height: 400,
            fit: BoxFit.contain,
          )

          ,

        ],
      )),
    );
  }
}
