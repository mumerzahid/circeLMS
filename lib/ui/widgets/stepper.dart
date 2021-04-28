//
// // import 'package:flutter/material.dart';
// //
// // class StepperDemo extends StatefulWidget {
// //   @override
// //   _StepperDemoState createState() => _StepperDemoState();
// // }
// //
// // class _StepperDemoState extends State<StepperDemo> {
// //   int _currentStep = 0;
// //   StepperType stepperType = StepperType.vertical;
// //
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return  Scaffold(
// //       appBar: AppBar(
// //         automaticallyImplyLeading: false,
// //         title: Text('Flutter Stepper Demo'),
// //         centerTitle: true,
// //       ),
// //       body:  Container(
// //         child: Row(
// //           children: [
// //             Expanded(
// //               child: Stepper(
// //                 type: StepperType.horizontal,
// //                 physics: ScrollPhysics(),
// //                 currentStep: _currentStep,
// //                 onStepTapped: (step) => tapped(step),
// //                 onStepContinue:  continued,
// //                 onStepCancel: cancel,
// //                 steps: <Step>[
// //                   Step(
// //                     title: new Text('First'),
// //                     content: Column(
// //                       children: <Widget>[
// //                         TextFormField(
// //                           decoration: InputDecoration(labelText: 'Email Address'),
// //                         ),
// //                         TextFormField(
// //                           decoration: InputDecoration(labelText: 'Password'),
// //                         ),
// //                       ],
// //                     ),
// //                     isActive: _currentStep >= 0,
// //                     state: _currentStep >= 0 ?
// //                     StepState.complete : StepState.disabled,
// //                   ),
// //                   Step(
// //                     title: new Text('Address'),
// //                     content: Column(
// //                       children: <Widget>[
// //                         TextFormField(
// //                           decoration: InputDecoration(labelText: 'Home Address'),
// //                         ),
// //                         TextFormField(
// //                           decoration: InputDecoration(labelText: 'Postcode'),
// //                         ),
// //                       ],
// //                     ),
// //                     isActive: _currentStep >= 0,
// //                     state: _currentStep >= 1 ?
// //                     StepState.complete : StepState.disabled,
// //                   ),
// //                   Step(
// //                     title: new Text('Mobile Number'),
// //                     content: Column(
// //                       children: <Widget>[
// //                         TextFormField(
// //                           decoration: InputDecoration(labelText: 'Mobile Number'),
// //                         ),
// //                       ],
// //                     ),
// //                     isActive:_currentStep >= 0,
// //                     state: _currentStep >= 2 ?
// //                     StepState.complete : StepState.disabled,
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         child: Icon(Icons.list),
// //         onPressed: switchStepsType,
// //       ),
// //
// //     );
// //   }
// //   switchStepsType() {
// //     setState(() => stepperType == StepperType.vertical
// //         ? stepperType = StepperType.horizontal
// //         : stepperType = StepperType.vertical);
// //   }
// //
// //   tapped(int step){
// //     setState(() => _currentStep = step);
// //   }
// //
// //   continued(){
// //     _currentStep < 2 ?
// //     setState(() => _currentStep += 1): null;
// //   }
// //   cancel(){
// //     _currentStep > 0 ?
// //     setState(() => _currentStep -= 1) : null;
// //   }
// // // }
// // import 'dart:ui';
// // import 'package:flutter/material.dart';
// // import 'package:im_stepper/main.dart';
// //
// // class MyHomePage extends StatefulWidget {
// //   MyHomePage({Key key, this.title}) : super(key: key);
// //
// //   final String title;
// //
// //   @override
// //   _MyHomePageState createState() => _MyHomePageState();
// // }
// //
// // class _MyHomePageState extends State<MyHomePage> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Padding(
// //           padding: const EdgeInsets.only(
// //             left: 16,
// //             right: 16,
// //           ),
// //           child:
// //           // Container(
// //           //   margin: EdgeInsets.only(top: 10),
// //           //   constraints: BoxConstraints.expand(height: 200),
// //           //   color: Colors.blue,
// //           //   child: Stepper(
// //           //     type: StepperType.horizontal,
// //           //     steps: [
// //           //       Step(
// //           //         title: Text("First"),
// //           //         content: Text("This is our first example."),
// //           //       ),
// //           //       Step(
// //           //         title: Text("Second"),
// //           //         content: Text("This is our second example."),
// //           //       ),
// //           //     ],
// //           //   ),
// //           // )
// //         HorizontalStepper(
// //             steps: [
// //               HorizontalStep(
// //                 title: "Step 1",
// //                 widget: Center(
// //                   child: Text("Step 1"),
// //                 ),
// //                 state: HorizontalStepState.SELECTED,
// //                 isValid: true,
// //               ),
// //               HorizontalStep(
// //                 title: "Step 2",
// //                 widget: Center(
// //                   child: Text("Step 2"),
// //                 ),
// //                 isValid: true,
// //               ),
// //               HorizontalStep(
// //                 title: "Step 3",
// //                 widget: Center(
// //                   child: Text("Step 3"),
// //                 ),
// //                 isValid: true,
// //               ),
// //               HorizontalStep(
// //                 title: "Step 4",
// //                 widget: Center(
// //                   child: Text("Step 4"),
// //                 ),
// //                 isValid: true,
// //               )
// //             ],
// //             selectedColor: const Color(0xFF4FE2C0),
// //             unSelectedColor: Colors.grey.shade400,
// //             leftBtnColor: const Color(0xffEA7F8B),
// //             rightBtnColor: const Color(0xFF4FE2C0),
// //             selectedOuterCircleColor: const Color(0xFF40A8F4),
// //             type: Type.TOP,
// //             circleRadius: 30,
// //             onComplete: () {
// //               print("completed");
// //             },
// //             textStyle: TextStyle(
// //               fontSize: 14,
// //               fontWeight: FontWeight.bold,
// //               decoration: null,
// //             )),
// //       ),
// //     );
// //   }
// // }
//
//
// import 'package:crice_hospital_app/ui/shared/style_size.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class TriangleClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     final path = Path();
//
//     path.lineTo(size.width, size.height/2);
//     path.lineTo(0.0, size.height/2);
//     // path.lineTo(size.width / 2, size.height/2);
//
//     path.close();
//     return path;
//   }
//
//   @override
//   bool shouldReclip(TriangleClipper oldClipper) => false;
// }
//
// class Clip extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:  ClipPath(
//         clipper: TriangleClipper(),
//         child: Container(
//           height: screenHeight(context) * 0.5,
//           color: Colors.grey,
//         ),
//       ) ,
//     );
//   }
// }
// import 'dart:async';
// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
//
// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
// class _MyHomePageState extends State<MyHomePage> {
//   DateTime currentDate = DateTime.now();
//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime pickedDate = await showDatePicker(
//         context: context,
//         initialDate: currentDate,
//         firstDate: DateTime(2015),
//         lastDate: DateTime(2050));
//     if (pickedDate != null && pickedDate != currentDate)
//       setState(() {
//         currentDate = pickedDate;
//       });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("DatePicker"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             Text(currentDate.toString()),
//             RaisedButton(
//               onPressed: () => _selectDate(context),
//               child: Text(DateFormat.yMd().format(currentDate),),
//             ),
//             RaisedButton(
//               onPressed: () => _selectDate(context),
//               child: Text('Ending Date'),
//             ),
//
//           ],
//         ),
//       ),
//     );
//   }
// }

// class Button extends StatefulWidget {
//
//   ButtonState createState() => ButtonState();
//
// }
//
// class ButtonState extends State<Button> {
//
//   bool isEnabled = true ;
//
//   enableButton(){
//       isEnabled = true;
//   }
//
//   disableButton(){
//       isEnabled = false;
//   }

  // sampleFunction(){
  //
  //   print('Clicked');
  // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//
//               RaisedButton(
//                 onPressed: isEnabled ? ()=> sampleFunction() : null,
//                 color: Colors.pinkAccent,
//                 textColor: Colors.white,
//                 padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
//                 child: Text('Sample Button'),
//               ),
//
//               RaisedButton(
//                 onPressed: enableButton,
//                 color: Colors.green,
//                 textColor: Colors.white,
//                 padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
//                 child: Text('Click Here Enable Above Button'),
//               ),
//
//               RaisedButton(
//                 onPressed: disableButton,
//                 color: Colors.green,
//                 textColor: Colors.white,
//                 padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
//                 child: Text('Click Here Disable Above Button'),
//               ),
//
//             ],
//           ),
//         ));
//   }
// }

//
// leading: Container(
// height: 23,
// width: 19,
// padding: EdgeInsets.only(
// top: MediaQuery.of(context).size.height * 0.02,
// ),
// child: Icon(
// Icons.menu,
// color: const Color.fromRGBO(107, 126, 129, 1),
// )
// ),





// Card(
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(10), // if you need this
//       side: BorderSide(
//         color: Colors.grey.withOpacity(0.2),
//         width: 1,
//       ),
//     ),
//   // child: ListTile(
//   //   subtitle: Text("ookkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkaaaaaaaaaaaaaaaaaak"),
//   //   trailing: Text("okkkkkkkkkkkkkkkkkkkkkkk"),
//   //
//   // ),
//   // child: Row(
//   //   children: [
//   //   Container(
//   //       height: MediaQuery.of(context).size.height * 0.15,
//   //       color: Colors.green,
//   //       width: 5,
//   //         ),
//   //
//   //     Column(
//   //       children: [
//   //         Row(
//   //           children: [
//   //             Text("Umer")
//   //           ],
//   //         ),
//   //
//   //         Row(
//   //           children: [
//   //             Text("Umer")
//   //           ],
//   //         )
//   //       ],
//   //     )
//   //   ],
//   // ),
//   child: Wrap(
//     children: [
//       Container(
//       height: MediaQuery.of(context).size.height * 0.15,
//       decoration: BoxDecoration(
//           color: Colors.green,
//           // borderRadius: BorderRadius.circular(
//           // )
//
//       ),
//       width: 5,
//         ),
//     Padding(
//       padding: EdgeInsets.only(
//           top: 20),
//       child: Column(
//         // crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Wrap(
//             // mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Container(width:MediaQuery.of(context).size.width * .8,child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing eiiiiiiiiiiiiiiiiiilit,.")),
//               Text("ok while")
//
//             ],
//           ),
//           // Divider(color: Colors.grey, thickness: 3,),
//           // Text("Date:17-03-2021")
//         ],
//       ),
//     )
//     ],
//   )
//
//
// )
//
// AppBar(
// elevation: 0,
// backgroundColor: Colors.white,
// leading: Container(
// height: 23,
// width: 19,
// padding: EdgeInsets.only(
// top: MediaQuery.of(context).size.height * 0.02,
// ),
// child: Icon(
// Icons.menu,
// color: const Color.fromRGBO(107, 126, 129, 1),
// )
// ),
// actions: [
// Padding(
// padding: EdgeInsets.only(
// top: MediaQuery.of(context).size.height * 0.01,
// right: MediaQuery.of(context).size.width * 0.05
// ),
// child: Row(
// children: [
// Image.asset('assets/images/Group1883.png'),
// Padding(
// padding: EdgeInsets.symmetric(horizontal: 10),
// child: Image.asset('assets/images/Group1882.png'),
// ),
// Image.asset('assets/images/Group1881.png'),
// ],),
// )
//
// ],
// flexibleSpace: Center(
// child: SingleChildScrollView(
// child: Column(
// children:[
// Container(
// height: 1,
// color: const Color.fromRGBO(146, 204, 181, 1),
// ),
// Container(
// height: 44,
// child: Center(child: Text("VISITS" ,
// style: TextStyle( fontSize: 22 ,
// color: const Color.fromRGBO(107, 126, 130, 1),
// ),
// )
// ) ,
// ),
// Container(
// height: 1,
// color: const Color.fromRGBO(146, 204, 181, 1),
// ),
// ]
// ),
// ),
// ),
// bottom: PreferredSize(
// child: CustomButtonBar(),
// preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.25),
// ),
// ),

// appBar: CustomAppBar(height: MediaQuery.of(context).size.height * 0.32,
//   sName: 'DASHBOARD',
//   fCall: true,),


// child: ListView(
//   padding: EdgeInsets.zero,
//   children: <Widget>[
//     Container(
//       height: MediaQuery.of(context).size.height *0.18,
//       // color: Colors.grey,
//       child: DrawerHeader(
//         child: Align(
//             alignment:Alignment.center,
//             child: Text(
//               'Menu',
//               style: TextStyle(fontSize: 24),
//             )
//         ),
//         decoration: BoxDecoration(
//           color: const Color.fromRGBO(134, 227, 220, 12),
//         ),
//       ),
//     ),
//     Align(
//       alignment: Alignment.center,
//       child: ListTile(
//         title: Text("Settings"),
//         onTap: () {
//           SettingsViewModel().navigation();
//         },
//       ),
//     ),
//     Divider(
//         color: const Color.fromRGBO(146, 204, 180, 1)
//     ),
//     ListTile(
//       title: Text("Log Out"),
//       onTap: () {
//         Navigator.pop(context);
//       },
//     ),
//     Divider(
//         color: const Color.fromRGBO(146, 204, 180, 1)
//     ),
//     ListTile(
//       title: Text("Log In"),
//       onTap: () {
//         LoginViewModel().navigation();
//       },
//     ),
//
//   ],
// ),