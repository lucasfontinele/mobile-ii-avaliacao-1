import 'package:flutter/material.dart';
import '../Bottom Navigation Bar/Bottom Bar/BottomBarViewModel.dart';
import 'BottomBarViewModel.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final ActionBottomBarViewModel viewModel;

  const CustomBottomNavigationBar._(this.viewModel, {Key? key}) : super(key: key);

  @override
  _CustomBottomNavigationBarState createState() => _CustomBottomNavigationBarState();

  static Widget instantiate({required ActionBottomBarViewModel viewModel}) {
    return CustomBottomNavigationBar._(viewModel);
  }
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: widget.viewModel.items
            .asMap()
            .entries
            .map((entry) => _buildItem(entry.key, entry.value as BottomNavigationBarItem))
            .toList(),
      ),
    );
  }

  Widget _buildItem(int index, BottomNavigationBarItem item) {
    final bool isSelected = index == widget.viewModel.selectedIndex;

    return GestureDetector(
      onTap: () {
        if (widget.viewModel.selectedIndex != index) {
          setState(() {
            widget.viewModel.selectedIndex = index;
          });
          widget.viewModel.onItemSelected(index);
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            item.icon as IconData?,
            color: isSelected ? Colors.yellow : Colors.black,
          ),
          const SizedBox(height: 4),
          Text(
            item.label,
            style: TextStyle(
              fontSize: _getFontSize(widget.viewModel.size),
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? Colors.yellow : Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  double _getFontSize(ActionBottomBarOptionSize size) {
    switch (size) {
      case ActionBottomBarOptionSize.large:
        return 20;
      case ActionBottomBarOptionSize.medium:
        return 16;
      case ActionBottomBarOptionSize.small:
        return 12;
      default:
        return 16;
    }
  }
}

class BottomNavigationBarController {
  final ActionBottomBarViewModel viewModel;

  BottomNavigationBarController(this.viewModel);
}
