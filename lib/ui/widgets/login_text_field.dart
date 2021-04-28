// import 'package:flutter/material.dart';
//
// class TextFieldLogin extends StatelessWidget {
//   final TextEditingController controller;
//   final IconData iconData, suffixIcon;
//   final String hintText;
//   final TextInputType inputType;
//   final bool obscureText;
//   final String errorText;
//   final ValueChanged<bool> callFunction;
//   TextFieldLogin(this.controller, this.iconData, this.hintText, this.inputType,
//       this.obscureText, this.errorText, this.suffixIcon,
//       {this.callFunction});
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         margin: EdgeInsets.only(top: 10, left: 35.0, right: 35.0),
//         child: TextFormField(
//           controller: controller,
//           cursorColor: Colors.black,
//           obscureText: obscureText,
//           keyboardType: inputType,
//           textAlignVertical: TextAlignVertical.center,
//           enabled: true,
//           decoration: InputDecoration(
//             focusedBorder: UnderlineInputBorder(
//               borderSide: BorderSide(color: Colors.black),
//             ),
//             errorText: errorText,
//             prefixIcon: Padding(
//               padding: EdgeInsets.only(right: 20),
//               child: Icon(
//                 iconData,
//                 color: Colors.black,
//               ),
//             ),
//             suffixIcon: GestureDetector(
//               onTap: () {
//                 callFunction(!obscureText);
//               },
//               child: Padding(
//                 padding: const EdgeInsets.only(right: 20),
//                 child: Icon(
//                   obscureText?Icons.visibility:Icons.visibility_off,
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//             hintText: hintText,
//             hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
//           ),
//         ));
//   }
// }