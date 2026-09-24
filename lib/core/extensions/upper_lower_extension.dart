extension UpperLowerExtension on String {
  String get toUpperCaseFirst {
    if (trim().isEmpty) return '';
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}
