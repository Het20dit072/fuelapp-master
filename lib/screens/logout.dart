import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'loginscreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Home Screen",
          style: TextStyle(color: Colors.white),
        ),
      ),
        body: Column(
      children: [
        Image.asset("assets/images/welcome.png"),

        Container(
          margin: EdgeInsets.all(65),
          width: double.infinity,
          child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
          ),
          onPressed: (){
            FirebaseAuth.instance.signOut();
            Navigator.of(context).push(MaterialPageRoute(builder: (c) => LoginScreen1()));
          },
          child: Text('Logout', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),),
          ),
        ),
      ],
    )
    );
  }
}
