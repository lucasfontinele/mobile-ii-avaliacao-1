import 'package:flutter/material.dart';
import '../Components/TabBar/tabBar.dart';
import '../Components/TabBar/tabBarViewModel.dart';

class TabBarSampleScreen extends StatefulWidget {
  @override
  _TabBarSampleScreenState createState() => _TabBarSampleScreenState();
}

class _TabBarSampleScreenState extends State<TabBarSampleScreen> {
  String _selectedTabText = "Select a tab";

  void _onTabSelected(int index) {
    setState(() {
      _selectedTabText = "Selected Tab: Tab ${index + 1}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildTabBar(),
        const SizedBox(height: 20),
        _buildSelectedTabText(),
      ],
    );
  }

  Widget _buildTabBar() {
    final tabTitles = ["Tab 1", "Tab 2", "Tab 3"];
    return CustomTabBar.instantiate(
      TabBarViewModel(tabTitles: tabTitles),
      _onTabSelected,
    );
  }

  Widget _buildSelectedTabText() {
    return Text(
      _selectedTabText,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
    );
  }
