import 'package:flutter/material.dart';

// Enum to define the size options for the bottom bar items.
enum ActionBottomBarOptionSize {
  large,
  medium,
  small,
}

// Enum to define the icon size options.
enum ActionIconStyle {
  large,
  medium,
  small,
}

// Enum to define the style options for the bottom navigation bar.
enum ActionBottomNavigationBarStyle {
  primary,
  secondary,
  tertiary,
}

// Class representing an item in the Bottom Navigation Bar.
class BottomBarItem {
  final IconData icon;
  final String label;

  const BottomBarItem({
    required this.icon,
    required this.label,
  });
}

// ViewModel for the action bottom bar.
class ActionBottomBarViewModel {
  final ActionBottomBarOptionSize size;
  final ActionBottomNavigationBarStyle style;
  final List<BottomBarItem> items;
  late final int selectedIndex; // Made final to avoid unintentional modification
  final Function(int) onItemSelected;

  ActionBottomBarViewModel({
    required this.size,
    required this.style,
    required this.items,
    this.selectedIndex = 0,
    required this.onItemSelected,
  });

  // Create a copy of the view model with an updated selected index.
  ActionBottomBarViewModel copyWith({required int newIndex}) {
    return ActionBottomBarViewModel(
      size: size,
      style: style,
      items: items,
      selectedIndex: newIndex,
      onItemSelected: onItemSelected,
    );
  }
}
