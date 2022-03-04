extension StringExtension on String {
  String get toCapitalize =>
      '${this[0].toUpperCase()}${substring(1).toLowerCase()}';

  String get toPng => 'assets/images/$this.png';

  String get toLottieJson => 'assets/lottie/$this.json';

  bool get emailRegex => RegExp(
          r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
      .hasMatch(this);
}
