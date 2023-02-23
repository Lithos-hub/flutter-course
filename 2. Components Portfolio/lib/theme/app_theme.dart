import 'package:flutter/material.dart';

class AppTheme {
  static Color primary = Colors.pink;
  static Color secondary = Colors.indigo;
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    // Primary color
    primaryColor: primary,

    // App bar color
    appBarTheme: AppBarTheme(color: primary, elevation: 0),

    // TextButton theme
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: secondary)),

    // Floating action theme
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: primary, elevation: 5),

    // Elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.indigo,
          shape: const StadiumBorder(),
          elevation: 0),
    ),

    // Input theme
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelStyle: TextStyle(color: primary),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primary),
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(25), topRight: Radius.circular(25)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppTheme.primary),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
    ),
  );
  static final ThemeData darkTheme = ThemeData.dark().copyWith(
      // Primary color
      primaryColor: primary,

      // App bar color
      appBarTheme: AppBarTheme(color: primary, elevation: 0),
      scaffoldBackgroundColor: Colors.black);
}
