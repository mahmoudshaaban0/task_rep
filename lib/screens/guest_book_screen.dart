import 'package:flutter/material.dart';
import '../common/app_exports.dart';
import '../data/mock_data.dart';
import '../models/guest_model.dart';
import '../widgets/guest_detail_fixed.dart';
import '../widgets/guest_list.dart';
import '../widgets/header_bar.dart';
import '../widgets/sidebar.dart';
import '../widgets/responsive_layout.dart';

class GuestBookScreen extends StatefulWidget {
  const GuestBookScreen({super.key});

  @override
  State<GuestBookScreen> createState() => _GuestBookScreenState();
}

class _GuestBookScreenState extends State<GuestBookScreen> {
  int _selectedSidebarIndex = 1; // Guest section is selected
  late List<Guest> _guests;
  Guest? _selectedGuest;
  final TextEditingController _searchController = TextEditingController();
  bool _isSidebarVisible = true;
  bool _isGuestDetailVisible = true;
  bool _isGuestListVisible = true; // New flag for guest list visibility

  @override
  void initState() {
    super.initState();
    _guests = MockData.getMockGuests();
    if (_guests.isNotEmpty) {
      _selectedGuest = _guests.first;
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearch(String query) {
    if (query.isEmpty) {
      setState(() {
        _guests = MockData.getMockGuests();
      });
      return;
    }

    final lowercaseQuery = query.toLowerCase();
    setState(() {
      _guests = MockData.getMockGuests().where((guest) {
        return guest.fullName.toLowerCase().contains(lowercaseQuery) ||
            guest.email.toLowerCase().contains(lowercaseQuery) ||
            guest.phoneNumber.contains(query);
      }).toList();
    });
  }

  void _toggleSidebar() {
    setState(() {
      _isSidebarVisible = !_isSidebarVisible;
    });
  }

  void _toggleGuestDetail() {
    setState(() {
      _isGuestDetailVisible = !_isGuestDetailVisible;
    });
  }

  // Method to hide guest list
  void _hideGuestList() {
    if (ResponsiveUtils.isMobile(context)) {
      return; // Don't hide on mobile as we already use a different layout
    }
    setState(() {
      _isGuestListVisible = false;
    });
  }

  // Method to show guest list
  void _showGuestList() {
    setState(() {
      _isGuestListVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get current time for header display
    final now = DateTime.now();
    final hour = now.hour.toString().padLeft(2, '0');
    final minute = now.minute.toString().padLeft(2, '0');
    final currentTime = '$hour : $minute AM';

    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            HeaderBar(
              title: 'Johnson Francisco',
              subtitle: currentTime,
              clockedInTime: '09 : 33 AM',
              onMenuPressed: _toggleSidebar,
            ),

            // Main content area
            Expanded(
              child: ResponsiveLayout(
                // Mobile layout - Stack with conditional visibility
                mobile: Column(
                  children: [
                    if (_selectedGuest != null && _isGuestDetailVisible)
                      Expanded(
                        child: Stack(
                          children: [
                            GuestDetail(
                              guest: _selectedGuest!,
                              onTap: _hideGuestList, // Will be ignored on mobile
                              showBackButton: !_isGuestListVisible,
                              onBackPressed: _showGuestList,
                            ),
                            Positioned(
                              top: 10,
                              left: 10,
                              child: FloatingActionButton(
                                mini: true,
                                onPressed: _toggleGuestDetail,
                                child: const Icon(Icons.arrow_back),
                              ),
                            ),
                          ],
                        ),
                      )
                    else
                      Expanded(
                        child: Row(
                          children: [
                            if (_isSidebarVisible)
                              Sidebar(
                                selectedIndex: _selectedSidebarIndex,
                                onItemSelected: (index) {
                                  setState(() {
                                    _selectedSidebarIndex = index;
                                  });
                                },
                              ),
                            Expanded(
                              child: GuestList(
                                guests: _guests,
                                selectedGuest: _selectedGuest,
                                searchController: _searchController,
                                onSearch: _onSearch,
                                onGuestSelected: (guest) {
                                  setState(() {
                                    _selectedGuest = guest;
                                    _isGuestDetailVisible = true;
                                  });
                                },
                                onAddGuest: () {
                                  // Add guest action
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),

                // Tablet layout - Side by side with conditional detail
                tablet: Row(
                  children: [
                    if (_isSidebarVisible)
                      Sidebar(
                        selectedIndex: _selectedSidebarIndex,
                        onItemSelected: (index) {
                          setState(() {
                            _selectedSidebarIndex = index;
                          });
                        },
                      ),
                    // Only show the guest list if it's visible
                    if (_isGuestListVisible)
                      GuestList(
                        guests: _guests,
                        selectedGuest: _selectedGuest,
                        searchController: _searchController,
                        onSearch: _onSearch,
                        onGuestSelected: (guest) {
                          setState(() {
                            _selectedGuest = guest;
                          });
                        },
                        onAddGuest: () {
                          // Add guest action
                        },
                      ),
                    if (_selectedGuest != null)
                      Expanded(
                        child: GuestDetail(
                          guest: _selectedGuest!,
                          onTap: _hideGuestList,
                          showBackButton: !_isGuestListVisible,
                          onBackPressed: _showGuestList,
                        ),
                      ),
                  ],
                ),

                // Desktop layout - Full layout with sidebar, list, and detail
                desktop: Row(
                  children: [
                    Sidebar(
                      selectedIndex: _selectedSidebarIndex,
                      onItemSelected: (index) {
                        setState(() {
                          _selectedSidebarIndex = index;
                        });
                      },
                    ),
                    // Only show the guest list if it's visible
                    if (_isGuestListVisible)
                      GuestList(
                        guests: _guests,
                        selectedGuest: _selectedGuest,
                        searchController: _searchController,
                        onSearch: _onSearch,
                        onGuestSelected: (guest) {
                          setState(() {
                            _selectedGuest = guest;
                          });
                        },
                        onAddGuest: () {
                          // Add guest action
                        },
                      ),
                    if (_selectedGuest != null)
                      Expanded(
                        child: GuestDetail(
                          guest: _selectedGuest!,
                          onTap: _hideGuestList,
                          showBackButton: !_isGuestListVisible,
                          onBackPressed: _showGuestList,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
