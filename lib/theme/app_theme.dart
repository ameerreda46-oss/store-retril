import 'package:flutter/material.dart';

class AppColors {
  // Main palette from Figma design
  static const Color primary = Color(0xFFFF5E00);
  static const Color primaryDark = Color(0xFFE05200);
  static const Color textDark = Color(0xFF4A2810);
  static const Color textSecondary = Color(0xFF8D7B68);
  static const Color inputBackground = Color(0xFFF5F5F5);
  static const Color background = Colors.white;
  static const Color green = Color(0xFF2E7D32);
  static const Color greenLight = Color(0xFF4CAF50);
  static const Color red = Color(0xFFD32F2F);
  static const Color cardBg = Color(0xFFFAFAFA);
  static const Color border = Color(0xFFEFEFEF);

  // Category background colors matching screenshots
  static const Color categoryFruit = Color(0xFFF0E5CF);
  static const Color categoryVeg = Color(0xFFFFE0B2);
  static const Color categoryMeat = Color(0xFFFFCDD2);
  static const Color categoryFish = Color(0xFFF8BBD0);
  static const Color categorySea = Color(0xFFFFF9C4);
  static const Color categoryJuice = Color(0xFFC8E6C9);
  static const Color categoryMilk = Color(0xFFE0F7FA);
  static const Color categoryIce = Color(0xFFF8BBD0);
  static const Color categoryCake = Color(0xFFFFECB3);
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        primary: AppColors.primary,
        surface: AppColors.background,
      ),
      fontFamily: 'Roboto',
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.primary),
        titleTextStyle: TextStyle(
          color: AppColors.primary,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          elevation: 0,
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          minimumSize: const Size(double.infinity, 50),
          side: const BorderSide(color: AppColors.primary, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
