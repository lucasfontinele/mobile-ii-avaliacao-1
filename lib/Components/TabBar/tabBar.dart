import 'package:flutter/material.dart';
import 'tabBarViewModel.dart';

class CustomTabBar extends StatefulWidget {
  final TabBarViewModel viewModel;
  final Function(int) onTabSelected;

  const CustomTabBar._(this.viewModel, this.onTabSelected);

  static Widget instantiate(TabBarViewModel viewModel, Function(int) onTabSelected) {
    return CustomTabBar._(viewModel, onTabSelected);
  }

  @override
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(widget.viewModel.tabTitles.length, (index) {
        final bool isSelected = _selectedIndex == index;
        return Expanded( // Usa Expanded para dividir o espaço igualmente
          child: GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
              widget.onTabSelected(index);
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.viewModel.tabTitles[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: isSelected ? const Color(0xFFF8D247) : Colors.white,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
                const SizedBox(height: 4), // Pequeno espaçamento entre o texto e a linha
                Container(
                  height: 4,
                  width: double.infinity, // Linha ocupa toda a largura da aba
                  color: isSelected ? const Color(0xFFF8D247) : Colors.transparent,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
