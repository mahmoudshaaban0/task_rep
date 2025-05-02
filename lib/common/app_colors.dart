import 'package:flutter/material.dart';

/// App color constants for consistent color scheme across the application
class AppColors {
  // Primary colors
  static const Color primary = Color(0xFF1A1A2E);
  static const Color primaryLight = Color(0xFF292941);
  static const Color primaryDark = Color(0xFF0F0F1A);

  // Accent colors
  static const Color accent = Color(0xFF4A80F0);
  static const Color accentLight = Color(0xFF6B9AF2);
  static const Color accentDark = Color(0xFF2A58D0);

  // Background colors
  static const Color background = Color(0xffF8F8F8);
  static const Color card = Colors.white;
  static const Color searchBackground = Color(0xFFF0F0F0);
  static const Color backgroundContainer = Color(0xFFF8F8F8);

  // Text colors
  static const Color textPrimary = Color(0xFF1F1F1F);
  static const Color textSecondary = Color(0xFF6C6C6C);
  static const Color textHint = Color(0xFF9E9E9E);
  static const Color textDisabled = Color(0xFFBDBDBD);
  static const Color textLight = Colors.white;

  // Status colors
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFFC107);
  static const Color error = Color(0xFFF44336);
  static const Color info = Color(0xFF2196F3);

  // Border colors
  static const Color border = Color(0xFFE0E0E0);
  static const Color divider = Color(0xffD6D6D6);

  // Specific colors for dashboard components
  static const Color sidebarBackground = Color(0xFF1A1A2E);
  static const Color sidebarButtonActive = Color(0xFF292941);
  static const Color sidebarButtonInactive = Colors.transparent;
  static const Color tabActive = Color(0xFF666666);
  static const Color tabInactive = Colors.transparent;
  static const Color tabTextActive = Colors.white;
  static const Color tabTextInactive = Color(0xFF6C6C6C);
  static const Color inputBorder = Color(0xFFE0E0E0);
  static const Color placeholder = Color(0xFFE5E5E5);

  // Avatar background colors
  static const List<Color> avatarColors = [
    Color(0xFF4A80F0), // Blue
    Color(0xFF4CAF50), // Green
    Color(0xFFF44336), // Red
    Color(0xFFFFC107), // Yellow
    Color(0xFF9C27B0), // Purple
    Color(0xFF795548), // Brown
  ];

  // Review stars
  static const Color starActive = Color(0xFFFFC107);
  static const Color starInactive = Color(0xFFE0E0E0);
}
