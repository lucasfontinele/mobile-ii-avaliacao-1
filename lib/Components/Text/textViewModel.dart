class LinkedLabelViewModel {
  final String fullText;
  final String linkedText;
  final Function()? onLinkTap;

  /// ViewModel para o componente LinkedLabel.
  ///
  /// [fullText] é o texto completo que contém o texto vinculado.
  /// [linkedText] é o texto que será estilizado e clicável dentro de [fullText].
  /// [onLinkTap] é a função que será chamada quando o [linkedText] for clicado.
  /// Garante que [linkedText] exista dentro de [fullText].
  LinkedLabelViewModel({
    required this.fullText,
    required this.linkedText,
    this.onLinkTap,
  })  : assert(fullText.contains(linkedText),
  'linkedText deve estar contido em fullText'),
        assert(linkedText.isNotEmpty, 'linkedText não pode estar vazio');
}
