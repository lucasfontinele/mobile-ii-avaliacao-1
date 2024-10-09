import 'package:flutter/material.dart';
import '../Components/Bottom Navigation Bar/Bottom Navigation Bar/bottomBar.dart';
import '../Components/Bottom Navigation Bar/Bottom Navigation Bar/BottomBarViewModel.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationBarScreen> {
  final ActionBottomBarViewModel viewModel = ActionBottomBarViewModel(
    size: ActionBottomBarOptionSize.medium,
    style: ActionBottomNavigationBarStyle.primary,
    items: [
      BottomBarItem(icon: Icons.home, label: 'Casa'),
      BottomBarItem(icon: Icons.history, label: 'Histórico'),
      BottomBarItem(icon: Icons.save, label: 'Salvos'),
      BottomBarItem(icon: Icons.person, label: 'Perfil'),
    ],
    onItemSelected: (int index) {
      _onItemSelected(index);
    },
  );

  void _onItemSelected(int index) {
    setState(() {
      viewModel.selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: CustomBottomNavigationBar.instantiate(viewModel: viewModel),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: Text(
              'Botão selecionado: ${viewModel.items[viewModel.selectedIndex].label}',
              style: const TextStyle(fontSize: 18, color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}