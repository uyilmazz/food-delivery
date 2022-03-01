import 'package:flutter/material.dart';

import '../../../core/extensions/context_extension.dart';

class CustomSizeContainer extends StatelessWidget {
  final Color textColor;
  final Color backgroundColor;
  final String foodText;

  const CustomSizeContainer(
      {Key? key,
      required this.textColor,
      required this.backgroundColor,
      required this.foodText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.normalValue * 1.1),
      child: Text(foodText,
          style: context.textTheme.subtitle1!
              .copyWith(color: textColor, fontWeight: FontWeight.w500)),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.shade300,
          offset: const Offset(0.0, 0.0), //(x,y)
          blurRadius: 1.0,
        ),
      ], color: backgroundColor, shape: BoxShape.circle),
    );
  }
}
