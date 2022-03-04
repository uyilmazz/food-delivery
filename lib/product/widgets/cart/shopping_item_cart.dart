import 'package:flutter/material.dart';
import '../../../view/user/view_model/user_view_model_provider.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/extensions/string_extension.dart';
import '../row/increment_decrement_button.dart';

class ShoppingItemCart extends StatelessWidget {
  final UserViewModelProvider userViewModel;
  final Map<String, dynamic> item;
  const ShoppingItemCart(
      {Key? key, required this.userViewModel, required this.item})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: context.width * 0.01),
      margin: EdgeInsets.only(bottom: context.normalValue),
      height: context.height * 0.1,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: buildDeleteIcon(context)),
          SizedBox(width: context.width * 0.03),
          Expanded(
            flex: 2,
            child: SizedBox(
                height: context.height * 0.08,
                child: Image.asset('shopping_cart_image'.toPng,
                    fit: BoxFit.cover)),
          ),
          SizedBox(width: context.width * 0.02),
          Expanded(flex: 4, child: buildWrapNameAndPrice(context)),
          IncrementDecrementRow(
            quantity: item['quantity'],
            foodId: item['food']['_id'],
            userViewModel: userViewModel,
          ),
        ],
      ),
    );
  }

  IconButton buildDeleteIcon(BuildContext context) {
    return IconButton(
        onPressed: () async {
          await userViewModel.removeCartItem(item['food']['_id']);
        },
        icon: Icon(
          Icons.disabled_by_default_outlined,
          size: context.height * 0.035,
          color: Colors.black87.withOpacity(0.7),
        ));
  }

  Wrap buildWrapNameAndPrice(BuildContext context) {
    return Wrap(
      spacing: 8,
      direction: Axis.vertical,
      children: [
        Text(
          item['food']['name'],
          style: context.textTheme.subtitle2!
              .copyWith(fontSize: 15, fontWeight: FontWeight.w700),
        ),
        Text('\$ ' + item['food']['price'].toStringAsFixed(2).toString(),
            style: context.textTheme.subtitle1!
                .copyWith(fontSize: 14, fontWeight: FontWeight.w400))
      ],
    );
  }
}
