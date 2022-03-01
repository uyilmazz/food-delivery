import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../core/base/view/base_widget.dart';
import '../../../core/constants/app_constant.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../product/widgets/appBar/appBar.dart';
import '../../../product/widgets/button/container_add_cart_button.dart';
import '../../../product/widgets/cart/shopping_item_cart.dart';
import '../../user/service/user_service.dart';
import '../../user/view_model/user_view_model.dart';

class ShoppingPage extends StatelessWidget {
  const ShoppingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<UserViewModel>(
      viewModel: UserViewModel(UserService(Dio())),
      onModelReady: (userModel) {
        userModel.setContext(context);
        userModel.init();
      },
      onPageBuilder: (context, userModel) {
        return Observer(builder: (context) {
          return !userModel.isLoading
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(flex: 4, child: buildAppbar(context)),
                    const Spacer(),
                    Expanded(
                        flex: 20, child: buildCartListView(context, userModel)),
                    const Spacer(),
                    Expanded(
                        flex: 4,
                        child: buildRowTotalAndBuyButton(context, userModel)),
                  ],
                )
              : const Center(child: CircularProgressIndicator());
        });
      },
    );
  }

  Widget buildAppbar(BuildContext context) => CustomAppBar(
        leading: Text(
          'My Cart',
          style: context.textTheme.headline6!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        trailingIcon: Icons.shopping_cart_outlined,
        trailingOnPressed: () {},
      );

  Widget buildCartListView(BuildContext context, UserViewModel userModel) =>
      Observer(
          builder: (context) => userModel.userCart.isNotEmpty
              ? ListView.builder(
                  itemCount: userModel.userCart.length,
                  itemBuilder: (context, index) {
                    return ShoppingItemCart(
                        userViewModel: userModel,
                        item: userModel.userCart[index]);
                  })
              : Center(
                  child: Text(
                  'You do not have an item in your cart',
                  style: context.textTheme.headline5!
                      .copyWith(fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                )));

  Widget buildRowTotalAndBuyButton(
          BuildContext context, UserViewModel userModel) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildTotalPrice(context, userModel),
          ContainerAddCartButton(
              topLeft: context.normalValue,
              topRight: context.mediumValue,
              bottomRight: context.mediumValue,
              widget: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: context.lowValue,
                children: [
                  const Icon(Icons.shopping_cart_outlined, color: Colors.white),
                  Text('Buy Now',
                      style: context.textTheme.subtitle1!.copyWith(
                          color: Colors.white, fontWeight: FontWeight.w500)),
                ],
              ))
        ],
      );

  Widget buildTotalPrice(BuildContext context, UserViewModel userModel) =>
      Observer(
          builder: (context) => Wrap(
                direction: Axis.vertical,
                spacing: 10,
                children: [
                  Text(
                    '${userModel.userCart.length} item selected',
                    style: context.textTheme.subtitle1!.copyWith(
                        fontFamily: AppConstant.FONT_FAMILY,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey.shade500),
                  ),
                  Text(
                    '\$ ${userModel.totalPrice.toStringAsFixed(2)}',
                    style: context.textTheme.subtitle2!.copyWith(
                        fontFamily: AppConstant.FONT_FAMILY_LIGHT,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ));
}
