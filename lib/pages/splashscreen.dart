import 'dart:async';

import 'package:cryptospeed/pages/homepage.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: ((context) => const Homepage()),
        ),
      );
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: Container(
          child: const Image(
            image: AssetImage(
                'images/speed.jpg'),
          ),
        ),
      ),
    );
  }
}
