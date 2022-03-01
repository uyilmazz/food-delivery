import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'shopping_page.dart';
import 'profile_page.dart';
import '../../../core/constants/app_constant.dart';
import '../../../product/widgets/appBar/appBar.dart';
import '../../../product/widgets/cart/restaurant_card.dart';
import '../../../product/widgets/row/view_all.dart';
import '../../../core/base/view/base_widget.dart';
import '../../../core/constants/color_constant.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/extensions/string_extension.dart';
import '../../../product/widgets/cart/food_card.dart';
import '../service/food_serivce.dart';
import '../view_model/food_view_model.dart';

class FoodView extends StatelessWidget {
  const FoodView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<FoodViewModel>(
        viewModel: FoodViewModel(FoodService(Dio())),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (context, viewmodel) => SafeArea(
              child: Scaffold(
                bottomNavigationBar: _buildFloatingBar(context, viewmodel),
                backgroundColor: Colors.white,
                resizeToAvoidBottomInset: false,
                body: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: context.normalValue,
                        vertical: context.normalValue * 2),
                    child: setPage(viewmodel)),
              ),
            ));
  }

  Widget setPage(FoodViewModel viewmodel) {
    return Observer(builder: (context) {
      return viewmodel.currentNavBarItem == 0
          ? buildFoodView(viewmodel)
          : viewmodel.currentNavBarItem == 1
              ? const SizedBox()
              : viewmodel.currentNavBarItem == 2
                  ? const ShoppingPage()
                  : viewmodel.currentNavBarItem == 3
                      ? const ProfilePage()
                      : const SizedBox();
    });
  }

  Observer buildFoodView(FoodViewModel viewmodel) {
    return Observer(
        builder: (context) => DefaultTabController(
              length: viewmodel.categories.length,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 4, child: buildAppbar(context)),
                  const Spacer(),
                  Expanded(flex: 3, child: buildSearchTextField(context)),
                  const Spacer(),
                  Expanded(flex: 2, child: buildTabBar(context, viewmodel)),
                  const Spacer(flex: 2),
                  Expanded(
                      flex: 16, child: buildFoodListView(context, viewmodel)),
                  const Spacer(),
                  Expanded(flex: 7, child: buildNearYou(context, viewmodel)),
                  // const Spacer(),
                ],
              ),
            ));
  }

  Widget buildNearYou(BuildContext context, FoodViewModel viewModel) => Column(
        children: [
          NearYouViewAll(onPressed: () {}),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: viewModel.restaurants.length,
                itemBuilder: (context, index) =>
                    RestaurantCard(restaurant: viewModel.restaurants[index])),
          )
        ],
      );

  Widget buildFoodListView(BuildContext context, FoodViewModel foodViewModel) =>
      Observer(
          builder: (context) => ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: foodViewModel.foods.length,
              itemBuilder: (context, index) {
                return FoodCart(food: foodViewModel.foods[index]);
              }));

  Widget buildTabBar(BuildContext context, FoodViewModel viewModel) {
    return TabBar(
      indicator: UnderlineTabIndicator(
        borderSide:
            const BorderSide(width: 2, color: ColorConstants.primaryColor),
        insets:
            EdgeInsets.symmetric(horizontal: context.width * 0.08, vertical: 3),
      ),
      unselectedLabelStyle: context.textTheme.headline6!
          .copyWith(fontSize: 15, fontWeight: FontWeight.w400),
      labelStyle:
          context.textTheme.headline6!.copyWith(fontWeight: FontWeight.w500),
      onTap: (tabIndex) {
        viewModel.getFoodByCategory(viewModel.categories[tabIndex].id);
      },
      isScrollable: true,
      indicatorWeight: 3,
      unselectedLabelColor: Colors.black45,
      labelColor: Colors.black87,
      tabs: viewModel.categories
          .map((category) => Tab(text: category.name.toString().toCapitalize))
          .toList(),
    );
  }

  Widget buildAppbar(BuildContext context) => CustomAppBar(
        leading: buildAppBarLeading(context),
        trailingIcon: Icons.card_travel,
        trailingOnPressed: () {},
      );

  Widget buildAppBarLeading(context) {
    return Row(
      children: [
        buildAppbarLeadingImage,
        const SizedBox(width: 10),
        buildAppBarTitleText(context)
      ],
    );
  }

  Wrap buildAppBarTitleText(BuildContext context) {
    return Wrap(
      spacing: 5,
      direction: Axis.vertical,
      children: [
        Text(
          'Good Morning',
          style: context.textTheme.subtitle2!.copyWith(
              color: Colors.black,
              fontFamily: AppConstant.FONT_FAMILY_LIGHT,
              fontWeight: FontWeight.w500,
              fontSize: 14),
        ),
        Text('Ünal Yılmaz',
            style: context.textTheme.labelLarge!.copyWith(
                // fontFamily: 'ProductSans',
                fontSize: 20,
                fontWeight: FontWeight.w600)),
      ],
    );
  }

  Image get buildAppbarLeadingImage => Image.asset('hand_sign'.toPng);

  TextField buildSearchTextField(BuildContext context) => TextField(
        decoration: InputDecoration(
            hintText: 'Search Food, Restaurant, Drinks',
            hintStyle: const TextStyle(
                fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w400),
            fillColor: ColorConstants.secondaryColor,
            filled: true,
            prefixIcon: const Icon(Icons.search),
            suffixIcon: Image.asset('search_fill_icon'.toPng),
            contentPadding:
                EdgeInsets.symmetric(vertical: context.height * 0.03),
            border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xFFE8ECED),
                ),
                borderRadius:
                    BorderRadius.circular(context.dynamicWidth(0.02))),
            enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color(0xFFE8ECED), width: 2),
                borderRadius:
                    BorderRadius.circular(context.dynamicWidth(0.02)))),
      );

  Widget _buildFloatingBar(BuildContext context, FoodViewModel viewModel) =>
      Observer(builder: (context) {
        return Container(
          height: context.height * 0.11,
          padding: EdgeInsets.only(bottom: context.normalValue * 1),
          child: CustomNavigationBar(
            elevation: 0,
            strokeColor: Colors.transparent,
            iconSize: context.height * 0.035,
            selectedColor: Colors.white,
            unSelectedColor: Colors.white.withOpacity(0.5),
            backgroundColor: ColorConstants.primaryColor,
            borderRadius: Radius.circular(context.mediumValue),
            items: [
              CustomNavigationBarItem(
                icon: const Icon(Icons.home),
              ),
              CustomNavigationBarItem(
                icon: const Icon(Icons.account_balance_wallet_outlined),
              ),
              CustomNavigationBarItem(
                icon: const Icon(Icons.card_travel),
              ),
              CustomNavigationBarItem(
                icon: const Icon(Icons.person_outline),
              ),
            ],
            currentIndex: viewModel.currentNavBarItem,
            onTap: (index) {
              viewModel.changeNavbarItem(index);
            },
            isFloating: true,
          ),
        );
      });
}
