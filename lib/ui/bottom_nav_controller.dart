import 'package:favmart_app/const/AppColors.dart';
import 'package:favmart_app/ui/bottom_nav_pages/cart.dart';
import 'package:favmart_app/ui/bottom_nav_pages/favourite.dart';
import 'package:favmart_app/ui/bottom_nav_pages/home.dart';
import 'package:favmart_app/ui/bottom_nav_pages/profile.dart';
import 'package:flutter/material.dart';

class BottomNavController extends StatefulWidget {
  @override
  _BottomNavControllerState createState() => _BottomNavControllerState();
}

class _BottomNavControllerState extends State<BottomNavController> {
  final _pages = [
    Home(),
    Favourite(),
    Cart(),
    Profile(),
  ];
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 5,
        selectedItemColor: AppColors.deep_orange,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        selectedLabelStyle:
            TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline), title: Text("Favourite")),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart),
            title: Text("Cart"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text("Person"),
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            print(_currentIndex);
          });
        },
      ),
      body: _pages[_currentIndex],
    );
  }
}



// class NavigatorItem {
//   final String label;
//   final String iconPath;
//   final int index;
//   final Widget screen;

//   NavigatorItem(this.label, this.iconPath, this.index, this.screen);
// }

// List<NavigatorItem> navigatorItems = [
//   NavigatorItem("Shop", "assets/icons/shop_icon.svg", 0, HomeScreen()),
//   NavigatorItem("Cart", "assets/icons/cart_icon.svg", 1, CartScreen()),
//   NavigatorItem(
//       "Favourite", "assets/icons/favourite_icon.svg", 2, FavouriteScreen()),
//   NavigatorItem("Account", "assets/icons/account_icon.svg", 3, AccountScreen()),
// ];
