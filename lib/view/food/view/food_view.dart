import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../core/base/view/base_widget.dart';
import '../../../core/constants/color_constant.dart';
import '../../../core/constants/image_constant.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/extensions/string_extension.dart';
import '../../../product/widgets/food_cart.dart';
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
        onPageBuilder: (context, viewmodel) => Scaffold(
              backgroundColor: Colors.white,
              resizeToAvoidBottomInset: false,
              body: Observer(
                  builder: (context) => DefaultTabController(
                        length: viewmodel.categories.length,
                        child: SafeArea(
                            child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: context.normalValue),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Spacer(),
                              Expanded(flex: 2, child: buildAppbar(context)),
                              buildSearchTextField(context),
                              const Spacer(),
                              Expanded(flex: 2, child: buildTabBar(viewmodel)),
                              const Spacer(),
                              Expanded(
                                  flex: 10,
                                  child: buildFoodListView(context, viewmodel)),
                              const Spacer(),
                              Expanded(
                                  flex: 8,
                                  child: Container(color: context.randomColor)),
                            ],
                          ),
                        )),
                      )),
            ));
  }

  Widget buildFoodListView(BuildContext context, FoodViewModel foodViewModel) =>
      Observer(
          builder: (context) => ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: foodViewModel.foods.length,
              itemBuilder: (context, index) {
                return FoodCart(food: foodViewModel.foods[index]);
              }));

  Widget buildTabBar(FoodViewModel viewModel) {
    return TabBar(
      onTap: (tabIndex) {
        viewModel.getFoodByCategory(viewModel.categories[tabIndex].id);
      },
      isScrollable: true,
      indicatorWeight: 1,
      indicatorSize: TabBarIndicatorSize.label,
      labelColor: Colors.black,
      tabs: viewModel.categories
          .map((category) => Tab(text: category.name.toString().toCapitalize))
          .toList(),
    );
  }

  Row buildAppbar(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              buildAppbarLeadingImage(),
              const SizedBox(width: 10),
              buildAppBarTitleText(context)
            ],
          ),
          const Icon(Icons.card_travel)
        ],
      );

  Wrap buildAppBarTitleText(BuildContext context) {
    return Wrap(
      spacing: 5,
      direction: Axis.vertical,
      children: [
        Text(
          'Good Morning',
          style: context.textTheme.labelMedium!.copyWith(
              color: Colors.black,
              fontFamily: 'ProductSansLight',
              fontSize: 13),
        ),
        Text('Ünal Yılmaz',
            style: context.textTheme.labelLarge!.copyWith(
                fontFamily: 'ProductSans',
                fontSize: 18,
                fontWeight: FontWeight.normal)),
      ],
    );
  }

  Image buildAppbarLeadingImage() =>
      Image.asset(ImageConstant.instance.toPng('hand_sign'));

  TextField buildSearchTextField(BuildContext context) => TextField(
        decoration: InputDecoration(
            hintText: 'Search Food, Restaurant, Drinks',
            hintStyle: const TextStyle(
                fontSize: 10, color: Colors.grey, fontWeight: FontWeight.w500),
            fillColor: ColorConstants.secondaryColor,
            filled: true,
            prefixIcon: const Icon(Icons.search),
            suffixIcon:
                Image.asset(ImageConstant.instance.toPng('search_fill_icon')),
            contentPadding: EdgeInsets.zero,
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius:
                    BorderRadius.circular(context.dynamicWidth(0.02)))),
      );
}
