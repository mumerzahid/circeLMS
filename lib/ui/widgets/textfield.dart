import 'dart:ui';
import 'package:crice_hospital_app/constants/constants_messages.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final IconData suffixIcon;
  final String hintText;
  final TextInputType inputType;
  final bool obscureText;
  final String errorText;
  final ValueChanged<bool> callFunction;
  TextFieldWidget(
    this.controller,
    this.hintText,
    this.inputType,
    this.obscureText,
    this.errorText,
    this.suffixIcon, {
    this.callFunction,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.1,
          right: MediaQuery.of(context).size.width * 0.1
      ),
      child: Column(children: [
        Theme(
          data: new ThemeData(
            primaryColor: Colors.grey,
            primaryColorDark: Colors.blue,
          ),
          child: Stack(
              alignment: Alignment.centerRight,
            children: [
              TextFormField(
                enabled: true,
                // focusNode: myFocusNode
                controller: controller,
                cursorColor: Colors.black,
                obscureText: obscureText,
                keyboardType: inputType,
                textAlignVertical: TextAlignVertical.center,
                // enabled: true,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromRGBO(112, 112, 112, 1)
                      )
                  ),
                  border: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Color.fromRGBO(177, 177, 177, 1), width: 0.5),
                  ),
                  fillColor: Colors.white,
                  // enabledBorder: OutlineInputBorder(
                  //     borderSide: BorderSide(color: Colors.grey)),
                  errorText: errorText,
                  suffixIcon: InkWell(
                    onTap: () {
                      callFunction(!obscureText);
                    },
                    child: Icon(
                      suffixIcon != null
                          ? obscureText
                          ? Icons.visibility_off
                          : Icons.visibility
                          : null,
                      color: const Color.fromRGBO(146, 204, 180, 1),
                    ),
                  ),
                  hintText: hintText,
                  hintStyle: TextStyle(
                      color:  Color.fromRGBO(108, 127, 131, 5),
                      fontSize: ConstantsMessages.fontLarge),
                  // validator: (val) => val.length < 6 ? 'Password too short.' : null,
                  // onSaved: (val) => _password = val,
                ),
              ),
              IconButton(
                onPressed: ()=>callFunction(!obscureText),
                icon: obscureText?Icon(
                  suffixIcon != null
                      ? Icons.visibility_off
                      : null,
                  color: Colors.grey,
                ):Icon(
                  suffixIcon != null
                      ? Icons.visibility
                      : null,
                  color: Color.fromRGBO(146, 204, 180, 1),
                ),
              ),
            ]
          ),
        ),
      ]),
    ));
  }
}
