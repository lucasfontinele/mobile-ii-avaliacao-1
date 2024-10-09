import 'package:flutter/material.dart';
import 'package:test/Components/Tab/tabViewModel.dart';

import '../../shared/colors.dart';

class TabComponent extends StatefulWidget {
  final TabViewModel tabViewModel;

  const TabComponent._({super.key, required this.tabViewModel});

  @override
  State<TabComponent> createState() => _TabComponentState();

  // Método estático para instanciar o widget
  static Widget instantiate({required TabViewModel tabViewModel}) {
    return TabComponent._(tabViewModel: tabViewModel);
  }
}

class _TabComponentState extends State<TabComponent>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();

    // Valida o índice inicial para garantir que esteja dentro dos limites
    final int initialIndex = (widget.tabViewModel.initialIndex >= 0 &&
        widget.tabViewModel.initialIndex < widget.tabViewModel.tabs.length)
        ? widget.tabViewModel.initialIndex
        : 0;

    tabController = TabController(
      length: widget.tabViewModel.tabs.length,
      vsync: this,
      initialIndex: initialIndex,
    );

    tabController.addListener(handleTabChange);
  }

  // Função que lida com a mudança de aba
  void handleTabChange() {
    if (tabController.indexIsChanging) {
      widget.tabViewModel.onIndexChanged?.call(tabController.index);
    }
  }

  @override
  void dispose() {
    tabController.removeListener(handleTabChange);
    tabController.dispose();
    super.dispose();
  }

  // Função separada para construir o TabBar
  Widget buildTabBar() {
    return TabBar(
      controller: tabController,
      tabs: widget.tabViewModel.tabs,
      indicatorColor: lightPrimaryBrandColor, // Cor customizada
      labelColor: lightPrimaryBrandColor,
      unselectedLabelColor: Colors.grey,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildTabBar(), // Usando a função para construir o TabBar
      ],
    );
  }
}
