import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:favmart_app/const/AppColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../product_details_screen.dart';
import '../search_screen.dart';

/*
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> _carouselImages = [];
  var _dotPosition = 0;
  List _products = [];
  var _firestoreInstance = FirebaseFirestore.instance;

  fetchProducts() async {
    QuerySnapshot qn = await _firestoreInstance.collection("fruits").get();
    setState(() {
      for (int i = 0; i < qn.docs.length; i++) {
        _products.add({
          "Fquantity": qn.docs[i]["Quantity"],
          "FUnit": qn.docs[i]["Unit"],
          "product-name": qn.docs[i]["FName"],
          "product-description": qn.docs[i]["Description"],
          "product-price": qn.docs[i]["Price"],
          "product-img": qn.docs[i]["Image"],
        });
      }
    });

    return qn.docs;
  }

  @override
  void initState() {
    // fetchCarouselImages();
    fetchProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            Expanded(
              child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 1),
                  itemBuilder: (_, index) {
                    return GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) =>
                                  ProductDetails(_products[index]))),
                      child: Card(
                        elevation: 3,
                        child: Column(
                          children: [
                            AspectRatio(
                                aspectRatio: 2,
                                child: Container(
                                    color: Colors.yellow,
                                    child: Image.network(
                                      _products[index]["product-img"][0],
                                    ))),
                            Text("${_products[index]["product-name"]}"),
                            Text(
                                "${_products[index]["product-price"].toString()}"),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      )),
    );
  }
}

*/

import 'package:favmart_app/common_widgets/app_text.dart';
import 'package:favmart_app/screen/navigation/cart/CartScreen.dart';
import 'package:flutter/material.dart';
import 'package:favmart_app/styles/colors.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class Homess extends StatefulWidget {
  const Homess({Key? key}) : super(key: key);

  @override
  _HomessState createState() => _HomessState();
}

class _HomessState extends State<Homess> {
  List<String> _carouselImages = [];
  var _dotPosition = 0;
  List _products = [];
  var _firestoreInstance = FirebaseFirestore.instance;

  fetchProducts() async {
    QuerySnapshot qn = await _firestoreInstance.collection("fruits").get();
    setState(() {
      for (int i = 0; i < qn.docs.length; i++) {
        _products.add({
          "Fquantity": qn.docs[i]["Quantity"],
          "FUnit": qn.docs[i]["Unit"],
          "product-name": qn.docs[i]["FName"],
          "product-description": qn.docs[i]["Description"],
          "product-price": qn.docs[i]["Price"],
          "product-img": qn.docs[i]["Image"],
        });
      }
    });

    return qn.docs;
  }

  final double width = 174;
  final double height = 250;
  final Color borderColor = Color(0xffE2E2E2);
  final double borderRadius = 18;
  @override
  void initState() {
    // fetchCarouselImages();
    fetchProducts();
    super.initState();
  }

  //   Widget imageWidget() {
  //   return Container(
  //     child: Image.network(_products[index]["product-img"]),
  //   );
  // }

  Widget addWidget() {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17),
          color: Colors.green.shade600),
      child: Center(
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 25,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  padded(subTitle("Exclusive Order")),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    height: 250,
                    child: ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      itemCount: _products.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () {
                              //onItemClicked(context, items[index]);
                            },
                            child: Container(
                              width: width,
                              height: height,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: borderColor,
                                ),
                                borderRadius: BorderRadius.circular(
                                  borderRadius,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 15,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Center(
                                        child: Container(
                                          child: Image.network(
                                              _products[index]["product-img"]),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    AppText(
                                      text:
                                          ("${_products[index]["product-name"]}"),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    AppText(
                                      text: ("${_products[index]["FUnit"]}"),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF7C7C7C),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        AppText(
                                          text:
                                              ("${_products[index]["product-price"]}"),
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        Spacer(),
                                        addWidget()
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ));
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: 20,
                        );
                      },
                    ),
                  ),

                  //  getHorizontalItemSlider(exclusiveOffers),
                  SizedBox(
                    height: 15,
                  ),
                  padded(subTitle("Best Selling")),
                  //  getHorizontalItemSlider(bestSelling),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget padded(Widget widget) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: widget,
    );
  }

  // Widget getHorizontalItemSlider(List<GroceryItem> items) {
  //   return Container(
  //     margin: EdgeInsets.symmetric(vertical: 10),
  //     height: 250,
  //     child: ListView.separated(
  //       padding: EdgeInsets.symmetric(horizontal: 20),
  //       itemCount: items.length,
  //       scrollDirection: Axis.horizontal,
  //       itemBuilder: (context, index) {
  //         return GestureDetector(
  //           onTap: () {
  //             onItemClicked(context, items[index]);
  //           },
  //           child: GroceryItemCardWidget(
  //             item: items[index],
  //           ),
  //         );
  //       },
  //       separatorBuilder: (BuildContext context, int index) {
  //         return SizedBox(
  //           width: 20,
  //         );
  //       },
  //     ),
  //   );
  // }

  // void onItemClicked(BuildContext context, GroceryItem groceryItem) {
  //   // Navigator.push(
  //   //   context,
  //   //   MaterialPageRoute(
  //   //       builder: (context) => ProductDetailsScreen(groceryItem)),
  //   // );
  // }

  Widget subTitle(String text) {
    return Row(
      children: [
        Text(
          text,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Spacer(),
        Text(
          "See All",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.green.shade600,
          ),
        ),
      ],
    );
  }
}

