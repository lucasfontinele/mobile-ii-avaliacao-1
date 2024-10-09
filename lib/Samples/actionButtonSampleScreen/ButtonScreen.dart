import 'package:flutter/material.dart';

import '../../Components/Button/buttton.dart';
import '../../Components/Buttons/ActionButton/buttonViewModel.dart';

class ActionButtonPage extends StatelessWidget {
  const ActionButtonPage({super.key});

  // Função auxiliar para criar botões
  Widget buildActionButton({
    required ActionButtonSize size,
    required ActionButtonStyle style,
    required String text,
    IconData? icon,
    required VoidCallback onPressed,
  }) {
    return ActionButton.instantiate(
      viewModel: ActionButtonViewModel(
        size: size,
        style: style,
        text: text,
        icon: icon,
        onPressed: onPressed,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Styled Action Button Demo'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    buildActionButton(
                      size: ActionButtonSize.large,
                      style: ActionButtonStyle.primary,
                      text: 'Large',
                      onPressed: () {},
                    ),
                    const SizedBox(height: 10),
                    buildActionButton(
                      size: ActionButtonSize.medium,
                      style: ActionButtonStyle.primary,
                      text: 'Medium',
                      onPressed: () {},
                    ),
                    const SizedBox(height: 10),
                    buildActionButton(
                      size: ActionButtonSize.small,
                      style: ActionButtonStyle.primary,
                      text: 'Small',
                      onPressed: () {},
                    ),
                  ],
                ),
                Column(
                  children: [
                    buildActionButton(
                      size: ActionButtonSize.large,
                      style: ActionButtonStyle.secondary,
                      text: 'Large',
                      icon: Icons.navigate_next_outlined,
                      onPressed: () {},
                    ),
                    const SizedBox(height: 10),
                    buildActionButton(
                      size: ActionButtonSize.medium,
                      style: ActionButtonStyle.secondary,
                      text: 'Medium',
                      icon: Icons.navigate_next_outlined,
                      onPressed: () {},
                    ),
                    const SizedBox(height: 10),
                    buildActionButton(
                      size: ActionButtonSize.small,
                      style: ActionButtonStyle.secondary,
                      text: 'Small',
                      icon: Icons.navigate_next_outlined,
                      onPressed: () {},
                    ),
                  ],
                ),
                Column(
                  children: [
                    buildActionButton(
                      size: ActionButtonSize.large,
                      style: ActionButtonStyle.tertiary,
                      text: 'Large',
                      onPressed: () {},
                    ),
                    const SizedBox(height: 10),
                    buildActionButton(
                      size: ActionButtonSize.medium,
                      style: ActionButtonStyle.tertiary,
                      text: 'Medium',
                      icon: Icons.navigate_next_outlined,
                      onPressed: () {},
                    ),
                    const SizedBox(height: 10),
                    buildActionButton(
                      size: ActionButtonSize.small,
                      style: ActionButtonStyle.tertiary,
                      text: 'Small',
                      icon: Icons.navigate_next_outlined,
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
