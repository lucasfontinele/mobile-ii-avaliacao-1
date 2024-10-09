import 'package:flutter/material.dart';

/// ViewModel for managing the state of an input text field.
class InputTextViewModel {
  final TextEditingController controller; // Controller to manage text input.
  final String placeholder; // Placeholder text for the input field.
  final bool isPassword; // Indicates if the input is for a password.
  final Widget? suffixIcon; // Optional suffix icon for the input field.
  final bool isEnabled; // Indicates if the input field is enabled.
  final String? Function(String?)? validator; // Function to validate the input.
  final VoidCallback? onTogglePasswordVisibility; // Callback for toggling password visibility.

  /// Creates an instance of [InputTextViewModel].
  InputTextViewModel({
    required this.controller,
    required this.placeholder,
    bool? password, // Nullable parameter for password
    this.suffixIcon,
    this.isEnabled = true,
    this.validator,
    this.onTogglePasswordVisibility,
  }) : isPassword = password ?? false;

}
