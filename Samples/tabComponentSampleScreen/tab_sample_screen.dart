import 'package:flutter/material.dart';
import 'package:input_text/Components/Tab/tabBar.dart';
import 'package:input_text/Components/Tab/tabViewModel.dart';

class TabPage extends StatelessWidget {
  const TabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tab page Demo"),
      ),
      body: TabComponent.instantiate(
        tabViewModel: TabViewModel(
          tabs: [
            const Tab(text: 'Home',),
            const Tab(text: 'Messages',),
            const Tab(text: 'Label',),
            const Tab(text: 'Label',),
          ],
          initialIndex: 0,
        ),
      )
    );
  }
}