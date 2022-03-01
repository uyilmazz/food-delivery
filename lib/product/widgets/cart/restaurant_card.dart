import 'package:flutter/material.dart';

import '../../../core/extensions/context_extension.dart';
import '../../../core/extensions/string_extension.dart';
import '../../../view/food/model/restaurant.dart';

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantCard({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.lowValue),
      margin:
          EdgeInsets.only(right: context.normalValue, top: context.normalValue),
      width: context.width * 0.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(context.lowValue),
        color: const Color(0xFFF5F9FA),
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: context.lowValue),
            padding: EdgeInsets.all(context.normalValue * 0.8),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(context.normalValue * 0.8)),
            child: Image.asset('pizza_hut'.toPng),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(restaurant.name.toString(),
                  style: context.textTheme.subtitle1!
                      .copyWith(fontWeight: FontWeight.bold)),
              Text(restaurant.address.toString(),
                  style: context.textTheme.labelMedium!
                      .copyWith(fontSize: 11, color: const Color(0xFF969696))),
              Text(restaurant.telNo.toString(),
                  style: context.textTheme.labelMedium!
                      .copyWith(fontSize: 10, fontWeight: FontWeight.w600)),
            ],
          )
        ],
      ),
    );
  }
}
