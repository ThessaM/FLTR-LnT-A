
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static Color primary = Color(0xFFB39DDB);
  static Color background = Color(0xFFF7F2FF);
  static Color accent = Color(0xFF7E57C2);
  static Color income = Color(0xFF81C784);
  static Color expense = Color(0xFFE57373);

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: background,
    primaryColor: primary,
    appBarTheme: AppBarTheme(
      backgroundColor: primary,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: accent,
    ),
    cardTheme: CardThemeData(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),
    ),
  );
}