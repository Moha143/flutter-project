// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:favmart_app/screen/navigation/home/fruit_notifier.dart';

// class FruitModel {
//   String name;
//   String image;
//   //String date;
//   String price;
//   String description;
//   String unity;

//   FruitModel({this.description, this.name, this.price, this.unity, this.image});

//   FruitModel.fromMap(Map<String, dynamic> data) {
//     price = data['Price'];
//     name = data['FName'];
//     description = data['Description'];
//     image = data['Image'];
//     unity = data['Unit'];
//   }

//   // Map<String, dynamic> toMap() {
//   //   return {
//   //     'FName': name,
//   //     'Price': price,
//   //     'Description': description,
//   //     'Image': image,
//   //     'Unit': unity
//   //   };
//   // }
// }


// // getFoods(FruitNotifier foodNotifier) async {
// //   QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('Society Name').get();
// // List docs = snapshot.docs;
// //   // QuerySnapshot snapshot = await Firestore.instance
// //   //     .collection('Foods')
// //   //     .orderBy("createdAt", descending: true)
// //   //     .getDocuments();
      
// //   List<Fruits> _foodList = [];

// //   snapshot.docs.forEach((document) {
// //     Fruits food = Fruits.fromMap(docs.data);
// //     _foodList.add(food);
// //   });

// //   foodNotifier.fruitList = _foodList;
// // }
 