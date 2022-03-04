class AppConstant {
  static AppConstant? _instance;

  static AppConstant get instance => _instance ?? AppConstant._init();
  AppConstant._init();

  static String FONT_FAMILY = 'ProductSans';
  static String FONT_FAMILY_LIGHT = 'ProductSansLight';
}
