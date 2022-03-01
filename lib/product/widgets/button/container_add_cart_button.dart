import 'package:flutter/material.dart';

import '../../../core/constants/color_constant.dart';
import '../../../core/extensions/context_extension.dart';

class ContainerAddCartButton extends StatelessWidget {
  final Widget widget;
  final double? bottomLeft;
  final double? bottomRight;
  final double? topLeft;
  final double? topRight;
  final Function()? onTap;

  const ContainerAddCartButton(
      {Key? key,
      required this.widget,
      this.bottomLeft = 0,
      this.bottomRight = 0,
      this.topLeft = 0,
      this.topRight = 0,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
          padding: EdgeInsets.symmetric(
              vertical: context.normalValue,
              horizontal: context.normalValue * 1.5),
          decoration: BoxDecoration(
              color: ColorConstants.primaryColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(bottomLeft ?? 0),
                  bottomRight: Radius.circular(bottomRight ?? 0),
                  topRight: Radius.circular(topRight ?? 0),
                  topLeft: Radius.circular(topLeft ?? 0))),
          child: widget),
    );
  }
}
