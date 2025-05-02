import 'package:flutter/material.dart';
import '../common/app_exports.dart';

class Sidebar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const Sidebar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ResponsiveUtils.responsiveValue(
        context: context,
        mobile: 60.0,
        tablet: 70.0,
        desktop: 80.0,
      ),
      color: AppColors.sidebarBackground,
      child: Column(
        children: [
          // Logo or app icon
          Container(
            height: 80.0,
            padding: AppSpacing.paddingM,
            child: const Center(
              child: Icon(
                Icons.restaurant_menu,
                color: Colors.white,
                size: 32.0,
              ),
            ),
          ),

          // Divider
          const Divider(
            color: Colors.white12,
            height: 1,
          ),

          // Sidebar menu items
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildSidebarItem(context, 0, Icons.dashboard, 'Dashboard'),
                _buildSidebarItem(context, 1, Icons.people, 'Guests'),
                _buildSidebarItem(context, 2, Icons.calendar_today, 'Reservations'),
                _buildSidebarItem(context, 3, Icons.table_bar, 'Tables'),
                _buildSidebarItem(context, 4, Icons.receipt_long, 'Orders'),
                _buildSidebarItem(context, 5, Icons.stacked_bar_chart, 'Reports'),
                _buildSidebarItem(context, 6, Icons.star_border, 'Reviews'),
              ],
            ),
          ),

          // Bottom section with settings
          Column(
            children: [
              const Divider(
                color: Colors.white12,
                height: 1,
              ),
              _buildSidebarItem(context, 7, Icons.settings, 'Settings'),
              _buildSidebarItem(context, 8, Icons.help_outline, 'Help'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSidebarItem(BuildContext context, int index, IconData icon, String label) {
    final isSelected = selectedIndex == index;

    return InkWell(
      onTap: () => onItemSelected(index),
      child: Container(
        padding: AppSpacing.sidebarButtonPadding,
        margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.sidebarButtonActive : AppColors.sidebarButtonInactive,
          borderRadius: AppRadius.button,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 24.0,
            ),
            if (ResponsiveUtils.isDesktop(context)) ...[
              AppSpacing.verticalSpaceXxxs,
              Text(
                label,
                style: AppTextStyles.sidebarButtonText,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
