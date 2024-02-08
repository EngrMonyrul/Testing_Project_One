import 'package:flutter/material.dart';

class AppbarTheme {
  AppbarTheme._();

  /*---------------> Light appbar <--------------*/
  static const lightAppbarTheme = AppBarTheme(
    backgroundColor: Colors.deepOrange,
    iconTheme: IconThemeData(color: Colors.white),
  );

  /*---------------> Dark appbar <--------------*/
  static final darkAppbarTheme = AppBarTheme(
    backgroundColor: Colors.deepOrange.withOpacity(0.5),
    iconTheme: const IconThemeData(color: Colors.white),
  );
}
