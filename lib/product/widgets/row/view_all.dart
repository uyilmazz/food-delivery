import 'package:flutter/material.dart';

import '../../../core/extensions/context_extension.dart';

class NearYouViewAll extends StatelessWidget {
  final Function()? onPressed;

  const NearYouViewAll({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Near You',
            style: context.textTheme.headline6!
                .copyWith(fontWeight: FontWeight.w700)),
        GestureDetector(
          onTap: onPressed ?? () {},
          child: const Text('View All',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey)),
        )
      ],
    );
  }
}
