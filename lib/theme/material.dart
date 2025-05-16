import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      primarySwatch: Colors.green, 
      brightness: Brightness.light, 
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.green, 
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.green,
        textTheme: ButtonTextTheme.primary,
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.black),
        bodyMedium: TextStyle(color: Colors.black54),
        headlineLarge: TextStyle(color: Colors.green, fontSize: 24, fontWeight: FontWeight.bold),
      ),
      scaffoldBackgroundColor: Colors.white,
      cardColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.green), 
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      primarySwatch: Colors.green,
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF4CAF50),
        iconTheme: IconThemeData(color: Colors.white), 
        titleTextStyle: TextStyle(
          color: Colors.white, 
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: Color(0xFF4CAF50), 
        textTheme: ButtonTextTheme.primary, 
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.white),
        bodyMedium: TextStyle(color: Colors.white70),
        headlineLarge: TextStyle(color: Colors.green, fontSize: 24, fontWeight: FontWeight.bold), 
      ),
      scaffoldBackgroundColor: Colors.black, 
      cardColor: const Color(0xFF212121), 
      iconTheme: const IconThemeData(color: Colors.green),
    );
  }
}