import 'package:flutter/material.dart';

class AppTheme {
  static const primaryGreen = Color(0xFF0C4A3F);
  static const secondaryGold = Color(0xFFC5A059);
  static const accentLight = Color(0xFFE8F5E9);
  static const darkBackground = Color(0xFF121212);
  static const cardDark = Color(0xFF1E1E1E);

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryGreen,
      primary: primaryGreen,
      secondary: secondaryGold,
      surface: Colors.white,
    ),
    scaffoldBackgroundColor: accentLight,
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryGreen,
      foregroundColor: Colors.white,
      centerTitle: true,
      elevation: 0,
    ),
    cardTheme: const CardThemeData(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
      color: Colors.white,
    ),
    textTheme: const TextTheme(
      headlineMedium: TextStyle(fontFamily: 'Cairo', fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(fontFamily: 'Cairo'),
      bodyMedium: TextStyle(fontFamily: 'Cairo'),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryGreen,
      brightness: Brightness.dark,
      primary: primaryGreen,
      secondary: secondaryGold,
      surface: cardDark,
    ),
    scaffoldBackgroundColor: darkBackground,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      centerTitle: true,
      elevation: 0,
    ),
    cardTheme: const CardThemeData(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
      color: cardDark,
    ),
  );
}
