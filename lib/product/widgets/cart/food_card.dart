import 'package:flutter/material.dart';

import '../../../core/constants/color/color_constant.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../view/food/model/food.dart';
import '../../../view/food/view/food_detail.dart';

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
              padding: EdgeInsets.symmetric(
                  horizontal: context.normalValue, vertical: 0),
              width: context.dynamicWidth(0.48),
              height: context.dynamicHeight(0.3),
              decoration: BoxDecoration(
                  color: ColorConstants.secondaryColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(context.normalValue)),
              child: Stack(
                children: [
                  buildCardImage(context),
                  Positioned(
                    bottom: context.height * 0.03,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        buildCartNameText(context),
                        const SizedBox(height: 3),
                        buildCartDescriptionText(context),
                        const SizedBox(height: 10),
                        buildPriceText(context),
                      ],
                    ),
                  )
                ],
              )),
        ),
        buildCardCircleButton(context)
      ],
    );
  }

  Text buildPriceText(context) => Text('\$${food.price ?? 0}',
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17));

  Text buildCartDescriptionText(BuildContext context) {
    return Text(
      food.description!.length > 20
          ? food.description!.substring(0, 20).toString()
          : food.description.toString(),
      style: context.textTheme.labelMedium!.copyWith(
        color: const Color(0xFF969696),
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Text buildCartNameText(BuildContext context) {
    return Text(food.name ?? '',
        style:
            context.textTheme.subtitle2!.copyWith(fontWeight: FontWeight.bold));
  }

  Image buildCardImage(BuildContext context) {
    return Image.asset(
      'assets/images/Pigeon Burger.png',
      fit: BoxFit.cover,
      height: context.height * 0.26,
    );
  }

  Positioned buildCardCircleButton(BuildContext context) {
    return Positioned(
        right: 10,
        bottom: context.height * 0.01,
        child: RawMaterialButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => FoodDetail(food: food)));
          },
          elevation: 0,
          fillColor: ColorConstants.primaryColor,
          child: const Icon(
            Icons.keyboard_arrow_right_outlined,
            color: Colors.white,
            size: 20.0,
          ),
          padding: EdgeInsets.all(context.lowValue),
          shape: const CircleBorder(),
          splashColor: Colors.transparent,
        ));
  }
}
