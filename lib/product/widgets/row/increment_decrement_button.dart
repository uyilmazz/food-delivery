import 'package:flutter/material.dart';
import '../../../core/constants/app/app_constant.dart';
import '../../../core/constants/color/color_constant.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../view/user/view_model/user_view_model_provider.dart';

class IncrementDecrementRow extends StatelessWidget {
  final UserViewModelProvider userViewModel;
  final String foodId;
  final int quantity;
  const IncrementDecrementRow(
      {Key? key,
      this.quantity = 1,
      required this.foodId,
      required this.userViewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildCustomButton(context, Icons.remove,
            bottomLeft: true, topLeft: true, onTap: () async {
          await userViewModel.decrementCartItem(foodId);
        }),
        buildQuantityContainer(context),
        buildCustomButton(context, Icons.add, bottomRight: true, topRight: true,
            onTap: () async {
          await userViewModel.addToCart(foodId);
        }),
      ],
    );
  }

  Widget buildQuantityContainer(BuildContext context) => Container(
      width: context.width * 0.08,
      height: context.height * 0.06,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: ColorConstants.primaryColor, width: 2),
          bottom: BorderSide(color: ColorConstants.primaryColor, width: 2),
        ),
      ),
      child: Align(
          alignment: Alignment.center,
          child: Text(
            quantity.toString(),
            style: context.textTheme.subtitle1!.copyWith(
                fontWeight: FontWeight.normal,
                fontFamily: AppConstant.fontFamily),
          )));

  Widget buildCustomButton(BuildContext context, IconData icon,
          {bool topLeft = false,
          bool bottomLeft = false,
          bool bottomRight = false,
          bool topRight = false,
          Function()? onTap}) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
            width: context.width * 0.08,
            height: context.height * 0.06,
            decoration: BoxDecoration(
              border: Border.all(color: ColorConstants.primaryColor, width: 2),
              borderRadius: BorderRadius.only(
                bottomLeft: bottomLeft
                    ? Radius.circular(context.normalValue)
                    : const Radius.circular(0),
                bottomRight: bottomRight
                    ? Radius.circular(context.normalValue)
                    : const Radius.circular(0),
                topRight: topRight
                    ? Radius.circular(context.normalValue)
                    : const Radius.circular(0),
                topLeft: topLeft
                    ? Radius.circular(context.normalValue)
                    : const Radius.circular(0),
              ),
            ),
            child: Icon(icon, size: context.height * 0.025)),
      );
}
