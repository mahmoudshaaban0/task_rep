import 'package:flutter/material.dart';
import '../common/app_exports.dart';

class HeaderBar extends StatelessWidget {
  final String title;
  final String subtitle;
  final String clockedInTime;
  final VoidCallback? onMenuPressed;

  const HeaderBar({
    super.key,
    required this.title,
    required this.subtitle,
    required this.clockedInTime,
    this.onMenuPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      padding: AppSpacing.paddingHorizontalM,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: AppShadows.small,
      ),
      child: Row(
        children: [
          // Menu button (for mobile/tablet)
          if (!ResponsiveUtils.isDesktop(context)) ...[
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: onMenuPressed,
            ),
            AppSpacing.horizontalSpaceS,
          ],

          // User info
          Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: AppColors.primary,
                child: Text(
                  'JF',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: ResponsiveUtils.responsiveFontSize(context, 12.0),
                  ),
                ),
              ),
              AppSpacing.horizontalSpaceS,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: ResponsiveUtils.responsiveFontSize(context, 16.0),
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Clocked in at $clockedInTime',
                    style: TextStyle(
                      fontSize: ResponsiveUtils.responsiveFontSize(context, 12.0),
                      fontWeight: FontWeight.normal,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ],
          ),

          const Spacer(),

          // Current time
          Text(
            subtitle,
            style: TextStyle(
              fontSize: ResponsiveUtils.responsiveFontSize(context, 16.0),
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),

          AppSpacing.horizontalSpaceL,

          // Wifi icon
          Icon(
            Icons.wifi,
            color: AppColors.primary,
            size: ResponsiveUtils.responsiveValue(
              context: context,
              mobile: 18.0,
              tablet: 20.0,
              desktop: 24.0,
            ),
          ),

          AppSpacing.horizontalSpaceM,

          // Notifications
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: Icon(
                  Icons.notifications_outlined,
                  color: AppColors.primary,
                  size: ResponsiveUtils.responsiveValue(
                    context: context,
                    mobile: 20.0,
                    tablet: 22.0,
                    desktop: 24.0,
                  ),
                ),
                onPressed: () {},
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
