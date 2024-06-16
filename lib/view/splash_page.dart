import 'dart:async';
import 'package:flutter/material.dart';

import 'package:hraccoon/view/login_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 2),
      () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => const LoginPage())),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          'assets/logo/Logo-Color.png',
          width: 240,
        )
      )
    );
  }
}