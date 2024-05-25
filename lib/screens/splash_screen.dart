import 'package:flutter/material.dart';
import 'package:lautech_mobile/colors/colors.dart';
import 'dart:async';

import 'package:lautech_mobile/screens/auth/signup_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SignupScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:colorCodes.white ,
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/imgs/lautech logo.png',
              height: 182,
              width: 157,
            ),
          ],
        ),
      ),
    );
  }
}
