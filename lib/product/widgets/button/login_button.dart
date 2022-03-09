import 'package:flutter/material.dart';
import '../../../core/constants/color/color_constant.dart';
import '../../../core/extensions/context_extension.dart';

class CustomLoginButton extends StatelessWidget {
  final String text;
  final Function()? onTap;

  const CustomLoginButton({Key? key, required this.text, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(context.mediumValue)),
            textStyle: context.textTheme.headline6!
                .copyWith(color: Colors.white, fontWeight: FontWeight.w800),
            primary: ColorConstants.primaryColor,
            padding: EdgeInsets.symmetric(
                horizontal: context.mediumValue * 2,
                vertical: context.normalValue)),
        onPressed: onTap ?? () {},
        child: Text(text));
  }
}
