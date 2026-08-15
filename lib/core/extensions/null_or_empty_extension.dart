extension NullOrEmptyExtension on String? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;
}

extension NullExtension on Object? {
  bool get isNull => this == null;
}
