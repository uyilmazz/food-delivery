import 'package:flutter/material.dart';
import '../../../core/extensions/context_extension.dart';

class CustomAppBar extends StatelessWidget {
  Widget? leading;
  Widget? centerWidget;
  IconData? trailingIcon;
  Function()? trailingOnPressed;
  CustomAppBar({
    Key? key,
    this.leading,
    this.centerWidget,
    this.trailingIcon,
    this.trailingOnPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        leading ?? const SizedBox(),
        centerWidget ?? const SizedBox(),
        GestureDetector(
          onTap: trailingOnPressed ?? () {},
          child: Container(
            padding: EdgeInsets.all(context.lowValue),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 0.0), //(x,y)
                    blurRadius: 1.0,
                  ),
                ],
                borderRadius: BorderRadius.circular(context.lowValue)),
            child: Icon(trailingIcon),
          ),
        ),
      ],
    );
  }
}
