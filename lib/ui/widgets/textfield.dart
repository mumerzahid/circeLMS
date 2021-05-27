import 'dart:ui';
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
          right: MediaQuery.of(context).size.width * 0.1),
      child: Column(children: [
        Theme(
          data: new ThemeData(
            primaryColor: Colors.grey,
            primaryColorDark: Colors.blue,
          ),
          child: Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.grey,width: 0.5)),
            child: TextFormField(
              enabled: true,
              // focusNode: myFocusNode
              controller: controller,
              cursorColor: Colors.black,
              obscureText: obscureText,
              keyboardType: inputType,
              textAlignVertical: TextAlignVertical.center,
              // enabled: true,
              decoration: InputDecoration(
                fillColor: Colors.white,
                // enabledBorder: OutlineInputBorder(
                //     borderSide: BorderSide(color: Colors.grey)),
                errorText: errorText,
                suffixIcon: InkWell(
                  onTap: () {
                    callFunction(!obscureText);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Icon(
                      suffixIcon != null
                          ? obscureText
                              ? Icons.visibility
                              : Icons.visibility_off
                          : null,
                      color: const Color.fromRGBO(146, 204, 180, 1),
                    ),
                  ),
                ),
                hintText: hintText,
                hintStyle: TextStyle(
                    color: const Color.fromRGBO(107, 126, 130, 1), fontSize: 14),
                // validator: (val) => val.length < 6 ? 'Password too short.' : null,
                // onSaved: (val) => _password = val,
              ),
            ),
          ),
        ),
      ]),
    ));
  }
}
