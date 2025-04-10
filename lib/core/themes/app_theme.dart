import 'package:boa_clone/core/themes/app_palette.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    final base = ThemeData.light(); // Start with default light theme

    return base.copyWith(
      scaffoldBackgroundColor: Palette.whiteColor,
      primaryColor: Palette.primaryColor,
      colorScheme: base.colorScheme.copyWith(
        primary: Palette.primaryColor,
        onSurface: Palette.whiteColor,
        secondary: Palette.greyColor,
        onPrimary: Palette.whiteColor,
      ),
      appBarTheme: base.appBarTheme.copyWith(
        backgroundColor: Palette.primaryColor,
        elevation: 0,
        titleTextStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Palette.blackColor,
        ),
        iconTheme: const IconThemeData(color: Palette.blackColor),
        actionsIconTheme: const IconThemeData(color: Palette.blackColor),
      ),
      textTheme: base.textTheme.apply(
        bodyColor: Palette.blackColor,
        displayColor: Palette.blackColor,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Palette.primaryColor,
          foregroundColor: Palette.whiteColor,
          textStyle: const TextStyle(fontWeight: FontWeight.w600),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: Palette.primaryColor,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Palette.primaryColor),
        ),
        hintStyle: const TextStyle(color: Palette.greyColor),
      ),
      listTileTheme: const ListTileThemeData(
        textColor: Palette.blackColor,        // Optional: for selected tiles
      ),

    );
  }
}
