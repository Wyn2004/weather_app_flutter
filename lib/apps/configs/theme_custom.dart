import 'package:flutter/material.dart';

class ThemeCustom {
  static ThemeData themeLight = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      actionsIconTheme: IconThemeData(color: Colors.white),
      iconTheme: IconThemeData(color: Colors.white),
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
