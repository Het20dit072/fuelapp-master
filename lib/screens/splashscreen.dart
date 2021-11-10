import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fuelapp/screens/onboarding.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 6),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => OnboardingScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffffffff),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 200,
              ),
              SvgPicture.asset(
                'assets/images/BestDesign.svg',
                height: 450,
                alignment: Alignment.center,
              ),
              SizedBox(
                height: 50,
              ),
              Lottie.asset("assets/animations/lf30_editor_ztipckko.json",
                  height: 95)
            ],
          ),
        ));
  }
}
