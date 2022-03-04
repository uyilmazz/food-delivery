import 'package:flutter/material.dart';

import '../../../core/extensions/context_extension.dart';

class ProfileOptionRow extends StatelessWidget {
  final String text;
  final Function()? onTap;
  const ProfileOptionRow({Key? key, required this.text, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: context.normalValue),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text,
              style: context.textTheme.labelMedium!.copyWith(
                color: Colors.black87.withOpacity(0.7),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              )),
          IconButton(
              splashRadius: 0.1,
              color: const Color(0xFF9B9B9B),
              onPressed: onTap ?? () {},
              icon: const Icon(Icons.keyboard_arrow_right_sharp))
        ],
      ),
    );
  }
}
