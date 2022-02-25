import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:food_delivery/core/constants/app_constant.dart';
import 'package:food_delivery/core/constants/color_constant.dart';
import 'package:food_delivery/core/extensions/context_extension.dart';
import 'package:food_delivery/core/extensions/string_extension.dart';
import 'package:food_delivery/product/widgets/appBar/appBar.dart';
import 'package:food_delivery/product/widgets/container/size_container.dart';
import 'package:food_delivery/view/food/service/food_serivce.dart';
import 'package:food_delivery/view/food/view_model/food_view_model.dart';

import '../model/food.dart';

class FoodDetail extends StatelessWidget {
  final Food food;

  const FoodDetail({Key? key, required this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FoodViewModel viewmodel = FoodViewModel(FoodService(Dio()));

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: context.normalValue,
              vertical: context.normalValue * 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(flex: 2, child: buildAppbar(context)),
              Expanded(
                flex: 10,
                child: buildStackImageAndSize(context, viewmodel),
              ),
              const Spacer(),
              Expanded(flex: 1, child: buildRowNameAndCookingTime(context)),
              const Spacer(),
              Expanded(flex: 4, child: buildFoodDescription(context)),
              Expanded(flex: 3, child: buildPriceAndAddCartButton(context)),
            ],
          ),
        ),
      ),
    );
  }

  CustomAppBar buildAppbar(BuildContext context) {
    return CustomAppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
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
            child: const Icon(Icons.arrow_back_ios_new_sharp),
          ),
        ),
        trailingIcon: Icons.favorite_border);
  }

  Stack buildStackImageAndSize(BuildContext context, FoodViewModel viewmodel) {
    return Stack(
      children: [
        Image.asset('burger_large'.toPng, fit: BoxFit.cover),
        Align(
          alignment: Alignment.bottomCenter,
          child: buildFoodSize(context, viewmodel),
        )
      ],
    );
  }

  Widget buildFoodSize(BuildContext context, FoodViewModel viewmodel) =>
      Observer(
          builder: (context) => Wrap(
                spacing: 25,
                children: List.generate(
                    food.size!.length,
                    (index) => GestureDetector(
                        onTap: () {
                          viewmodel.changeFoodSizeIndex(index);
                        },
                        child: CustomSizeContainer(
                            textColor: viewmodel.foodSizeIndex == index
                                ? Colors.white
                                : Colors.black,
                            backgroundColor: viewmodel.foodSizeIndex == index
                                ? ColorConstants.primaryColor
                                : Colors.white,
                            foodText: food.size![index].toString()))),
              ));

  Widget buildRowNameAndCookingTime(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            food.name.toString().toCapitalize,
            style: context.textTheme.headline6!.copyWith(
                fontFamily: AppConstant.FONT_FAMILY_LIGHT,
                fontWeight: FontWeight.w700),
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: context.width * 0.03,
            children: [
              Icon(Icons.access_time_rounded, size: context.height * 0.025),
              Text(
                  '${food.cookingTime != null ? food.cookingTime!.round() : 0} Mins',
                  style: context.textTheme.labelMedium!)
            ],
          )
        ],
      );

  Widget buildFoodDescription(BuildContext context) =>
      Container(color: Colors.red, child: Text(food.description.toString()));

  Widget buildPriceAndAddCartButton(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Wrap(
            spacing: context.height * 0.01,
            direction: Axis.vertical,
            children: [
              Text('Total Price',
                  style: context.textTheme.subtitle2!.copyWith(
                      color: Colors.grey, fontWeight: FontWeight.w400)),
              Text('\$${food.price}',
                  style: context.textTheme.subtitle2!
                      .copyWith(fontWeight: FontWeight.w500))
            ],
          ),
          ElevatedButton(onPressed: () {}, child: Text('Add To Cart'))
        ],
      );
}
