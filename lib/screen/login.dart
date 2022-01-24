import 'package:favmart_app/common_widgets/app_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'SignUpScreen.dart';
// import 'Wel_screen.dart';
import 'forgotpassword.dart';
import 'navigation/home.dart';
// import 'navigation/home.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return initWidget();
  }

  initWidget() {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [
        Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(90),
              ),
              color: Colors.green,
              image: DecorationImage(
                image: AssetImage("assets/images/bannner.jpeg"),
                fit: BoxFit.cover,
              ),
            )),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: 30, right: 30, top: 70),
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
          margin: EdgeInsets.only(left: 30, right: 30, top: 20),
          padding: EdgeInsets.only(left: 20, right: 20),
          height: 54,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Color(0xffEEEEEE),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 20),
                  blurRadius: 100,
                  color: Color(0xffEEEEEE)),
            ],
          ),
          child: TextField(
            cursorColor: Colors.green,
            decoration: InputDecoration(
              focusColor: Colors.green,
              icon: Icon(
                Icons.vpn_key_rounded,
                size: 30,
                color: Colors.green,
              ),
              hintText: "Password",
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
            controller: password,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          alignment: Alignment.centerRight,
          child: GestureDetector(
            //onHover: (value) => 2,

            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (Contex) => Forgotcreen()));
              // Write Click Listener Code Here
            },
            child: AppText(
                text: "forgot Password?",
                fontSize: 17,
                fontWeight: FontWeight.w400,
                color: Colors.blue),
          ),
        ),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: 30, right: 30, top: 30),
          padding: EdgeInsets.only(left: 20, right: 20),
          height: 54,
          child: ElevatedButton(
            onPressed: () async {
              try {
                final newuser = await FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                        email: email.text, password: password.text);
                if (newuser != null) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DashboardScreen(),
                      ));
                }
              } catch (e) {
                print(e);
              }

              setState(() {});
            },
            style: ButtonStyle(),
            child: const Text('Login'),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText(
                  text: "Don't Have Any Account?",
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
              GestureDetector(
                child: AppText(
                    text: "SignUp?",
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.blue),
                onTap: () {
                  // Write Tap Code Here.
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpScreen(),
                      ));
                },
              )
            ],
          ),
        )
      ],
    )));
  }
}
