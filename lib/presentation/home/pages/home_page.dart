import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/bottom_nav_bar_section.dart';

class HomePage extends StatelessWidget {
  final int selectedIndex;
  final Widget child;
  final bool showBottomNav;

  const HomePage({
    super.key,
    required this.selectedIndex,
    required this.child,
    this.showBottomNav = true,
  });

  static const List<String> _routes = [
    '/dashboard',
    '/search',
    '/downloads',
    '/account',
  ];

  void _onItemTapped(BuildContext context, int index) {
    if (index != selectedIndex) {
      context.go(_routes[index]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: showBottomNav
          ? NavigationBar(
              selectedIndex: selectedIndex,
              onDestinationSelected: (int index) =>
                  _onItemTapped(context, index),
              destinations: _navigationDestinations,
            )
          : null,
    );
  }

  static List<BottomNavBarSection> get _navigationDestinations {
    return [
      const BottomNavBarSection(
        label: 'Home',
        selectedSvgPath: 'assets/icons/ic_home_selected.svg',
        unselectedSvgPath: 'assets/icons/ic_home_unselected.svg',
      ),
      const BottomNavBarSection(
        label: 'Search',
        selectedSvgPath: 'assets/icons/ic_search_selected.svg',
        unselectedSvgPath: 'assets/icons/ic_search_unselected.svg',
      ),
      const BottomNavBarSection(
        label: 'Downloads',
        selectedSvgPath: 'assets/icons/ic_downloads_selected.svg',
        unselectedSvgPath: 'assets/icons/ic_downloads_unselected.svg',
      ),
      const BottomNavBarSection(
        label: 'My Box',
        selectedSvgPath: 'assets/icons/ic_account_selected.svg',
        unselectedSvgPath: 'assets/icons/ic_account_unselected.svg',
      ),
    ];
  }
}
