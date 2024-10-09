class TabBarViewModel {
  final List<String> tabTitles;

  /// [TabBarViewModel] é utilizado para representar as abas de uma tab bar.
  ///
  /// [tabTitles] deve conter uma lista de títulos das abas. Essa lista não deve estar vazia.
  const TabBarViewModel({
    required this.tabTitles,
  }) : assert(tabTitles.isNotEmpty, 'A lista de títulos das abas não pode estar vazia.');
}
