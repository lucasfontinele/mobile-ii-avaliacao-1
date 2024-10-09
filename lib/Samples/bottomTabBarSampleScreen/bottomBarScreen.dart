import 'package:flutter/material.dart';

import '../../Components/BottomTabBar/bottomTabBar.dart';
import '../../Components/BottomTabBar/bottomTabBarViewModel.dart';

class BottomTabBarPage extends StatefulWidget {
  const BottomTabBarPage({super.key});

  @override
  State<BottomTabBarPage> createState() => _BottomTabBarPageState();
}

class _BottomTabBarPageState extends State<BottomTabBarPage> {
  int actualIndex = 0;

  final List<Widget> pages = const [
    Center(child: Text('Home Page')),
    Center(child: Text('Messages Page')),
    Center(child: Text('Label Page')),
    Center(child: Text('Profile Page')),
  ];

  List<BottomNavigationBarItem> buildBottomTabs() {
    return const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: "Home",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.message),
        label: "Messages",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.label),
        label: "Label",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: "Profile",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom Tab Bar Page'),
      ),
      body: pages[actualIndex],
      bottomNavigationBar: BottomTabBar.instantiate(
        viewModel: BottomTabBarViewModel(
          bottomTabs: buildBottomTabs(),
          onIndexChanged: (index) {
            setState(() {
              actualIndex = index;
            });
          },
        ),
        currentIndex: actualIndex,
      ),
    );
  }
}
