import 'package:flutter/material.dart';
import '../common/responsive_utils.dart';

/// A responsive layout widget that provides different layouts based on screen size
class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const ResponsiveLayout({
    super.key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    // Return different layouts based on screen size
    if (ResponsiveUtils.isDesktop(context)) {
      return desktop;
    } else if (ResponsiveUtils.isTablet(context)) {
      // Use tablet layout if provided, otherwise fall back to mobile
      return tablet ?? mobile;
    } else {
      return mobile;
    }
  }

  // Helper static methods to check the current layout
  static bool isMobile(BuildContext context) => ResponsiveUtils.isMobile(context);
  static bool isTablet(BuildContext context) => ResponsiveUtils.isTablet(context);
  static bool isDesktop(BuildContext context) => ResponsiveUtils.isDesktop(context);
}
