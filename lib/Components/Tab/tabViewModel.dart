import 'package:flutter/material.dart';

class TabViewModel {
  final List<Tab> tabs;
  final Function(int)? onIndexChanged;
  final int initialIndex;

  /// Modelo de dados para um componente de TabBar.
  ///
  /// [initialIndex] define qual aba será exibida inicialmente. O valor deve estar dentro do range de [tabs].
  /// [tabs] é uma lista de objetos `Tab`, que representa as abas da interface.
  /// [onIndexChanged] é uma função opcional que é chamada sempre que o índice da aba mudar.
  const TabViewModel({
    required this.initialIndex,
    required this.tabs,
    this.onIndexChanged,
  }) : assert(
  initialIndex >= 0 && initialIndex < tabs.length,
  'O initialIndex deve estar dentro do intervalo válido de tabs.',
  );
}
