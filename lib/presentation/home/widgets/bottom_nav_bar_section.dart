import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBarSection extends StatelessWidget {
  final String selectedSvgPath;
  final String unselectedSvgPath;
  final String label;
  final Color selectedColor;
  final Color unselectedColor;

  const BottomNavBarSection({
    required this.selectedSvgPath,
    required this.unselectedSvgPath,
    required this.label,
    this.selectedColor = Colors.white,
    this.unselectedColor = Colors.grey,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      selectedIcon: SvgPicture.asset(
        selectedSvgPath,
        width: 18,
        height: 18,
        colorFilter: ColorFilter.mode(
          selectedColor,
          BlendMode.srcIn,
        ),
      ),
      icon: SvgPicture.asset(
        unselectedSvgPath,
        width: 18,
        height: 18,
        colorFilter: ColorFilter.mode(
          unselectedColor,
          BlendMode.srcIn,
        ),
      ),
      label: label,
    );
  }
}
