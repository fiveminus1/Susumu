import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      primaryColor: AppColors.primary,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: AppColors.primary,
        secondary: AppColors.accent,
        surface: AppColors.background,
      ),
      scaffoldBackgroundColor: AppColors.background,
      textTheme: const TextTheme(
        bodySmall: TextStyle(color: AppColors.text),
        bodyMedium: TextStyle(color: AppColors.text),
        bodyLarge: TextStyle(color: AppColors.text),

        labelSmall: TextStyle(color: AppColors.highlight),
        labelMedium: TextStyle(color: AppColors.highlight),
        labelLarge: TextStyle(color: AppColors.highlight),

        headlineSmall: TextStyle(color: AppColors.primary),
        headlineMedium: TextStyle(color: AppColors.primary),
        headlineLarge: TextStyle(color: AppColors.primary),

        titleSmall: TextStyle(color: AppColors.highlight),
        titleMedium: TextStyle(color: AppColors.highlight),
        titleLarge: TextStyle(color: AppColors.highlight),
      ),
    );
  }
}

