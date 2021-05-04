import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import '../app/locator.dart';

void MySnackBar() {
  final SnackbarService service = locator<SnackbarService>();
  // Registers a config to be used when calling showSnackbar
  service.registerSnackbarConfig(SnackbarConfig(
    backgroundColor: Color.fromRGBO(149, 149, 149, 1),
    textColor: Colors.black,
    mainButtonTextColor: Colors.black,
  ));
}