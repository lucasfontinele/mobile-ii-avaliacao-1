import 'package:flutter/material.dart';
import '../../Components/LinkedLabel/text.dart';
import '../../Components/LinkedLabel/textViewModel.dart';

class LinkedLabelPage extends StatelessWidget {
  const LinkedLabelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Linked Label Page"),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLinkedLabel(),
        ],
      ),
    );
  }

  Widget _buildLinkedLabel() {
    return LinkedLabel.instantiate(
      viewModel: LinkedLabelViewModel(
        fullText: "texto com link",
        linkedText: "com link",
        onLinkTap: () {
          // Exemplo de ação ao clicar no link
          print("Link clicado!");
        },
      ),
    );
  }
}
