import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../shared/colors.dart';
import '../../shared/styles.dart';
import 'textViewModel.dart';

class LinkedLabel extends StatelessWidget {
  final LinkedLabelViewModel viewModel;

  const LinkedLabel._({super.key, required this.viewModel});

  // Método estático para instanciar o widget
  static Widget instantiate({required LinkedLabelViewModel viewModel}) {
    return LinkedLabel._(viewModel: viewModel);
  }

  // Função que encontra os índices de início e fim do texto vinculado
  List<int> _findLinkedTextIndices() {
    final startIndex = viewModel.fullText.indexOf(viewModel.linkedText);
    final endIndex = startIndex + viewModel.linkedText.length;
    return [startIndex, endIndex];
  }

  @override
  Widget build(BuildContext context) {
    // Obtém os índices do texto vinculado
    final indices = _findLinkedTextIndices();
    final startIndex = indices[0];
    final endIndex = indices[1];

    // Se o texto vinculado não for encontrado, retorna o texto completo simples
    if (startIndex == -1) {
      return Text(
        viewModel.fullText,
        style: viewModel.textStyle ?? label2Semibold,
      );
    }

    return RichText(
      text: TextSpan(
        text: viewModel.fullText.substring(0, startIndex),
        style: viewModel.textStyle ?? label2Semibold,
        children: [
          TextSpan(
            text: viewModel.linkedText,
            style: viewModel.linkStyle ??
                const TextStyle(color: normalSecondaryBrandColor),
            recognizer: TapGestureRecognizer()..onTap = viewModel.onLinkTap,
          ),
          TextSpan(
            text: viewModel.fullText.substring(endIndex),
            style: viewModel.textStyle ?? label2Semibold,
          ),
        ],
      ),
    );
  }
}
