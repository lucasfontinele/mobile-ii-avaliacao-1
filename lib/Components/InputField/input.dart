import 'package:flutter/material.dart';
import 'inputViewModel.dart';

class StyledInputField extends StatefulWidget {
  final InputTextViewModel viewModel;

  const StyledInputField._({Key? key, required this.viewModel}) : super(key: key);

  @override
  StyledInputFieldState createState() => StyledInputFieldState();

  static Widget instantiate({required InputTextViewModel viewModel}) {
    return StyledInputField._(viewModel: viewModel);
  }
}

class StyledInputFieldState extends State<StyledInputField> {
  late bool obscureText;
  String? errorMsg;

  @override
  void initState() {
    super.initState();
    obscureText = widget.viewModel.password;
    widget.viewModel.controller.addListener(_validateInput);
  }

  @override
  void dispose() {
    widget.viewModel.controller.removeListener(_validateInput);
    super.dispose();
  }

  // Método para validar a entrada do campo de texto
  void _validateInput() {
    final errorText = widget.viewModel.validator?.call(widget.viewModel.controller.text);
    setState(() {
      errorMsg = errorText;
    });
  }

  // Método para alternar a visibilidade do campo de senha
  void _togglePasswordVisibility() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  // Método para construir a decoração do campo de texto
  InputDecoration _buildInputDecoration() {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      filled: true,
      fillColor: widget.viewModel.isEnabled ? Colors.white : Colors.grey.shade400,
      labelText: widget.viewModel.placeholder.isNotEmpty ? widget.viewModel.placeholder : null,
      labelStyle: const TextStyle(color: Colors.black),
      suffixIcon: widget.viewModel.password
          ? IconButton(
        icon: Icon(obscureText ? Icons.visibility : Icons.visibility_off),
        onPressed: _togglePasswordVisibility,
      )
          : widget.viewModel.suffixIcon,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: Colors.black),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: Colors.red),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: Colors.black),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: Colors.black),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      errorText: errorMsg,
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.viewModel.controller,
      obscureText: obscureText,
      decoration: _buildInputDecoration(),
      style: const TextStyle(color: Colors.black),
      enabled: widget.viewModel.isEnabled,
    );
  }
}
