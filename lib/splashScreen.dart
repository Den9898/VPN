import 'dart:async';

import 'package:flutter/material.dart';
import 'package:untitled4/main.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  Widget build(BuildContext context) {

    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const homePage()));
    });
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Color(0xFFCE4000), Color(0xFFFF400)],
          ),
        ),
        child: Center(
          child: Container(
              width: 30, height: 30,  child: const CircularProgressIndicator()),
        ),
      ),
    );
  }
}
