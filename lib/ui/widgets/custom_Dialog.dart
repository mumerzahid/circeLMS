// import 'package:crice_hospital_app/app/locator.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:stacked_services/stacked_services.dart';
//
// class CustomDialog extends StatelessWidget {
//   TextEditingController emailController = TextEditingController();
//   final NavigationService _navigationService = locator<NavigationService>();
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: MediaQuery.of(context).size.height * 0.35,
//       child: Padding(
//         padding: const EdgeInsets.all(30.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           // crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Center(
//                 child: Text("Forgot Password",
//                 style: TextStyle(
//             fontFamily: 'Open Sans',
//             fontSize: 14,
//             color: const Color.fromRGBO(149, 149, 149, 1)
//                 ),
//                 )
//             ),
//             TextField(
//               decoration: InputDecoration(
//                 labelText: "EMAIL",
//                 labelStyle: TextStyle(
//                     fontFamily: 'Open Sans',
//                     fontSize: 14,
//                     color: const Color.fromRGBO(149, 149, 149, 1)),
//                 focusedBorder: UnderlineInputBorder(
//                   borderSide:
//                       BorderSide(color: const Color.fromRGBO(196, 196, 196, 1)),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.05,
//             ),
//             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//               Container(
//                 child: ElevatedButton(
//                   child: Text(
//                     "Cancel",
//                     style: TextStyle(
//                       fontFamily: 'Open Sans',
//                       fontWeight: FontWeight.w700,
//                       fontSize: 16,
//                       color: const Color.fromRGBO(255, 255, 255, 1),
//                     ),
//                   ),
//                   style: ElevatedButton.styleFrom(
//                     primary: const Color.fromRGBO(134, 227, 220, 1),
//                   ),
//                   onPressed: ()=> _navigationService.popRepeated(1),
//                 ),
//               ),
//               Container(
//                 // width: 180,
//
//                 // height: 40,
//
//                 child: ElevatedButton(
//                   child: Text(
//                     "OK",
//                     style: TextStyle(
//                       fontFamily: 'Open Sans',
//                       fontWeight: FontWeight.w700,
//                       fontSize: 16,
//                       color: const Color.fromRGBO(255, 255, 255, 1),
//                     ),
//                   ),
//                   style: ElevatedButton.styleFrom(
//                     primary: const Color.fromRGBO(134, 227, 220, 1),
//                   ),
//                   onPressed: () {},
//                 ),
//               ),
//             ]),
//           ],
//         ),
//       ),
//     );
//   }
// }
