import 'package:flutter/material.dart';

/// App shadow constants for consistent elevation across the application
class AppShadows {
  // Predefined shadow levels
  static const List<BoxShadow> none = [];

  static const List<BoxShadow> small = [
    BoxShadow(
      color: Color(0x0D000000),
      blurRadius: 4.0,
      offset: Offset(0.0, 1.0),
    ),
  ];

  static const List<BoxShadow> medium = [
    BoxShadow(
      color: Color(0x1A000000),
      blurRadius: 8.0,
      offset: Offset(0.0, 2.0),
    ),
  ];

  static const List<BoxShadow> large = [
    BoxShadow(
      color: Color(0x26000000),
      blurRadius: 12.0,
      offset: Offset(0.0, 4.0),
    ),
  ];

  // Dashboard component specific shadows
  static const List<BoxShadow> card = [
    BoxShadow(
      color: Color(0x0F000000),
      blurRadius: 8.0,
      offset: Offset(0.0, 2.0),
    ),
  ];

  static const List<BoxShadow> button = [
    BoxShadow(
      color: Color(0x1A000000),
      blurRadius: 4.0,
      offset: Offset(0.0, 1.0),
    ),
  ];

  static const List<BoxShadow> navbar = [
    BoxShadow(
      color: Color(0x1A000000),
      blurRadius: 8.0,
      offset: Offset(0.0, 2.0),
    ),
  ];

  static const List<BoxShadow> sidebar = [
    BoxShadow(
      color: Color(0x1A000000),
      blurRadius: 10.0,
      offset: Offset(2.0, 0.0),
    ),
  ];

  static const List<BoxShadow> floatingActionButton = [
    BoxShadow(
      color: Color(0x33000000),
      blurRadius: 8.0,
      offset: Offset(0.0, 2.0),
    ),
  ];

  static const List<BoxShadow> modal = [
    BoxShadow(
      color: Color(0x26000000),
      blurRadius: 16.0,
      offset: Offset(0.0, 6.0),
    ),
  ];

  // Colored shadows
  static List<BoxShadow> coloredShadow(
    Color color, {
    double opacity = 0.1,
    double blurRadius = 8.0,
    Offset offset = const Offset(0.0, 2.0),
  }) {
    return [
      BoxShadow(
        color: color.withOpacity(opacity),
        blurRadius: blurRadius,
        offset: offset,
      ),
    ];
  }
}
