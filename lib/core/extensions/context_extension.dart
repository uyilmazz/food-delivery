import 'dart:math';

import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;

  double dynamicWidth(double value) => width * value;
  double dynamicHeight(double value) => height * value;

  double get lowValue => height * 0.01;
  double get normalValue => height * 0.02;
  double get mediumValue => height * 0.04;
  double get highValue => height * 0.1;
}

extension PaddingExtension on BuildContext {
  EdgeInsets get lowPadding => EdgeInsets.all(lowValue);
  EdgeInsets get normalPadding => EdgeInsets.all(normalValue);
  EdgeInsets get mediumPadding => EdgeInsets.all(mediumValue);
  EdgeInsets get highPadding => EdgeInsets.all(highValue);

  EdgeInsets get verticalLowPadding => EdgeInsets.symmetric(vertical: lowValue);
  EdgeInsets get verticalNormalPadding =>
      EdgeInsets.symmetric(vertical: normalValue);
  EdgeInsets get verticalMediumPadding =>
      EdgeInsets.symmetric(vertical: mediumValue);
  EdgeInsets get verticalHighPadding =>
      EdgeInsets.symmetric(vertical: highValue);

  EdgeInsets get horizontalLowPadding =>
      EdgeInsets.symmetric(horizontal: lowValue);
  EdgeInsets get horizontalNormalPadding =>
      EdgeInsets.symmetric(horizontal: normalValue);
  EdgeInsets get horizontalMediumPadding =>
      EdgeInsets.symmetric(horizontal: mediumValue);
  EdgeInsets get horizontalHighPadding =>
      EdgeInsets.symmetric(horizontal: highValue);

  EdgeInsets get pagePadding =>
      EdgeInsets.symmetric(horizontal: normalValue, vertical: normalValue * 2);
}

extension PageColorExtension on BuildContext {
  Color get randomColor => Colors.primaries[Random().nextInt(17)];
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
}
