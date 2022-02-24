class ImageConstant {
  static ImageConstant? _instance;
  static ImageConstant get instance => _instance ?? ImageConstant._init();
  ImageConstant._init();

  String toPng(String name) => 'assets/images/$name.png';
}
