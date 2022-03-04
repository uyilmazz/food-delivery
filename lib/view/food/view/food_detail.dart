import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/app/app_constant.dart';
import '../../../core/constants/color/color_constant.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/extensions/string_extension.dart';
import '../../../product/widgets/appBar/appBar.dart';
import '../../../product/widgets/button/add_cart_button.dart';
import '../../../product/widgets/container/size_container.dart';
import '../../user/view_model/user_view_model_provider.dart';
import '../model/food.dart';
import '../service/food_serivce.dart';
import '../view_model/food_view_model.dart';

class FoodDetail extends StatelessWidget {
  final Food food;

  const FoodDetail({Key? key, required this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FoodViewModel viewmodel = FoodViewModel(FoodService(Dio()));
    final userModel = Provider.of<UserViewModelProvider>(context);

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
                flex: 20,
                child: buildStackImageAndSize(context, viewmodel),
              ),
              const Spacer(),
              Expanded(flex: 2, child: buildRowNameAndCookingTime(context)),
              const Spacer(),
              Expanded(flex: 4, child: buildFoodDescription(context)),
              const Spacer(),
              Expanded(
                  flex: 3,
                  child: buildPriceAndAddCartButton(context, userModel)),
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
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
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
        trailingIcon: const Icon(Icons.favorite_border));
  }

  Stack buildStackImageAndSize(BuildContext context, FoodViewModel viewmodel) {
    return Stack(
      children: [
        Image.asset('burger_large'.toPng,
            height: context.height * 0.7, fit: BoxFit.cover),
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
                spacing: context.width * 0.1,
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
                fontFamily: AppConstant.FONT_FAMILY,
                fontWeight: FontWeight.bold),
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: context.width * 0.033,
            children: [
              Icon(Icons.access_time_rounded, size: context.height * 0.025),
              Text(
                  '${food.cookingTime != null ? food.cookingTime!.round() : 0} Mins',
                  style: context.textTheme.subtitle2!
                      .copyWith(fontWeight: FontWeight.w600))
            ],
          )
        ],
      );

  Widget buildFoodDescription(BuildContext context) => SizedBox(
          child: Text(
        food.description.toString(),
        style: context.textTheme.headline6!.copyWith(
            fontFamily: AppConstant.FONT_FAMILY_LIGHT,
            fontWeight: FontWeight.normal,
            fontSize: 18),
      ));

  Widget buildPriceAndAddCartButton(
          BuildContext context, UserViewModelProvider userModel) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildWrapTotalPrice(context),
          ContainerAddCartButton(
            widget: buildAddCartInside(context),
            bottomRight: context.mediumValue,
            topRight: context.mediumValue,
            topLeft: context.mediumValue * 1.3,
            onTap: () async {
              userModel.addButtonChange();
              await userModel.addToCart(food.id!);
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Food added to cart successfully',
                      style: TextStyle(color: Colors.green)),
                  duration: Duration(milliseconds: 1500)));
              await Future.delayed(const Duration(seconds: 2));
              userModel.addButtonChange();
            },
          )
        ],
      );

  Wrap buildWrapTotalPrice(BuildContext context) {
    return Wrap(
      spacing: context.height * 0.015,
      direction: Axis.vertical,
      children: [
        Text('Total Price',
            style: context.textTheme.subtitle1!
                .copyWith(color: Colors.grey, fontWeight: FontWeight.w400)),
        Text('\$${food.price ?? 0}',
            style: context.textTheme.headline6!
                .copyWith(fontWeight: FontWeight.w800))
      ],
    );
  }

  Wrap buildAddCartInside(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: context.lowValue,
      children: [
        Text('Add to Cart',
            style: context.textTheme.subtitle1!
                .copyWith(color: Colors.white, fontWeight: FontWeight.w500)),
        const Icon(Icons.add_circle_outline_outlined, color: Colors.white)
      ],
    );
  }
}
