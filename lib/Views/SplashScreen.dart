import 'dart:async';

import 'package:comet_labs_task/Views/Onboarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _logoOpacity = 1.0;

  @override
  void initState() {
    Timer(const Duration(milliseconds: 100), () {
      _changeOpacity(0.0);
    });
    Timer(const Duration(milliseconds: 1600), () {
      _navigateToHomeScreen();
    });
    super.initState();
  }

  void _navigateToHomeScreen() {
    Get.to(()=>const OnboardingScreen());
  }

  void _changeOpacity(double _to) {
    setState(() {
      _logoOpacity = _to;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: AnimatedOpacity(
          opacity: _logoOpacity,
          duration: const Duration(seconds: 1),
          child: Image.asset('assets/images/logo.png'),
        ),
      ),
    );
  }
}
