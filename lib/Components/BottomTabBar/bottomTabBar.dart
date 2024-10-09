import 'package:flutter/material.dart';
import '../../shared/colors.dart';
import 'bottomTabBarViewModel.dart';

/// A widget that represents a customizable bottom navigation bar.
class BottomTabBar extends StatelessWidget {
  final BottomTabBarViewModel viewModel;
  final int selectedIndex;

  /// Creates a [BottomTabBar] widget.
  const BottomTabBar._({
    Key? key,
    required this.viewModel,
    required this.selectedIndex,
  }) : super(key: key);

  /// A static method to instantiate the [BottomTabBar].
  static Widget create({
    required BottomTabBarViewModel viewModel,
    required int selectedIndex,
  }) {
    return BottomTabBar._(viewModel: viewModel, selectedIndex: selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: viewModel.bottomTabs,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: darkPrimaryBrandColor,
      unselectedItemColor: lightPrimaryBaseColorLight,
      showUnselectedLabels: true,
      currentIndex: selectedIndex,
      onTap: viewModel.onIndexChanged,
    );
  }
}
