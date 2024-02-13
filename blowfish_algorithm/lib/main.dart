import 'package:blowfish_algorithm/screen/home.dart';
import 'package:blowfish_algorithm/splash.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}
