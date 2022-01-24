import 'package:favmart_app/styles/colors.dart';
import 'package:flutter/material.dart';

class FavouriteScreen extends StatelessWidget {
  // const CartScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.green,
        body: SafeArea(
            child: Container(
          margin: EdgeInsets.only(top: 80),
          child: SingleChildScrollView(
            child: Center(
              child: Text(
                "Favourite Page",
                style: TextStyle(color: Colors.black, fontSize: 30),
              ),
            ),
          ),
        )));
  }
}
