import 'package:flutter/material.dart';
import '../common/app_exports.dart';
import '../models/guest_model.dart';

class GuestList extends StatelessWidget {
  final List<Guest> guests;
  final Function(Guest) onGuestSelected;
  final Guest? selectedGuest;
  final TextEditingController searchController;
  final Function(String) onSearch;
  final VoidCallback onAddGuest;

  const GuestList({
    super.key,
    required this.guests,
    required this.onGuestSelected,
    this.selectedGuest,
    required this.searchController,
    required this.onSearch,
    required this.onAddGuest,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ResponsiveUtils.responsiveValue(
        context: context,
        mobile: ResponsiveUtils.screenWidthPercentage(context, percentage: 1.0),
        tablet: 320.0,
        desktop: 350.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: AppShadows.small,
      ),
      child: Column(
        children: [
          // Header with Settings title and search
          Padding(
            padding: AppSpacing.paddingM,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: ResponsiveUtils.responsiveFontSize(context, 18.0),
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                AppSpacing.verticalSpaceS,
                _buildSearchBox(context),
              ],
            ),
          ),

          // Divider
          const Divider(height: 1),

          // Add button and shortcuts
          Padding(
            padding: AppSpacing.paddingM,
            child: Row(
              children: [
                // Add button
                InkWell(
                  onTap: onAddGuest,
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.border),
                      borderRadius: AppRadius.small,
                    ),
                    child: Icon(Icons.add, color: AppColors.textSecondary),
                  ),
                ),
                AppSpacing.horizontalSpaceS,
                // Sort button
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.border),
                    borderRadius: AppRadius.small,
                  ),
                  child: Icon(Icons.sort, color: AppColors.textSecondary),
                ),
                AppSpacing.horizontalSpaceS,
                // Filter button
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.border),
                    borderRadius: AppRadius.small,
                  ),
                  child: Icon(Icons.filter_list, color: AppColors.textSecondary),
                ),
                const Spacer(),
                Text(
                  '${guests.length} guests',
                  style: TextStyle(
                    fontSize: ResponsiveUtils.responsiveFontSize(context, 12.0),
                    fontWeight: FontWeight.w500,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),

          // Guest list
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemCount: guests.length,
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final guest = guests[index];
                final isSelected = selectedGuest?.id == guest.id;

                return _buildGuestItem(context, guest, isSelected);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBox(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.searchBackground,
        borderRadius: AppRadius.searchBox,
      ),
      child: TextField(
        controller: searchController,
        onChanged: onSearch,
        style: TextStyle(
          fontSize: ResponsiveUtils.responsiveFontSize(context, 14.0),
        ),
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: TextStyle(
            fontSize: ResponsiveUtils.responsiveFontSize(context, 14.0),
            color: AppColors.textHint,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: AppColors.textHint,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 10),
        ),
      ),
    );
  }

  Widget _buildGuestItem(BuildContext context, Guest guest, bool isSelected) {
    Color avatarColor = Colors.grey;

    // Generate a color based on the guest's id
    if (guest.id.isNotEmpty) {
      final colorIndex = int.parse(guest.id) % AppColors.avatarColors.length;
      avatarColor = AppColors.avatarColors[colorIndex];
    }

    return InkWell(
      onTap: () => onGuestSelected(guest),
      child: Container(
        padding: AppSpacing.listItemPadding,
        color: isSelected ? AppColors.accent.withOpacity(0.1) : Colors.transparent,
        child: Row(
          children: [
            // Avatar or initials
            CircleAvatar(
              radius: 20,
              backgroundColor: avatarColor,
              child: Text(
                guest.avatarInitials ?? '',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: ResponsiveUtils.responsiveFontSize(context, 14.0),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            AppSpacing.horizontalSpaceM,

            // Guest info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    guest.fullName,
                    style: TextStyle(
                      fontSize: ResponsiveUtils.responsiveFontSize(context, 15.0),
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  AppSpacing.verticalSpaceXxxs,
                  Text(
                    guest.email,
                    style: TextStyle(
                      fontSize: ResponsiveUtils.responsiveFontSize(context, 13.0),
                      fontWeight: FontWeight.normal,
                      color: Colors.black54,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  AppSpacing.verticalSpaceXxxs,
                  Text(
                    guest.phoneNumber,
                    style: TextStyle(
                      fontSize: ResponsiveUtils.responsiveFontSize(context, 12.0),
                      fontWeight: FontWeight.normal,
                      color: Colors.black45,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
