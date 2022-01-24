// import 'package:favmart_app/common_widgets/app_text.dart';
// import 'package:favmart_app/screen/navigation/home.dart';
// import 'package:flutter/material.dart';
// import 'package:pinput/pin_put/pin_put.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class Confirmcreen extends StatefulWidget {
//   final String phone, name, address, password, email;
//   Confirmcreen(
//       {required this.address,
//       this.phone,
//       this.name,
//       this.password,
//       this.email});

//   @override
//   State<StatefulWidget> createState() => StartState();
// }

// class StartState extends State<Confirmcreen> {
//   String erificationCode;
//   final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
//   final TextEditingController _pinPutController = TextEditingController();
//   final FocusNode _pinPutFocusNode = FocusNode();
//   final BoxDecoration pinPutDecoration = BoxDecoration(
//     color: const Color.fromRGBO(43, 46, 66, 1),
//     borderRadius: BorderRadius.circular(10.0),
//     border: Border.all(
//       color: const Color.fromRGBO(126, 203, 224, 1),
//     ),
//   );
//   @override
//   Widget build(BuildContext context) {
//     return initWidget();
//   }

//   initWidget() {
//     return Scaffold(
//         backgroundColor: Colors.white,
//         body: SingleChildScrollView(
//             child: Column(
//           children: [
//             Container(
//                 height: 310,
//                 // width: 400,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(00),
//                   ),
//                   color: Colors.white,
//                   image: DecorationImage(
//                       image: AssetImage("assets/images/del.jpeg"),
//                       fit: BoxFit.cover),
//                 )),
//             Container(
//                 alignment: Alignment.center,
//                 margin: EdgeInsets.only(left: 10, right: 10, top: 5),
//                 padding: EdgeInsets.only(left: 10, right: 10),
//                 height: 74,
//                 child: Column(
//                   children: [
//                     AppText(
//                       text: "Get your fruits and vegetable",
//                       fontSize: 10,
//                       fontWeight: FontWeight.w500,
//                       color: Colors.black,
//                     ),
//                     AppText(
//                       text: (''),
//                       fontSize: 10,
//                       fontWeight: FontWeight.w500,
//                       color: Colors.black,
//                     ),
//                   ],
//                 )),
//             Padding(
//               padding: const EdgeInsets.all(30.0),
//               child: PinPut(
//                 fieldsCount: 6,
//                 textStyle: const TextStyle(fontSize: 25.0, color: Colors.white),
//                 eachFieldWidth: 40.0,
//                 eachFieldHeight: 55.0,
//                 focusNode: _pinPutFocusNode,
//                 controller: _pinPutController,
//                 submittedFieldDecoration: pinPutDecoration,
//                 selectedFieldDecoration: pinPutDecoration,
//                 followingFieldDecoration: pinPutDecoration,
//                 pinAnimationType: PinAnimationType.fade,
//                 onSubmit: (pin) async {
//                   try {
//                     await FirebaseAuth.instance
//                         .signInWithCredential(PhoneAuthProvider.credential(
//                             verificationId: erificationCode, smsCode: pin))
//                         .then((value) async {
//                       if (value.user != null) {
//                         Navigator.pushAndRemoveUntil(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => DashboardScreen()),
//                             (route) => false);
//                       }
//                     });
//                   } catch (e) {
//                     FocusScope.of(context).unfocus();
//                     _scaffoldkey.currentState
//                         .showSnackBar(SnackBar(content: Text('invalid OTP')));
//                   }
//                 },
//               ),
//             )
//           ],
//         )));
//   }

//   _verifyPhone() async {
//     await FirebaseAuth.instance.verifyPhoneNumber(
//         phoneNumber: '+252${widget.phone}',
//         verificationCompleted: (PhoneAuthCredential credential) async {
//           await FirebaseAuth.instance
//               .signInWithCredential(credential)
//               .then((value) async {
//             if (value.user != null) {
//               Navigator.pushAndRemoveUntil(
//                   context,
//                   MaterialPageRoute(builder: (context) => DashboardScreen()),
//                   (route) => false);
//             }
//           });
//         },
//         verificationFailed: (FirebaseAuthException e) {
//           print(e.message);
//         },
//         codeSent: (String verficationID, int resendToken) {
//           setState(() {
//             erificationCode = verficationID;
//           });
//         },
//         codeAutoRetrievalTimeout: (String verificationID) {
//           setState(() {
//             erificationCode = verificationID;
//           });
//         },
//         timeout: Duration(seconds: 60));
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _verifyPhone();
//   }
// }
