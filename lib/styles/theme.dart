import 'package:flutter/material.dart';
import 'package:favmart_app/styles/colors.dart';

String gilroyFontFamily = "Gilroy";

ThemeData themeData = ThemeData(
  // ignore: deprecated_member_use
  accentColor: AppColors.primaryColor,
  fontFamily: gilroyFontFamily,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);
