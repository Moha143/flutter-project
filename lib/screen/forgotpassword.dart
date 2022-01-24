import 'package:favmart_app/common_widgets/app_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'navigation/home.dart';

class Forgotcreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<Forgotcreen> {
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return initWidget();
  }

  initWidget() {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
                height: 310,
                // width: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(00),
                  ),
                  color: Colors.white,
                  image: DecorationImage(
                      image: AssetImage("assets/images/del.jpeg"),
                      fit: BoxFit.cover),
                )),
            Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 10, right: 10, top: 5),
                padding: EdgeInsets.only(left: 10, right: 10),
                height: 74,
                child: Column(
                  children: [
                    AppText(
                      text: "Get your fruits and vegetable",
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                    AppText(
                      text: "With FAVMART",
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ],
                )),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 30, right: 30, top: 20),
              padding: EdgeInsets.only(left: 20, right: 20),
              height: 54,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[200],
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Color(0xffEEEEEE)),
                ],
              ),
              child: TextField(
                cursorColor: Colors.green,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.email,
                    size: 30,
                    color: Colors.green,
                  ),
                  hintText: "Email",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                controller: email,
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 30, right: 30, top: 30),
              padding: EdgeInsets.only(left: 20, right: 20),
              height: 54,
              child: ElevatedButton(
                onPressed: () async {
                  await FirebaseAuth.instance
                      .sendPasswordResetEmail(email: email.text);
                  setState(() {});
                },
                style: ButtonStyle(),
                child: const Text('Resset'),
              ),
            ),
          ],
        )));
  }
}
