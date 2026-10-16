extension UpperLowerExtension on String {
  String get toUpperCaseFirst {
    if (trim().isEmpty) return '';
    return '${this[0].toUpperCase()}${substring(1)}';
  }
  String get initials {
    final words = trim().split(RegExp(r'\s+'));

    return words
        .take(2)
        .map((word) => word[0].toUpperCase())
        .join();
  }
}
