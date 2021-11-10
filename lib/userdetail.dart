import 'dart:io';

import 'package:animated_textformfields/custom_textformfield_lite/custom_textformfield_lite.dart';
import 'package:animated_textformfields/slide_in_textformfield/slide_in_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:fuelapp/screens/locationscreen.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  // const ProfilePage({ Key? key }) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File pickedImage;
  FocusNode myFocusNode = FocusNode();
  TextEditingController controllername = TextEditingController();
  TextEditingController controllernumber = TextEditingController();
  TextEditingController controllermail = TextEditingController();
  TextEditingController controlleradress = TextEditingController();
  TextEditingController controllerpincode = TextEditingController();

  @override
  void dispose() {
    controllername.dispose();
    controllernumber.dispose();
    controllermail.dispose();
    controlleradress.dispose();
    controllerpincode.dispose();
    myFocusNode.dispose();
    super.dispose();
  }

  pickImage(ImageSource imageType) async {
    try {
      final photo = await ImagePicker().pickImage(source: imageType);
      if (photo == null) return;
      final tempImage = File(photo.path);
      setState(() {
        pickedImage = tempImage;
      });

      Get.back();
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  void imagePickerOption() {
    Get.bottomSheet(
      SingleChildScrollView(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
          child: Container(
            color: Colors.white,
            height: 250,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Pic Image From",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        elevation: 4.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        primary: Color(0xffee6c4d)),
                    onPressed: () {
                      pickImage(ImageSource.camera);
                    },
                    icon: const Icon(Icons.camera),
                    label: const Text("CAMERA"),
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        elevation: 4.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        primary: Color(0xffee6c4d)),
                    onPressed: () {
                      pickImage(ImageSource.gallery);
                    },
                    icon: const Icon(Icons.image),
                    label: const Text("GALLERY"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        elevation: 4.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        primary: Color(0xffee6c4d)),
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.close),
                    label: const Text("CANCEL"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 50,
            ),
            Align(
              alignment: Alignment.center,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.indigo, width: 1),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                    child: ClipOval(
                      child: pickedImage != null
                          ? Image.file(
                              pickedImage,
                              width: 170,
                              height: 170,
                              alignment: Alignment.topCenter,
                              fit: BoxFit.cover,
                            )
                          : Image.network(
                              'https://upload.wikimedia.org/wikipedia/commons/5/5f/Alberto_conversi_profile_pic.jpg',
                              width: 170,
                              height: 170,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 10,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                        onPressed: () {
                          imagePickerOption();
                        },
                        icon: const Icon(
                          Icons.add_a_photo_outlined,
                          color: Color(0xffee6c4d),
                          size: 25,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SlideInTextFormField(
              vsync: AnimatedListState(),
              width: MediaQuery.of(context).size.width * 0.875,
              height: 48.0,
              inputType: TextInputType.text,
              fieldText: " Full Name",
              controller: controllername,
              textStyle: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
              ),
              cornerRadius: BorderRadius.circular(14.0),
            ),
            SlideInTextFormField(
              vsync: AnimatedListState(),
              width: MediaQuery.of(context).size.width * 0.875,
              height: 48.0,
              inputType: TextInputType.numberWithOptions(),
              fieldText: "Phone number",
              controller: controllernumber,
              textStyle: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
              ),
              cornerRadius: BorderRadius.circular(14.0),
            ),
            SlideInTextFormField(
              vsync: AnimatedListState(),
              width: MediaQuery.of(context).size.width * 0.875,
              height: 48.0,
              inputType: TextInputType.text,
              fieldText: "E-mail",
              controller: controllermail,
              textStyle: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
              ),
              cornerRadius: BorderRadius.circular(14.0),
            ),
            SlideInTextFormField(
              vsync: AnimatedListState(),
              width: MediaQuery.of(context).size.width * 0.875,
              height: 70.0,
              inputType: TextInputType.text,
              fieldText: "Address",
              controller: controlleradress,
              textStyle: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
              ),
              cornerRadius: BorderRadius.circular(14.0),
            ),
            SlideInTextFormField(
              vsync: AnimatedListState(),
              width: MediaQuery.of(context).size.width * 0.875,
              height: 48.0,
              inputType: TextInputType.numberWithOptions(),
              fieldText: " pincode",
              controller: controllerpincode,
              textStyle: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
              ),
              cornerRadius: BorderRadius.circular(14.0),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (builder) => MyLocation()));
        },
        style: ElevatedButton.styleFrom(
            elevation: 0.0, alignment: Alignment.center),
        child: Text("Continue"),
      ),
    );

// class HeaderCurvedContainer extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()..color = Color(0xff555555);
//     Path path = Path()
//       ..relativeLineTo(0, 150)
//       ..quadraticBezierTo(size.width / 2, 225, size.width, 150)
//       ..relativeLineTo(0, -150)
//       ..close();
//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => false;
// }
  }
}

@override
Widget build(BuildContext context) {
  return null;
}
