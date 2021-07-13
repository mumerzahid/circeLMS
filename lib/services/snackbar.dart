import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import '../app/locator.dart';

enum SnackbarType { universal, white }

void MySnackBar() {
  final service = locator<SnackbarService>();
  service.registerCustomSnackbarConfig(
    variant: SnackbarType.universal,
    config: SnackbarConfig(
      titleTextAlign: TextAlign.center,
      messageTextAlign: TextAlign.center,
      backgroundColor: Color.fromRGBO(134, 227, 220, 1),
      textColor: Colors.white,
      borderRadius: 1,
    ),
  );

  service.registerCustomSnackbarConfig(
    variant: SnackbarType.white,
    config: SnackbarConfig(
      titleTextAlign: TextAlign.center,
      messageTextAlign: TextAlign.center,
      backgroundColor: Color.fromRGBO(246, 246, 246, 1),
      titleColor: Color.fromRGBO(149, 149, 149, 1),
      messageColor: Color.fromRGBO(149, 149, 149, 1),
      borderRadius: 1,
    ),
  );
  // final SnackbarService service = locator<SnackbarService>();
  // // Registers a config to be used when calling showSnackbar
  // service.registerSnackbarConfig(SnackbarConfig(
  //   backgroundColor: Colors.green,
  //   //
  //   textColor: Color.fromRGBO(149, 149, 149, 1),
  //   mainButtonTextColor: Color.fromRGBO(149, 149, 149, 1),
  // )
  // );
}