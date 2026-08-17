extension UppperLowerExtension on String{
  String get toUpperCaseFirst => '${this[0].toUpperCase()}${substring(1)}';
}