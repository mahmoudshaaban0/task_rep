import 'package:flutter/material.dart';
import '../common/app_exports.dart';
import '../models/guest_model.dart';
import '../data/mock_data.dart';

class GuestDetail extends StatefulWidget {
  final Guest guest;
  final VoidCallback? onTap;
  final bool showBackButton;
  final VoidCallback? onBackPressed;

  const GuestDetail({
    super.key,
    required this.guest,
    this.onTap,
    this.showBackButton = false,
    this.onBackPressed,
  });

  @override
  State<GuestDetail> createState() => _GuestDetailState();
}

class _GuestDetailState extends State<GuestDetail> {
  int _selectedTabIndex = 0;
  final _tabs = ['Profile', 'Reservation', 'Payment', 'Feedback', 'Order History'];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: AppShadows.small,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with guest book title and description
            Container(
              padding: AppSpacing.paddingM,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Show back button if required
                      if (widget.showBackButton) ...[
                        IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: widget.onBackPressed,
                        ),
                        const Spacer(),
                      ],
                      Icon(
                        Icons.book_outlined,
                        size: 28,
                        color: AppColors.textSecondary,
                      ),
                      AppSpacing.horizontalSpaceS,
                      Text(
                        'Guest Book',
                        style: TextStyle(
                          fontSize: ResponsiveUtils.responsiveFontSize(context, 18.0),
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      if (widget.showBackButton) const Spacer() else const SizedBox(),
                    ],
                  ),
                  AppSpacing.verticalSpaceS,
                  Text(
                    'The guest book feature remembers your guests\' dietary needs, allergies, and favorite dishes. It organizes dining preferences for a customized and memorable experience, ensuring each visit is tailored to their individual needs.',
                    style: TextStyle(
                      fontSize: ResponsiveUtils.responsiveFontSize(context, 12.0),
                      fontWeight: FontWeight.normal,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            // Tab bar with ScrollConfiguration to fix overflow
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                      decoration:
                          BoxDecoration(color: Colors.white, borderRadius: AppRadius.medium, boxShadow: AppShadows.medium),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(
                          _tabs.length,
                          (index) => _buildTabButton(index, _tabs[index]),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Divider after tab bar
            const Divider(height: 1, color: Color(0xFFEEEEEE)),

            // Guest profile section
            Expanded(
              child: _selectedTabIndex == 0
                  ? _buildProfileTab()
                  : Center(
                      child: Text(
                        '${_tabs[_selectedTabIndex]} content here',
                        style: TextStyle(
                          fontSize: ResponsiveUtils.responsiveFontSize(context, 14.0),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabButton(int index, String title) {
    final isSelected = _selectedTabIndex == index;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4), // Reduced padding
      child: InkWell(
        onTap: () {
          setState(() {
            _selectedTabIndex = index;
          });
        },
        child: Container(
          height: 35,
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.medium), // Reduced padding
          alignment: Alignment.center,

          decoration: BoxDecoration(
            borderRadius: AppRadius.extraLarge,
            color: isSelected ? const Color(0xFF666666) : Colors.transparent,
          ),
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.white : AppColors.tabTextInactive,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              fontSize: ResponsiveUtils.responsiveFontSize(context, 14.0),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileTab() {
    Color avatarColor = AppColors.avatarColors[int.parse(widget.guest.id) % AppColors.avatarColors.length];

    return SingleChildScrollView(
      padding: AppSpacing.paddingM,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Guest profile header
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 32,
                backgroundColor: avatarColor,
                child: Text(
                  widget.guest.avatarInitials ?? '',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: ResponsiveUtils.responsiveFontSize(context, 18.0),
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
                      widget.guest.fullName,
                      style: TextStyle(
                        fontSize: ResponsiveUtils.responsiveFontSize(context, 18.0),
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    AppSpacing.verticalSpaceXxxs,
                    Text(
                      widget.guest.email,
                      style: TextStyle(
                        fontSize: ResponsiveUtils.responsiveFontSize(context, 14.0),
                        fontWeight: FontWeight.normal,
                        color: Colors.black87,
                      ),
                    ),
                    AppSpacing.verticalSpaceXxxs,
                    Text(
                      widget.guest.phoneNumber,
                      style: TextStyle(
                        fontSize: ResponsiveUtils.responsiveFontSize(context, 14.0),
                        fontWeight: FontWeight.normal,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          AppSpacing.verticalSpaceM,

          // Statistics row
          _buildStatsRow(),

          AppSpacing.verticalSpaceM,

          // Loyalty section
          _buildSectionHeader('LOYALTY'),
          AppSpacing.verticalSpaceS,
          _buildLoyaltySection(),

          AppSpacing.verticalSpaceM,

          // Allergies section
          _buildSectionHeader('ALLERGIES'),
          AppSpacing.verticalSpaceS,
          _buildAllergySection(),

          AppSpacing.verticalSpaceM,

          // Upcoming visits section
          _buildSectionHeader('UPCOMING VISITS'),
          AppSpacing.verticalSpaceS,
          _buildUpcomingVisitsSection(),

          AppSpacing.verticalSpaceM,

          // Notes section
          _buildSectionHeader('NOTES'),
          AppSpacing.verticalSpaceS,
          _buildNotesSection(),

          AppSpacing.verticalSpaceM,

          // Recent orders section
          _buildSectionHeader('RECENT ORDERS'),
          AppSpacing.verticalSpaceS,
          _buildRecentOrdersSection(),

          AppSpacing.verticalSpaceM,

          // Online reviews section
          _buildSectionHeader('ONLINE REVIEWS'),
          AppSpacing.verticalSpaceS,
          _buildOnlineReviewsSection(),
        ],
      ),
    );
  }

  Widget _buildStatsRow() {
    return Row(
      children: [
        _buildStatItem('Last Visit', widget.guest.lastVisit ?? '--/--'),
        _buildStatItem('Average Spend', '\$${widget.guest.averageSpend?.toStringAsFixed(2) ?? '0.00'}'),
        _buildStatItem('Lifetime Spend', '\$${widget.guest.averageSpend?.toStringAsFixed(2) ?? '0.00'}'),
        _buildStatItem('Total Orders', '${widget.guest.totalOrders ?? 0}'),
        _buildStatItem('Average Tip', '\$${widget.guest.averageTip?.toStringAsFixed(2) ?? '0.00'}'),
      ],
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: ResponsiveUtils.responsiveFontSize(context, 16.0),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          AppSpacing.verticalSpaceXxxs,
          Text(
            label,
            style: TextStyle(
              fontSize: ResponsiveUtils.responsiveFontSize(context, 12.0),
              fontWeight: FontWeight.normal,
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: ResponsiveUtils.responsiveFontSize(context, 12.0),
            fontWeight: FontWeight.w600,
          ),
        ),
        const Spacer(),
        // If we have a specific icon for this section, add it here
        if (title == 'LOYALTY') Icon(Icons.redeem, size: 14, color: AppColors.textSecondary),
      ],
    );
  }

  Widget _buildLoyaltySection() {
    return Container(
      padding: AppSpacing.paddingS,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.border),
        borderRadius: AppRadius.small,
      ),
      child: Column(
        children: [
          // First row: Points earned, redeemed, total visits
          Row(
            children: [
              _buildLoyaltyItem('0', 'Earned'),
              _buildLoyaltyItem('0', 'Redeemed'),
              _buildLoyaltyItem('0', 'Total Visits'),
              _buildLoyaltyItem('0', 'Upcoming'),
            ],
          ),
          AppSpacing.verticalSpaceM,
          // Second row: Points available, amount, cancelled, no shows
          Row(
            children: [
              _buildLoyaltyItem('0', 'Available'),
              _buildLoyaltyItem('\$ 00.00', 'Amount'),
              _buildLoyaltyItem('0', 'Canceled'),
              _buildLoyaltyItem('0', 'No Shows'),
            ],
          ),
          AppSpacing.verticalSpaceM,
          // Third row: Special fields
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('Since', style: AppTextStyles.labelMedium),
                        const Spacer(),
                        Text('Enter', style: TextStyle(color: Colors.grey, fontSize: 12)),
                      ],
                    ),
                  ],
                ),
              ),
              AppSpacing.horizontalSpaceM,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('Birthday', style: AppTextStyles.labelMedium),
                        AppSpacing.horizontalSpaceXxxs,
                        Icon(Icons.cake, size: 12, color: AppColors.textSecondary),
                        const Spacer(),
                        Text('Enter', style: TextStyle(color: Colors.grey, fontSize: 12)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          AppSpacing.verticalSpaceM,
          // Fourth row: Anniversary
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('Anniversary', style: AppTextStyles.labelMedium),
                        AppSpacing.horizontalSpaceXxxs,
                        Icon(Icons.favorite, size: 12, color: AppColors.textSecondary),
                        const Spacer(),
                        Text('Enter', style: TextStyle(color: Colors.grey, fontSize: 12)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLoyaltyItem(String value, String label) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          AppSpacing.verticalSpaceXxxs,
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildAllergySection() {
    return Container(
      padding: AppSpacing.paddingS,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.border),
        borderRadius: AppRadius.small,
      ),
      child: Row(
        children: [
          Icon(
            Icons.restaurant_menu,
            color: AppColors.textSecondary,
          ),
          AppSpacing.horizontalSpaceM,
          Text(
            'No Allergies',
            style: AppTextStyles.bodyMedium,
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              // Add allergy action
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: AppRadius.large,
              ),
              child: Text(
                'Add',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUpcomingVisitsSection() {
    return Container(
      padding: AppSpacing.paddingS,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.border),
        borderRadius: AppRadius.small,
      ),
      child: Row(
        children: [
          Icon(
            Icons.calendar_today,
            color: AppColors.textSecondary,
          ),
          AppSpacing.horizontalSpaceM,
          Text(
            'No Upcoming Visits',
            style: AppTextStyles.bodyMedium,
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              // Book a visit action
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: AppRadius.large,
              ),
              child: Text(
                'Book A Visit',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildNoteItem('General', 'Add notes'),
        AppSpacing.verticalSpaceS,
        _buildNoteItem('Special Relation', 'Add notes'),
        AppSpacing.verticalSpaceS,
        _buildNoteItem('Seating Preferences', 'Add notes'),
        AppSpacing.verticalSpaceS,
        _buildNoteItem('Special Note*', 'Add notes'),
        AppSpacing.verticalSpaceS,
        _buildNoteItem('Allergies', 'Add notes'),
      ],
    );
  }

  Widget _buildNoteItem(String title, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              title == 'General'
                  ? Icons.note
                  : title == 'Special Relation'
                      ? Icons.star_border
                      : title == 'Seating Preferences'
                          ? Icons.chair
                          : title == 'Special Note*'
                              ? Icons.note_alt_outlined
                              : Icons.healing,
              size: 16,
              color: AppColors.textSecondary,
            ),
            AppSpacing.horizontalSpaceXs,
            Text(
              title,
              style: AppTextStyles.labelMedium.copyWith(fontWeight: FontWeight.w600),
            ),
            const Spacer(),
          ],
        ),
        AppSpacing.verticalSpaceXxxs,
        Text(
          hint,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 12,
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
  }

  Widget _buildRecentOrdersSection() {
    return Container(
      height: 96,
      padding: AppSpacing.paddingS,
      decoration: BoxDecoration(
        borderRadius: AppRadius.large,
      ),
      child: Row(
        children: [
          Icon(
            Icons.receipt_long,
            color: AppColors.textSecondary,
          ),
          VerticalDivider(
            color: Colors.grey.shade50,
            width: 3,
          ),
          AppSpacing.horizontalSpaceM,
          Text(
            'No Recent Orders to Show',
            style: AppTextStyles.bodyMedium,
          ),
        ],
      ),
    );
  }

  Widget _buildOnlineReviewsSection() {
    // Get mock reviews
    final reviews = MockData.getSampleReviews();

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.border),
        borderRadius: AppRadius.medium,
      ),
      child: Row(
        children: reviews.map((review) => _buildReviewItem(review)).toList(),
      ),
    );
  }

  Widget _buildReviewItem(Map<String, dynamic> review) {
    final platform = review['platform'] as String;
    final rating = review['rating'] as double;
    final comment = review['comment'] as String;

    return Expanded(
      child: Container(
        padding: AppSpacing.paddingM,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              color: AppColors.divider,
              width: 1,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Platform icon
            _getPlatformIcon(platform),
            AppSpacing.verticalSpaceS,
            // Star rating
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return Icon(
                  index < rating.floor()
                      ? Icons.star
                      : index == rating.floor() && rating % 1 > 0
                          ? Icons.star_half
                          : Icons.star_border,
                  color: AppColors.starActive,
                  size: ResponsiveUtils.responsiveFontSize(context, 18.0),
                );
              }),
            ),
            AppSpacing.verticalSpaceS,
            // Review text
            Text(
              comment,
              style: TextStyle(
                fontSize: ResponsiveUtils.responsiveFontSize(context, 12.0),
                fontWeight: FontWeight.normal,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _getPlatformIcon(String platform) {
    // Use appropriate icons or logos based on platform
    switch (platform) {
      case 'Google':
        return Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.g_mobiledata, color: Colors.red, size: 24),
        );
      case 'Yelp':
        return Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.star, color: Colors.red, size: 24),
        );
      case 'Foursquare':
        return Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.location_on, color: Colors.blue, size: 24),
        );
      default:
        return Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.star, color: Colors.amber, size: 24),
        );
    }
  }
}
