import 'package:flutter/material.dart';
import '../../Components/Tab/tab.dart';
import '../../Components/Tab/tabViewModel.dart';

class TabPage extends StatelessWidget {
  const TabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tab Page Demo"),
        backgroundColor: Colors.blueAccent, // Exemplo de cor
      ),
      body: _buildTabComponent(),
    );
  }

  Widget _buildTabComponent() {
    final List<Tab> tabs = const [
      Tab(text: 'Home'),
      Tab(text: 'Messages'),
      Tab(text: 'Label 1'),
      Tab(text: 'Label 2'),
    ];

    return TabComponent.instantiate(
      tabViewModel: TabViewModel(
        tabs: tabs,
        initialIndex: 0,
      ),
    );
  }
}
