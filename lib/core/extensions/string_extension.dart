extension StringExtension on String {
  String get toCapitalize =>
      '${this[0].toUpperCase()}${this.substring(1).toLowerCase()}';
}
