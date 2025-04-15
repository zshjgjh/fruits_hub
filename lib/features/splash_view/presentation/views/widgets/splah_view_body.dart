

import 'package:flutter/material.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
              child: Image.asset('assets/images/leaf.png')),
          Spacer(),
          Image.asset('assets/images/logo.png'),
          Spacer(),
          Image.asset('assets/images/circles.png'),

        ],
      )
      );

  }
}