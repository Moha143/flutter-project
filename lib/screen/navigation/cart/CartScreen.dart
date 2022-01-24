import 'package:favmart_app/styles/colors.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  // CartScreen(product);

  // const CartScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.darkGrey,
        body: SafeArea(
            child: Container(
          margin: EdgeInsets.only(top: 80),
          child: SingleChildScrollView(
            child: Center(
              child: Text(
                "Cart Page",
                style: TextStyle(color: Colors.black, fontSize: 30),
              ),
            ),
          ),
        )));
  }
}
