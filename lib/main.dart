import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:fuelapp/screens/splashscreen.dart';
import 'package:fuelapp/userdetail.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xffee6c4d),
      ),
      title: 'EFF',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
