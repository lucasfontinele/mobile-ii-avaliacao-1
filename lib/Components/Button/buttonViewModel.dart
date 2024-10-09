import 'package:flutter/material.dart';

/// Enum representing the sizes of the action button.
enum ActionButtonSize {
  small,
  medium,
  large,
}

/// Enum representing the styles of the action button.
enum ActionButtonStyle {
  primary,
  secondary,
  tertiary,
}

/// ViewModel for the Action Button.
class ActionButtonViewModel {
  /// The size of the button.
  final ActionButtonSize size;

  /// The style of the button.
  final ActionButtonStyle style;

  /// The text displayed on the button.
  final String text;

  /// An optional icon displayed on the button.
  final IconData? icon;

  /// The callback function executed when the button is pressed.
  final VoidCallback onPressed;

  /// Creates an instance of [ActionButtonViewModel].
  ActionButtonViewModel({
    required this.size,
    required this.style,
    required this.text,
    required this.onPressed,
    this.icon,
  });
}
