import 'package:flutter/material.dart';

import '../../shared/colors.dart';
import '../../shared/styles.dart';
import '../Buttons/ActionButton/buttonViewModel.dart';

class ActionButton extends StatelessWidget {
  final ActionButtonViewModel viewModel;

  const ActionButton._({super.key, required this.viewModel});

  static Widget instantiate({required ActionButtonViewModel viewModel}) {
    return ActionButton._(viewModel: viewModel);
  }

  // Define default padding and sizes
  static const double _defaultHorizontalPadding = 32.0;
  static const double _defaultVerticalPadding = 12.0;
  static const double _smallHorizontalPadding = 16.0;
  static const double _iconSizeLarge = 24.0;
  static const double _iconSizeSmall = 16.0;

  // Returns appropriate button text style based on size
  TextStyle _getButtonTextStyle(ActionButtonSize size) {
    switch (size) {
      case ActionButtonSize.large:
        return button1Bold;
      case ActionButtonSize.medium:
        return button2Semibold;
      case ActionButtonSize.small:
        return button3Semibold;
      default:
        return button3Semibold; // Fallback style
    }
  }

  // Returns appropriate button color based on style
  Color _getButtonColor(ActionButtonStyle style) {
    switch (style) {
      case ActionButtonStyle.primary:
        return lightPrimaryBrandColor;
      case ActionButtonStyle.secondary:
        return lightSecondaryBrandColor;
      case ActionButtonStyle.tertiary:
        return lightTertiaryBrandColor;
      default:
        return lightPrimaryBrandColor; // Fallback color
    }
  }

  @override
  Widget build(BuildContext context) {
    // Determine padding, icon size, and text style based on button size
    final double horizontalPadding = viewModel.size == ActionButtonSize.small
        ? _smallHorizontalPadding
        : _defaultHorizontalPadding;
    final double verticalPadding = _defaultVerticalPadding;
    final double iconSize = viewModel.size == ActionButtonSize.small
        ? _iconSizeSmall
        : _iconSizeLarge;

    final buttonTextStyle = _getButtonTextStyle(viewModel.size);
    final buttonColor = _getButtonColor(viewModel.style);

    // Build the button
    return ElevatedButton(
      onPressed: viewModel.onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        textStyle: buttonTextStyle,
        padding: EdgeInsets.symmetric(
          vertical: verticalPadding,
          horizontal: horizontalPadding,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min, // Adjust size to fit content
        children: [
          if (viewModel.icon != null)
            Icon(viewModel.icon, size: iconSize),
          if (viewModel.icon != null)
            const SizedBox(width: 8), // Add space between icon and text
          Text(viewModel.text),
        ],
      ),
    );
  }
}
