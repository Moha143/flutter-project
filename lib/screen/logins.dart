// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//
//   runApp(sampleFirebase());
// }
//
// class sampleFirebase extends StatefulWidget {
//   const sampleFirebase({key}) : super(key: key);
//
//   @override
//   _sampleFirebaseState createState() => _sampleFirebaseState();
// }
//
// class _sampleFirebaseState extends State<sampleFirebase> {
//   final _controller = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     CollectionReference student =
//         FirebaseFirestore.instance.collection('students');
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: TextField(
//             controller: _controller,
//           ),
//           backgroundColor: Colors.grey,
//         ),
//         body: Center(
//           child: StreamBuilder(
//             stream: student.snapshots(),
//             builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//               return ListView(
//                 children: snapshot.data!.docs.map((student) {
//                   return Center(
//                     child: ListTile(
//                       title: Text(student['name']),
//                       onLongPress: () {
//                         student.reference.delete();
//                       },
//                     ),
//                   );
//                 }).toList(),
//               );
//             },
//           ),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             student.add({
//               'name': _controller.text,
//             });
//             _controller.clear();
//           },
//           child: Icon(Icons.save),
//         ),
//       ),
//     );
//   }
// }
