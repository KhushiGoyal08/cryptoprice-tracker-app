import 'package:flutter/material.dart';

ThemeData lightTheme =ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),
);

// ignore: non_constant_identifier_names
ThemeData DarkTheme=ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color(0xff15101a),
  appBarTheme: const AppBarTheme(
     elevation:0,
     backgroundColor: Color(0xff15101a),
     ),
);