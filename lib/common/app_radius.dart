import 'package:flutter/material.dart';

/// App radius constants for consistent UI elements across the application
class AppRadius {
  // Border radius constants
  static const BorderRadius none = BorderRadius.zero;
  static const BorderRadius extraSmall = BorderRadius.all(Radius.circular(2.0));
  static const BorderRadius small = BorderRadius.all(Radius.circular(4.0));
  static const BorderRadius medium = BorderRadius.all(Radius.circular(8.0));
  static const BorderRadius large = BorderRadius.all(Radius.circular(12.0));
  static const BorderRadius extraLarge = BorderRadius.all(Radius.circular(16.0));
  static const BorderRadius circular = BorderRadius.all(Radius.circular(100.0));

  // Specific border radius constants for dashboard components
  static const BorderRadius card = BorderRadius.all(Radius.circular(10.0));
  static const BorderRadius searchBox = BorderRadius.all(Radius.circular(8.0));
  static const BorderRadius button = BorderRadius.all(Radius.circular(6.0));
  static const BorderRadius tabBar = BorderRadius.all(Radius.circular(8.0));
  static const BorderRadius avatar = BorderRadius.all(Radius.circular(100.0));
  static const BorderRadius sidebar = BorderRadius.only(
    topRight: Radius.circular(15.0),
    bottomRight: Radius.circular(15.0),
  );

  // Convenience methods for directional borders
  static BorderRadius onlyTop(double radius) {
    return BorderRadius.only(
      topLeft: Radius.circular(radius),
      topRight: Radius.circular(radius),
    );
  }

  static BorderRadius onlyBottom(double radius) {
    return BorderRadius.only(
      bottomLeft: Radius.circular(radius),
      bottomRight: Radius.circular(radius),
    );
  }

  static BorderRadius onlyLeft(double radius) {
    return BorderRadius.only(
      topLeft: Radius.circular(radius),
      bottomLeft: Radius.circular(radius),
    );
  }

  static BorderRadius onlyRight(double radius) {
    return BorderRadius.only(
      topRight: Radius.circular(radius),
      bottomRight: Radius.circular(radius),
    );
  }
}
