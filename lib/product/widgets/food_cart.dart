import 'package:flutter/material.dart';
import '../../core/extensions/context_extension.dart';

import '../../core/constants/color_constant.dart';
import '../../view/food/model/food.dart';

class FoodCart extends StatelessWidget {
  final Food food;

  const FoodCart({Key? key, required this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(bottom: context.normalValue * 1.5),
          color: Colors.transparent,
          child: Container(
            margin: EdgeInsets.only(right: context.normalValue),
            padding: EdgeInsets.symmetric(horizontal: context.normalValue),
            width: context.dynamicWidth(0.45),
            decoration: BoxDecoration(
                color: ColorConstants.secondaryColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(context.normalValue)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildCardImage(context),
                buildCartNameText(context),
                buildCartDescriptionText(context),
                const SizedBox(height: 10),
                buildPriceText(),
              ],
            ),
          ),
        ),
        buildCardCircleButton(context)
      ],
    );
  }

  Text buildPriceText() => Text('\$${food.price ?? 0}');

  Text buildCartDescriptionText(BuildContext context) {
    return Text(
      food.description!.length > 20
          ? food.description!.substring(0, 20).toString()
          : food.description.toString(),
      style: context.textTheme.labelMedium!.copyWith(
          color: const Color(0xFF969696),
          fontFamily: 'ProductSansLight',
          fontWeight: FontWeight.w500),
    );
  }

  Text buildCartNameText(BuildContext context) {
    return Text(
      '${food.name}',
      style: context.textTheme.labelLarge!
          .copyWith(fontFamily: 'ProductSans', fontWeight: FontWeight.w100),
    );
  }

  Image buildCardImage(BuildContext context) {
    return Image.asset(
      'assets/images/Pigeon Burger.png',
      fit: BoxFit.cover,
      height: context.height * 0.22,
    );
  }

  Positioned buildCardCircleButton(BuildContext context) {
    return Positioned(
        right: 5,
        bottom: 0,
        child: RawMaterialButton(
          onPressed: () {},
          elevation: 0,
          fillColor: ColorConstants.primaryColor,
          child: const Icon(
            Icons.pause,
            color: Colors.white,
            size: 15.0,
          ),
          padding: EdgeInsets.all(context.lowValue),
          shape: const CircleBorder(),
        ));
  }
}