// class ProductDetailsScreen {
//   ProductDetailsScreen(GroceryItem groceryItem);
// }

// class GroceryFeaturedItem {
//   final String name;
//   final String imagePath;

//   GroceryFeaturedItem(this.name, this.imagePath);
// }

// var groceryFeaturedItems = [
//   GroceryFeaturedItem("Pulses", "assets/images/pulses.png"),
//   GroceryFeaturedItem("Rise", "assets/images/rise.png"),
// ];

// class GroceryFeaturedCard extends StatelessWidget {
//   const GroceryFeaturedCard(this.groceryFeaturedItem,
//       {this.color: Colors.green});

//   final GroceryFeaturedItem groceryFeaturedItem;
//   final Color color;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 250,
//       height: 105,
//       padding: EdgeInsets.symmetric(vertical: 16, horizontal: 17),
//       decoration: BoxDecoration(
//           color: color.withOpacity(0.25),
//           borderRadius: BorderRadius.circular(18)),
//       child: Row(
//         children: [
//           Image(
//             image: AssetImage(groceryFeaturedItem.imagePath),
//           ),
//           SizedBox(
//             width: 15,
//           ),
//           AppText(
//             text: groceryFeaturedItem.name,
//             fontSize: 20,
//             fontWeight: FontWeight.w600,
//           )
//         ],
//       ),
//     );
//   }
// }

// class GroceryItem {
//   final String name;
//   final String description;
//   final double price;
//   final String imagePath;

//   GroceryItem(
//       {required this.name,
//       required this.description,
//       required this.price,
//       required this.imagePath});
// }

// var demoItems = [
//   GroceryItem(
//       name: "Organic Bananas",
//       description: "7pcs, Priceg",
//       price: 4.99,
//       imagePath: "assets/images/grocery_images/banana.png"),
//   GroceryItem(
//       name: "Red Apple",
//       description: "1kg, Priceg",
//       price: 4.99,
//       imagePath: "assets/images/grocery_images/apple.png"),
//   GroceryItem(
//       name: "Bell Pepper Red",
//       description: "1kg, Priceg",
//       price: 4.99,
//       imagePath: "assets/images/grocery_images/pepper.png"),
//   GroceryItem(
//       name: "Ginger",
//       description: "250gm, Priceg",
//       price: 4.99,
//       imagePath: "assets/images/grocery_images/ginger.png"),
//   GroceryItem(
//       name: "Ginger",
//       description: "250gm, Priceg",
//       price: 4.99,
//       imagePath: "assets/images/grocery_images/beef.png"),
//   GroceryItem(
//       name: "Ginger",
//       description: "250gm, Priceg",
//       price: 4.99,
//       imagePath: "assets/images/grocery_images/chicken.png"),
// ];

// var exclusiveOffers = [demoItems[0], demoItems[1]];

// var bestSelling = [demoItems[2], demoItems[3]];

// var groceries = [demoItems[4], demoItems[5]];

// var beverages = [
//   GroceryItem(
//       name: "Dite Coke",
//       description: "355ml, Price",
//       price: 1.99,
//       imagePath: "assets/images/beverages_images/diet_coke.png"),
//   GroceryItem(
//       name: "Sprite Can",
//       description: "325ml, Price",
//       price: 1.50,
//       imagePath: "assets/images/beverages_images/sprite.png"),
//   GroceryItem(
//       name: "Apple Juice",
//       description: "2L, Price",
//       price: 15.99,
//       imagePath: "assets/images/beverages_images/apple_and_grape_juice.png"),
//   GroceryItem(
//       name: "Orange Juice",
//       description: "2L, Price",
//       price: 1.50,
//       imagePath: "assets/images/beverages_images/orange_juice.png"),
//   GroceryItem(
//       name: "Coca Cola Can",
//       description: "325ml, Price",
//       price: 4.99,
//       imagePath: "assets/images/beverages_images/coca_cola.png"),
//   GroceryItem(
//       name: "Pepsi Can",
//       description: "330ml, Price",
//       price: 4.99,
//       imagePath: "assets/images/beverages_images/pepsi.png"),
// ];

// class GroceryItemCardWidget extends StatelessWidget {
//   GroceryItemCardWidget({key, required this.item}) : super(key: key);
//   final GroceryItem item;

//   final double width = 174;
//   final double height = 250;
//   final Color borderColor = Color(0xffE2E2E2);
//   final double borderRadius = 18;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: width,
//       height: height,
//       decoration: BoxDecoration(
//         border: Border.all(
//           color: borderColor,
//         ),
//         borderRadius: BorderRadius.circular(
//           borderRadius,
//         ),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(
//           horizontal: 15,
//           vertical: 15,
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Expanded(
//               child: Center(
//                 child: imageWidget(),
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             AppText(
//               text: item.name,
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//             ),
//             AppText(
//               text: item.description,
//               fontSize: 14,
//               fontWeight: FontWeight.w600,
//               color: Color(0xFF7C7C7C),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Row(
//               children: [
//                 AppText(
//                   text: "\$${item.price.toStringAsFixed(2)}",
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 Spacer(),
//                 addWidget()
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Widget imageWidget() {
//     return Container(
//       child: Image.asset(item.imagePath),
//     );
//   }

//   Widget addWidget() {
//     return Container(
//       height: 45,
//       width: 45,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(17),
//           color: Colors.green.shade600),
//       child: Center(
//         child: Icon(
//           Icons.add,
//           color: Colors.white,
//           size: 25,
//         ),
//       ),
//     );
//   }
// }
