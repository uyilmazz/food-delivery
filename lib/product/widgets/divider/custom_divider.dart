import 'package:flutter/material.dart';

import '../../../core/extensions/context_extension.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
        color: const Color(0xFFD8D8D8),
        thickness: 1,
        indent: context.normalValue,
        endIndent: context.normalValue);
  }
}
