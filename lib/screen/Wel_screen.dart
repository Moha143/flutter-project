import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:favmart_app/common_widgets/app_button.dart';
import 'package:favmart_app/common_widgets/app_text.dart';
import 'package:favmart_app/styles/colors.dart';
import 'SignUpScreen.dart';
import 'login.dart';
import 'logins.dart';

class WelcomeScreen extends StatelessWidget {
  final String imagePath = "assets/images/boys.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.fill,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Spacer(),
                SizedBox(
                  height: 20,
                ),
                welcomeTextWidget(),
                SizedBox(
                  height: 10,
                ),
                sloganText(),
                SizedBox(
                  height: 40,
                ),
                getstartbutton(context),
                SizedBox(
                  height: 40,
                )
              ],
            ),
          ),
        ));
  }

  Widget welcomeTextWidget() {
    return Column(
      children: [
        AppText(
          text: "Welcome to Our",
          fontSize: 40,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        AppText(
          text: "Store",
          fontSize: 40,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ],
    );
  }

  Widget getstartbutton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (Contex) => LoginScreen()));
        // Write Click Listener Code Here.
      },
      child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: 20, right: 20, top: 20),
          padding: EdgeInsets.only(left: 20, right: 20),
          height: 54,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.green,
          ),
          child: AppText(
            text: "Getstart",
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          )),
    );
  }

  Widget sloganText() {
    return AppText(
      text: "Get your grecories as fast as in hour",
      fontSize: 18,
      fontWeight: FontWeight.w800,
      color: Color(0xffFCFCFC).withOpacity(0.8),
    );
  }

  Widget getButton(BuildContext context) {
    return AppButton(
      label: "Get Started",
      fontWeight: FontWeight.w600,
      padding: EdgeInsets.symmetric(vertical: 25),
      onPressed: () {
        onGetStartedClicked(context);
      },
      key: null,
    );
  }

  void onGetStartedClicked(BuildContext context) {
    Navigator.of(context).pushReplacement(new MaterialPageRoute(
      builder: (BuildContext context) {
        return LoginScreen();
      },
    ));
  }
}
