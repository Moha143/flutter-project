import 'package:flutter/material.dart';

import 'Account/AccountScreen.dart';
import 'cart/CartScreen.dart';
import 'Favorite/FavouriteScreen.dart';
import 'home/HomeScreen.dart';

class NavigatorItem {
  final String label;
  final String iconPath;
  final int index;
  final Widget screen;

  NavigatorItem(this.label, this.iconPath, this.index, this.screen);
}

List<NavigatorItem> navigatorItems = [
  NavigatorItem("Shop", "assets/icons/shop_icon.svg", 0, HomeScreen()),
  NavigatorItem("Cart", "assets/icons/cart_icon.svg", 1, CartScreen()),
  NavigatorItem(
      "Favourite", "assets/icons/favourite_icon.svg", 2, FavouriteScreen()),
  NavigatorItem("Account", "assets/icons/account_icon.svg", 3, AccountScreen()),
];
