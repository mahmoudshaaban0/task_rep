import 'package:flutter/material.dart';

/// App spacing constants for consistent whitespace across the application
class AppSpacing {
  // Padding and margin values
  static const double none = 0.0;
  static const double xxxSmall = 2.0;
  static const double xxSmall = 4.0;
  static const double xSmall = 8.0;
  static const double small = 12.0;
  static const double medium = 16.0;
  static const double large = 24.0;
  static const double xLarge = 32.0;
  static const double xxLarge = 48.0;
  static const double xxxLarge = 64.0;

  // Common paddings as EdgeInsets
  static const EdgeInsets paddingNone = EdgeInsets.zero;
  static const EdgeInsets paddingXxxs = EdgeInsets.all(xxxSmall);
  static const EdgeInsets paddingXxs = EdgeInsets.all(xxSmall);
  static const EdgeInsets paddingXs = EdgeInsets.all(xSmall);
  static const EdgeInsets paddingS = EdgeInsets.all(small);
  static const EdgeInsets paddingM = EdgeInsets.all(medium);
  static const EdgeInsets paddingL = EdgeInsets.all(large);
  static const EdgeInsets paddingXl = EdgeInsets.all(xLarge);
  static const EdgeInsets paddingXxl = EdgeInsets.all(xxLarge);
  static const EdgeInsets paddingXxxl = EdgeInsets.all(xxxLarge);

  // Directional paddings
  static const EdgeInsets paddingHorizontalXs = EdgeInsets.symmetric(horizontal: xSmall);
  static const EdgeInsets paddingHorizontalS = EdgeInsets.symmetric(horizontal: small);
  static const EdgeInsets paddingHorizontalM = EdgeInsets.symmetric(horizontal: medium);
  static const EdgeInsets paddingHorizontalL = EdgeInsets.symmetric(horizontal: large);

  static const EdgeInsets paddingVerticalXs = EdgeInsets.symmetric(vertical: xSmall);
  static const EdgeInsets paddingVerticalS = EdgeInsets.symmetric(vertical: small);
  static const EdgeInsets paddingVerticalM = EdgeInsets.symmetric(vertical: medium);
  static const EdgeInsets paddingVerticalL = EdgeInsets.symmetric(vertical: large);

  // Specific paddings for dashboard components
  static const EdgeInsets cardPadding = EdgeInsets.all(medium);
  static const EdgeInsets searchBoxPadding = EdgeInsets.symmetric(horizontal: small, vertical: xSmall);
  static const EdgeInsets listItemPadding = EdgeInsets.symmetric(horizontal: medium, vertical: small);
  static const EdgeInsets tabBarPadding = EdgeInsets.symmetric(horizontal: xSmall, vertical: xxSmall);
  static const EdgeInsets sidebarPadding = EdgeInsets.symmetric(horizontal: medium, vertical: large);
  static const EdgeInsets sidebarButtonPadding = EdgeInsets.symmetric(horizontal: small, vertical: xSmall);

  // SizedBox helpers for spacing
  static SizedBox get horizontalSpaceXxxs => const SizedBox(width: xxxSmall);
  static SizedBox get horizontalSpaceXxs => const SizedBox(width: xxSmall);
  static SizedBox get horizontalSpaceXs => const SizedBox(width: xSmall);
  static SizedBox get horizontalSpaceS => const SizedBox(width: small);
  static SizedBox get horizontalSpaceM => const SizedBox(width: medium);
  static SizedBox get horizontalSpaceL => const SizedBox(width: large);
  static SizedBox get horizontalSpaceXl => const SizedBox(width: xLarge);

  static SizedBox get verticalSpaceXxxs => const SizedBox(height: xxxSmall);
  static SizedBox get verticalSpaceXxs => const SizedBox(height: xxSmall);
  static SizedBox get verticalSpaceXs => const SizedBox(height: xSmall);
  static SizedBox get verticalSpaceS => const SizedBox(height: small);
  static SizedBox get verticalSpaceM => const SizedBox(height: medium);
  static SizedBox get verticalSpaceL => const SizedBox(height: large);
  static SizedBox get verticalSpaceXl => const SizedBox(height: xLarge);

  // Custom spacing
  static SizedBox horizontalSpace(double width) => SizedBox(width: width);
  static SizedBox verticalSpace(double height) => SizedBox(height: height);
}
