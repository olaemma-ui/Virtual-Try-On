import 'dart:ui';

import 'package:flutter/material.dart';

class VerticalNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const VerticalNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 310,
      decoration: BoxDecoration(
        color: const Color.fromARGB(238, 60, 58, 56),
        borderRadius: BorderRadius.circular(35),
        border: Border.all(color: Colors.white12),
      ),
      margin: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavItem(0, Icons.home_outlined, 'Home'),
          _buildNavItem(1, Icons.search, 'Search'),
          _buildNavItem(2, Icons.shopping_cart_outlined, 'Cart'),
          _buildNavItem(3, Icons.auto_awesome, 'Featured'),
          _buildNavItem(4, Icons.settings_outlined, 'Settings'),
        ],
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    final bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () => onItemSelected(index),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: isSelected
              ? const Color.fromARGB(255, 255, 255, 255).withOpacity(.2)
              : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 24,
        ),
      ),
    );
  }
}
