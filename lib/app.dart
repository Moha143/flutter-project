import 'package:favmart_app/ui/login_screen.dart';
import 'package:flutter/material.dart';
//import 'package:favmart_app/screens/splash_screen.dart';
import 'package:favmart_app/styles/theme.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: LoginScreen(),
    );
  }
}
