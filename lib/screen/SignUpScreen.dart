import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:favmart_app/common_widgets/app_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Confirm.dart';
import 'navigation/home.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<SignUpScreen> {
  TextEditingController cname = TextEditingController();
  TextEditingController cemail = TextEditingController();
  TextEditingController caddress = TextEditingController();
  TextEditingController cphone = TextEditingController();
  TextEditingController cpassword = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;

  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  String errorMessage = '';
  @override
  Widget build(BuildContext context) => initWidget();
  Widget initWidget() {
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
          margin: EdgeInsets.only(left: 30, right: 30, top: 30),
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
                Icons.person,
                size: 20,
                color: Colors.green,
              ),
              hintText: "Name",
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
            controller: cname,
          ),
        ),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: 30, right: 30, top: 30),
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
                size: 20,
                color: Colors.green,
              ),
              hintText: "Email",
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
            controller: cemail,
          ),
        ),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: 30, right: 30, top: 30),
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
                Icons.location_city_outlined,
                size: 20,
                color: Colors.green,
              ),
              hintText: "Address",
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
            controller: caddress,
          ),
        ),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: 30, right: 30, top: 30),
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
                Icons.phone,
                size: 20,
                color: Colors.green,
              ),
              hintText: "Phone",
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
            controller: cphone,
          ),
        ),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: 30, right: 30, top: 30),
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
                Icons.vpn_key,
                size: 20,
                color: Colors.green,
              ),
              hintText: "Password",
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
            controller: cpassword,
          ),
        ),
        // GestureDetector(
        //   onTap: ()  {
        //     c
        //   },ld: Container(
        //     alignment: Alignment.center,
        //     margin: EdgeInsets.only(left: 30, right: 30, top: 30),
        //     padding: EdgeInsets.only(left: 20, right: 20),
        //     height: 54,
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(50),
        //       color: Colors.green,
        //       boxShadow: [
        //         BoxShadow(
        //             offset: Offset(0, 10),
        //             blurRadius: 50,
        //             color: Color(0xffEEEEEE)),
        //       ],
        //     ),
        //     child: AppText(
        //         text: "Register",
        //         fontSize: 30,
        //         fontWeight: FosntWeight.w500,
        //         color: Colors.white),
        //   ),
        // ),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: 30, right: 30, top: 30),
          padding: EdgeInsets.only(left: 20, right: 20),
          height: 100,
          child: ElevatedButton(
            onPressed: () async {
              try {
                await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: cemail.text, password: cpassword.text);
                var firebaseUser = FirebaseAuth.instance.currentUser;
                FirebaseFirestore.instance
                    .collection("users")
                    .doc(firebaseUser!.uid)
                    .set({
                  "address": caddress.text,
                  "phone": cphone.text,
                  "email": cemail.text,
                  "name": cname.text,
                  "date": DateTime.now(),
                }, SetOptions(merge: true)).then((_) {
                  print("success!");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DashboardScreen(),
                      ));
                });
              } catch (e) {
                print(" error login ${e}");
              }

              setState(() {});
            },
            style: ButtonStyle(),
            child: const Text('Register'),
          ),
        ),

        Container(
          margin: EdgeInsets.only(top: 10, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText(
                  text: "Already have a Account?",
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
              GestureDetector(
                child: AppText(
                    text: "Sign?",
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.blue),
                onTap: () {
                  // Write Tap Code Here.
                  Navigator.pop(context);
                },
              )
            ],
          ),
        )
      ],
    )));
  }
}
