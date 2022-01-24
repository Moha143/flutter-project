import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:favmart_app/common_widgets/app_text.dart';
import 'package:favmart_app/const/AppColors.dart';
import 'package:favmart_app/styles/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../product_details_screen.dart';
import '../search_screen.dart';

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../product_details_screen.dart';
import '../search_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> _carouselImages = [];
  var _dotPosition = 0;
  List _products = [];
  List _Veg = [];
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

  fetchveg() async {
    QuerySnapshot vegetable =
        await _firestoreInstance.collection("vegetables").get();
    setState(() {
      for (int i = 0; i < vegetable.docs.length; i++) {
        _Veg.add({
          "Vq": vegetable.docs[i]["VQuantity"],
          "Vu": vegetable.docs[i]["VUnit"],
          "Vn": vegetable.docs[i]["VName"],
          "Vd": vegetable.docs[i]["VDescription"],
          "Vp": vegetable.docs[i]["VPrice"],
          "Vi": vegetable.docs[i]["VImage"],
        });
      }
    });

    return vegetable.docs;
  }

  @override
  void initState() {
    // fetchCarouselImages();
    fetchProducts();
    fetchveg();
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
              height: 65.h,
            ),
            Container(
              width: 500,
              height: 220,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(30)),
              child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1, childAspectRatio: 1),
                  itemBuilder: (_, index) {
                    return Container(
                      height: 400,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40)),
                      child: Card(
                        elevation: 5,
                        child: Column(
                          children: [
                            AspectRatio(
                                aspectRatio: 2,
                                child: Container(
                                    margin: EdgeInsets.only(right: 10),
                                    color: Colors.white,
                                    child: Image.network(
                                      _products[index]["product-img"],
                                    ))),
                            Container(
                              margin: EdgeInsets.only(right: 60),
                              child: Text(
                                "${_products[index]["product-name"]}",
                                style: TextStyle(
                                    fontFamily: gilroyFontFamily,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 60),
                              child: Text(
                                "1  ${_products[index]["FUnit"]}",
                                style: TextStyle(
                                    fontFamily: gilroyFontFamily,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) =>
                                          ProductDetails(_products[index]))),
                              child: Container(
                                margin: EdgeInsets.only(right: 80),
                                child: Text(
                                  "\$" +
                                      "\$ ${_products[index]["product-price"].toString()}",
                                  style: TextStyle(
                                      fontFamily: gilroyFontFamily,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 100),
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
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            Container(
                child: Column(
              children: [
                Text("Vegetable", style: TextStyle()),
              ],
            )),
            Container(
              width: 500,
              height: 220,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(30)),
              child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _Veg.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1, childAspectRatio: 1),
                  itemBuilder: (_, inde) {
                    return Container(
                      height: 400,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40)),
                      child: Card(
                        elevation: 5,
                        child: Column(
                          children: [
                            AspectRatio(
                                aspectRatio: 2,
                                child: Container(
                                    margin: EdgeInsets.only(right: 10),
                                    color: Colors.white,
                                    child: Image.network(
                                      _Veg[inde]["Vi"],
                                    ))),
                            Container(
                              margin: EdgeInsets.only(right: 60),
                              child: Text(
                                "${_Veg[inde]["Vn"]}",
                                style: TextStyle(
                                    fontFamily: gilroyFontFamily,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 60),
                              child: Text(
                                "1  ${_Veg[inde]["Vu"]}",
                                style: TextStyle(
                                    fontFamily: gilroyFontFamily,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 80),
                              child: Text(
                                " @ ${_Veg[inde]["Vp"].toString()}",
                                style: TextStyle(
                                    fontFamily: gilroyFontFamily,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 100),
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
                            )
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
                                        Container(
                                          height: 45,
                                          width: 45,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(17),
                                              color: Colors.green.shade600),
                                          child: Center(
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.white,
                                              size: 25,
                                            ),
                                          ),
                                        )
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
                                          color: Colors.white,
                                          child: Image.network(
                                            _products[index]["product-img"],
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
