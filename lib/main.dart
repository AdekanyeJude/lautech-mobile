import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lautech_mobile/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

int currentIndex = 1;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lautech Manual',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: HexColor("#905F32")),
        useMaterial3: true,
      ),
      home: MediaQuery(
        data: MediaQueryData(),
        child: SplashScreen(),
      ),
      debugShowCheckedModeBanner: false,
      // color: Colors.orange.shade900,
    );
  }
}
