import 'package:flutter/material.dart';
import 'package:task/common/app_colors.dart';
import 'package:task/common/app_textstyles.dart';
import 'package:task/common/app_radius.dart';
import 'package:task/common/app_shadows.dart';

/// App theme for consistent UI across the application
class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.light(
        primary: AppColors.primary,
        onPrimary: Colors.white,
        secondary: AppColors.accent,
        onSecondary: Colors.white,
        error: AppColors.error,
        background: AppColors.background,
        surface: AppColors.card,
      ),
      scaffoldBackgroundColor: AppColors.background,
      cardColor: AppColors.card,
      dividerColor: AppColors.divider,

      // Text Theme
      textTheme: TextTheme(
        displayLarge: AppTextStyles.headerLarge,
        displayMedium: AppTextStyles.headerMedium,
        displaySmall: AppTextStyles.headerSmall,
        bodyLarge: AppTextStyles.bodyLarge,
        bodyMedium: AppTextStyles.bodyMedium,
        bodySmall: AppTextStyles.bodySmall,
        labelLarge: AppTextStyles.labelLarge,
        labelMedium: AppTextStyles.labelMedium,
        labelSmall: AppTextStyles.labelSmall,
      ),

      // Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.accent,
          foregroundColor: Colors.white,
          elevation: 0,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: AppRadius.button,
          ),
        ),
      ),

      // Card Theme
      cardTheme: CardTheme(
        color: AppColors.card,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.card,
        ),
      ),

      // AppBar Theme
      appBarTheme: AppBarTheme(
        color: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
      ),

      // Input Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.searchBackground,
        border: OutlineInputBorder(
          borderRadius: AppRadius.searchBox,
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppRadius.searchBox,
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppRadius.searchBox,
          borderSide: BorderSide(color: AppColors.accent, width: 1),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),

      // Tab Bar Theme
      tabBarTheme: TabBarTheme(
        labelColor: AppColors.tabActive,
        unselectedLabelColor: AppColors.tabInactive,
        indicator: BoxDecoration(
          color: AppColors.accent.withOpacity(0.1),
          borderRadius: AppRadius.tabBar,
        ),
      ),
    );
  }

  // Dark theme can be added here if needed
  static ThemeData get darkTheme {
    // Implementation of dark theme
    return lightTheme; // For now, using light theme
  }
}
