import 'dart:async';
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:fuelapp/screens/locationscreen.dart';
import 'package:fuelapp/screens/otpverification.dart';
import 'package:fuelapp/services/style.dart';
import 'package:fuelapp/userdetail.dart';
import 'package:lottie/lottie.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:slider_button/slider_button.dart';

class OtpControllerScreen extends StatefulWidget {
  final String phone;
  final String codeDigits;

  OtpControllerScreen({this.phone, this.codeDigits});

  @override
  _OtpControllerScreenState createState() => _OtpControllerScreenState();
}

class _OtpControllerScreenState extends State<OtpControllerScreen> {
  final GlobalKey<ScaffoldState> _scaffolkey = GlobalKey<ScaffoldState>();
  final TextEditingController _pinOTPCodeController = TextEditingController();
  final FocusNode _pinOTPCodeFocus = FocusNode();
  String varificationCode;

  final BoxDecoration pinOTPCodeDecoration = BoxDecoration(
      color: Colors.blueAccent,
      borderRadius: BorderRadius.circular(10.0),
      border: Border.all(
        color: Colors.grey,
      ));

  @override
  void initState() {
    super.initState();

    verifyPhoneNumber();
  }

  verifyPhoneNumber() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: "${widget.codeDigits + widget.phone}",
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) {
          if (value.user != null) {
            showDialog<String>(
                context: context,
                builder: (BuildContext context) => kdialougebox());
          }
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.message.toString()),
            duration: Duration(seconds: 3),
          ),
        );
      },
      codeSent: (String vID, int resendToken) {
        setState(() {
          varificationCode = vID;
        });
      },
      codeAutoRetrievalTimeout: (String vID) {
        setState(() {
          varificationCode = vID;
        });
      },
      timeout: Duration(seconds: 60),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffolkey,
      appBar: AppBar(
        toolbarHeight: 100,
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text("Verify your phone number ",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Image.network(
                'https://img.icons8.com/fluency/30/000000/back.png')),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    Lottie.asset("assets/animations/50124-user-profile.json")),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    verifyPhoneNumber();
                  },
                  child: Row(children: <Widget>[
                    Expanded(
                      child: new Container(
                          margin:
                              const EdgeInsets.only(left: 20.0, right: 15.0),
                          child: Divider(
                            color: Colors.black,
                            height: 50,
                          )),
                    ),
                    Text(
                      "Enter Your Otp Code Here",
                      style: kSubtitleStyle,
                    ),
                    Expanded(
                      child: new Container(
                          margin:
                              const EdgeInsets.only(left: 15.0, right: 20.0),
                          child: Divider(
                            color: Colors.black,
                            height: 50,
                          )),
                    ),
                  ]),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            OtpTextField(
                numberOfFields: 6,
                filled: true,
                fillColor: Color(0xffa2d2ff),
                borderColor: Color(0xff012a4a),
                //set to true to show as box or false to show as dash
                showFieldAsBox: true,

                //runs when a code is typed in

                //handle validation or checks here

                //runs when every textfield is filled
                onSubmit: (pin) async {
                  try {
                    await FirebaseAuth.instance
                        .signInWithCredential(PhoneAuthProvider.credential(
                            verificationId: varificationCode, smsCode: pin))
                        .then((value) {
                      if (value.user != null) {
                        showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => kdialougebox());
                      }
                    });
                  } catch (e) {
                    FocusScope.of(context).unfocus();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: AlertDialog(content: Text("Invalid OTP")),
                        duration: Duration(seconds: 3),
                      ),
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }
}

class kdialougebox extends StatefulWidget {
  const kdialougebox({
    Key key,
  }) : super(key: key);

  @override
  State<kdialougebox> createState() => _kdialougeboxState();
}

class _kdialougeboxState extends State<kdialougebox> {
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => ProfilePage())));
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      elevation: 0.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      children: <Widget>[
        Lottie.asset("assets/animations/58201-success-tick.json",
            height: 150, repeat: false),
        SizedBox(
          height: 10,
        ),
        Center(child: Text("Verification Successfull")),
        SizedBox(
          height: 10,
        ),
        // Padding(
        //     padding: const EdgeInsets.only(top: 50, left: 5, right: 5),
        // child: SliderButton(
        //     radius: 2,
        //     action: () {
        //       ///Do something here
        //       Navigator.pushReplacement(context,
        //           MaterialPageRoute(builder: (context) => MyLocation()));
        //     },
        //     label: Text(
        //       "Slide to Continue",
        //       style: TextStyle(
        //           color: Color(0xff293241),
        //           fontWeight: FontWeight.w500,
        //           fontSize: 17),
        //     ),
        //     icon: Icon(Icons.arrow_right_alt_rounded))),
      ],
    );
  }
}
