import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuelapp/screens/locationscreen.dart';
import 'package:fuelapp/userdetail.dart';
import 'package:lottie/lottie.dart';
import 'package:fuelapp/screens/OTPController.dart';

class otpverification extends StatefulWidget {
  final getnum;
  otpverification({@required this.getnum});

  @override
  State<otpverification> createState() => _otpverificationState();
}

class _otpverificationState extends State<otpverification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: 100,
        ),
        Lottie.asset("assets/animations/66688-verified.json", repeat: false),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Otp Verified Successfully ",
            style: TextStyle(
                fontSize: 30,
                // fontFamily: 'Zen',
                color: Colors.black38,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 200,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("welcome hello"),
          ),
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (builder) => MyLocation()));
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
              minimumSize: Size(MediaQuery.of(context).size.width, 98),
            ),
            child: Text(
              "Continue",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 27,
              ),
            )),

        // Container(
        //   margin: EdgeInsets.all(65),
        //   width: double.infinity,
        //   child: ElevatedButton(
        //   style: ElevatedButton.styleFrom(
        //     primary: Colors.red,
        //   ),
        //   onPressed: (){
        //     FirebaseAuth.instance.signOut();
        //     Navigator.of(context).push(MaterialPageRoute(builder: (c) => LoginScreen1()));
        //   },
        //   child: Text('Logout', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),),
        //   ),
        // ),
      ],
    ));
  }
}
