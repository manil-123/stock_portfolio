import 'package:flutter/material.dart';

ThemeData get appTheme => ThemeData(
      primaryColor: Color(0xFF252527),
      scaffoldBackgroundColor: Color(0xFF252527),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: Color(0xFF000000),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Color(0xFF252527),
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(),
        bodyMedium: TextStyle(),
        bodySmall: TextStyle(),
      ).apply(bodyColor: Colors.white),
    );
