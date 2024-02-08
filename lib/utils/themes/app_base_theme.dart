import 'package:flutter/material.dart';
import 'package:testingprojectone/utils/themes/appbar_theme.dart';
import 'package:testingprojectone/utils/themes/color_scheme.dart';

class AppBaseTheme {
  AppBaseTheme._();

  /*------------------> Light app theme <-----------------*/
  static final lightAppTheme = ThemeData.light().copyWith(
    appBarTheme: AppbarTheme.lightAppbarTheme,
    colorScheme: AppsColorScheme.lightColorScheme,
    scaffoldBackgroundColor: Colors.transparent,
  );

  /*------------------> Dark app theme <-----------------*/
  static final darkAppTheme = ThemeData.dark().copyWith(
    appBarTheme: AppbarTheme.darkAppbarTheme,
    colorScheme: AppsColorScheme.darkColorScheme,
    scaffoldBackgroundColor: Colors.transparent,
  );
}
