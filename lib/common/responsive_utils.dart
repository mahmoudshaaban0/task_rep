import 'package:flutter/material.dart';

/// Responsive utilities to handle different screen sizes and orientations
class ResponsiveUtils {
  // Breakpoints
  static const double mobileBreakpoint = 480.0;
  static const double tabletBreakpoint = 768.0;
  static const double desktopBreakpoint = 1024.0;
  static const double largeDesktopBreakpoint = 1440.0;

  /// Check if the current screen size is mobile
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < tabletBreakpoint;
  }

  /// Check if the current screen size is tablet
  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= tabletBreakpoint && width < desktopBreakpoint;
  }

  /// Check if the current screen size is desktop
  static bool isDesktop(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= desktopBreakpoint;
  }

  /// Check if the current screen size is large desktop
  static bool isLargeDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= largeDesktopBreakpoint;
  }

  /// Check if the device is in landscape orientation
  static bool isLandscape(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.landscape;
  }

  /// Get responsive value based on screen size
  static T responsiveValue<T>({
    required BuildContext context,
    required T mobile,
    T? tablet,
    T? desktop,
    T? largeDesktop,
  }) {
    final width = MediaQuery.of(context).size.width;

    // Returns the appropriate value based on screen width
    if (width >= largeDesktopBreakpoint && largeDesktop != null) {
      return largeDesktop;
    } else if (width >= desktopBreakpoint && desktop != null) {
      return desktop;
    } else if (width >= tabletBreakpoint && tablet != null) {
      return tablet;
    } else {
      return mobile;
    }
  }

  /// Get screen width as percentage (0.0 to 1.0)
  static double screenWidthPercentage(BuildContext context, {double percentage = 1.0}) {
    return MediaQuery.of(context).size.width * percentage;
  }

  /// Get screen height as percentage (0.0 to 1.0)
  static double screenHeightPercentage(BuildContext context, {double percentage = 1.0}) {
    return MediaQuery.of(context).size.height * percentage;
  }

  /// Get responsive padding based on screen size
  static EdgeInsets responsivePadding(BuildContext context) {
    return responsiveValue<EdgeInsets>(
      context: context,
      mobile: const EdgeInsets.all(12.0),
      tablet: const EdgeInsets.all(16.0),
      desktop: const EdgeInsets.all(24.0),
      largeDesktop: const EdgeInsets.all(32.0),
    );
  }

  /// Get responsive horizontal padding based on screen size
  static EdgeInsets responsiveHorizontalPadding(BuildContext context) {
    return responsiveValue<EdgeInsets>(
      context: context,
      mobile: const EdgeInsets.symmetric(horizontal: 12.0),
      tablet: const EdgeInsets.symmetric(horizontal: 16.0),
      desktop: const EdgeInsets.symmetric(horizontal: 24.0),
      largeDesktop: const EdgeInsets.symmetric(horizontal: 32.0),
    );
  }

  /// Get responsive vertical padding based on screen size
  static EdgeInsets responsiveVerticalPadding(BuildContext context) {
    return responsiveValue<EdgeInsets>(
      context: context,
      mobile: const EdgeInsets.symmetric(vertical: 12.0),
      tablet: const EdgeInsets.symmetric(vertical: 16.0),
      desktop: const EdgeInsets.symmetric(vertical: 24.0),
      largeDesktop: const EdgeInsets.symmetric(vertical: 32.0),
    );
  }

  /// Get responsive font size based on screen size
  static double responsiveFontSize(BuildContext context, double size) {
    final width = MediaQuery.of(context).size.width;

    if (width >= largeDesktopBreakpoint) {
      return size * 1.25;
    } else if (width >= desktopBreakpoint) {
      return size * 1.1;
    } else if (width >= tabletBreakpoint) {
      return size;
    } else {
      return size * 0.9;
    }
  }
}
