import 'package:flutter/material.dart';

ThemeData get appTheme => ThemeData(
      primaryColor: const Color(0xFF252527),
      scaffoldBackgroundColor: const Color(0xFF252527),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: const Color(0xFF000000),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF252527),
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(),
        bodyMedium: TextStyle(),
        bodySmall: TextStyle(),
      ).apply(bodyColor: Colors.white),
    );
