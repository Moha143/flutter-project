// // ignore_for_file: deprecated_member_use

// import 'package:flutter/material.dart';
// import 'package:favmart_app/styles/colors.dart';

// class AppButton extends StatelessWidget {
//   final String label;
//   final double roundness;
//   final FontWeight fontWeight;
//   final EdgeInsets padding;
//   final Widget trailingWidget;
//   final Function onPressed;

//   const AppButton({
//     this.label,
//     this.roundness = 18,
//     this.fontWeight = FontWeight.bold,
//     this.padding = const EdgeInsets.symmetric(vertical: 24),
//     this.trailingWidget,
//     this.onPressed,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.maxFinite,
//       child: RaisedButton(
//         visualDensity: VisualDensity.compact,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(roundness),
//         ),
//         color: AppColors.primaryColor,
//         textColor: Colors.white,
//         elevation: 0.0,
//         padding: padding,
//         child: Stack(
//           fit: StackFit.passthrough,
//           children: <Widget>[
//             Center(
//               child: Text(
//                 label,
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: fontWeight,
//                 ),
//               ),
//             ),
//             if (trailingWidget != null)
//               Positioned(
//                 top: 0,
//                 right: 25,
//                 child: trailingWidget,
//               )
//           ],
//         ),
//         onPressed: () {
//           if (onPressed != null) onPressed();
//         },
//       ),
//     );
//   }
// }
