import 'package:favmart_app/ui/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app.dart';
// import 'package:provider/provider.dart';
// import 'app.dart';
// import 'screen/navigation/home/fruit_notifier.dart';

// void main() => runApp(MultiProvider(
//       providers: [
//         ChangeNotifierProvider(
//           create: (context) => FruitNotifier(),
//         ),
//       ],
//       child: MyApp(),
//     ));

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   Firebase.initializeApp();

//   runApp(MyApp());
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: () {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: SplashScreen(),
        );
      },
    );
  }
}


















// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();

//   runApp(sampleFirebase());
// }

// class sampleFirebase extends StatefulWidget {
//   const sampleFirebase({key}) : super(key: key);

//   @override
//   _sampleFirebaseState createState() => _sampleFirebaseState();
// }

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
//                 children: snapshot.data.docs.map((student) {
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
