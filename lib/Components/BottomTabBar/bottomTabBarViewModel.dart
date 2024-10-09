import 'package:flutter/material.dart';

/// A ViewModel class that holds the data and logic for the BottomTabBar.
class BottomTabBarViewModel {
  /// Callback function that is invoked when the selected tab index changes.
  final ValueChanged<int>? onIndexChanged;

  /// A list of items to display in the Bottom Navigation Bar.
  final List<BottomNavigationBarItem> bottomTabs;

  /// Creates an instance of [BottomTabBarViewModel].
  ///
  /// The [bottomTabs] parameter is required and should contain
  /// the items to be displayed in the bottom navigation bar.
  /// The [onIndexChanged] parameter is optional and can be
  /// provided to handle tab selection changes.
  BottomTabBarViewModel({
    required this.bottomTabs,
    this.onIndexChanged,
  });
}
