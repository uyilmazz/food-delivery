class AppConstant {
  static AppConstant? _instance;

  static AppConstant get instance => _instance ?? AppConstant._init();
  AppConstant._init();

  static String fontFamily = 'ProductSans';
  static String fontFamilyLight = 'ProductSansLight';
}
