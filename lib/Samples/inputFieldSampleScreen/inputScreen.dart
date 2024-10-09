import 'package:flutter/material.dart';

import '../../Components/InputField/input.dart';
import '../../Components/InputField/inputViewModel.dart';

class InputFieldPage extends StatefulWidget {
  const InputFieldPage({super.key});

  @override
  _InputFieldPageState createState() => _InputFieldPageState();
}

class _InputFieldPageState extends State<InputFieldPage> {
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController passwordController1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  final TextEditingController passwordController2 = TextEditingController();

  @override
  void dispose() {
    controller1.dispose();
    passwordController1.dispose();
    controller2.dispose();
    passwordController2.dispose();
    super.dispose();
  }

  Widget buildInputField({
    required TextEditingController controller,
    required String placeholder,
    bool password = false,
    bool isEnabled = true,
    Icon? suffixIcon,
    String? Function(String?)? validator,
  }) {
    return StyledInputField.instantiate(
      viewModel: InputTextViewModel(
        controller: controller,
        placeholder: placeholder,
        password: password,
        isEnabled: isEnabled,
        suffixIcon: suffixIcon,
        validator: validator,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Styled Input Field Demo'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildInputField(
              controller: controller1,
              placeholder: 'Label',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Esse campo é obrigatório';
                } else if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                  return 'Somente letras são permitidas!';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            buildInputField(
              controller: passwordController1,
              placeholder: 'Senha',
              password: true,
              suffixIcon: const Icon(Icons.remove_red_eye),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Esse campo é obrigatório';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            const Text("Disabled"),
            const SizedBox(height: 20),
            buildInputField(
              controller: controller2,
              placeholder: 'Label',
              isEnabled: false,
            ),
            const SizedBox(height: 20),
            buildInputField(
              controller: passwordController2,
              placeholder: 'Senha',
              password: false,
              isEnabled: false,
              suffixIcon: const Icon(Icons.remove_red_eye),
            ),
          ],
        ),
      ),
    );
  }
}
