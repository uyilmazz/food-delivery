import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

import '../../../core/base/model/base_view_model.dart';
import '../service/food_serivce.dart';

part 'food_view_model.g.dart';

class FoodViewModel = _FoodViewModelBase with _$FoodViewModel;

abstract class _FoodViewModelBase with Store, BaseViewModel {
  @override
  BuildContext? context;

  final FoodService _foodService;
  _FoodViewModelBase(this._foodService);

  @override
  void setContext(contextValue) {
    context = contextValue;
  }

  @observable
  List<dynamic> categories = [];

  @observable
  bool isLoading = false;

  @observable
  List<dynamic> foods = [];

  @observable
  List<dynamic> restaurants = [];

  @observable
  int currentNavBarItem = 0;

  @observable
  int foodSizeIndex = 0;

  @override
  void init() {
    getCategories();
    getRestaurant();
    getFoods();
  }

  @action
  Future<void> getCategories() async {
    categories = await _foodService.getCategories() ?? [];
  }

  @action
  Future<void> getFoods() async {
    changeLoading();
    foods = await _foodService.getFoodItems();
    changeLoading();
  }

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  @action
  Future<void> getFoodByCategory(String categoryId) async {
    foods = await _foodService.getFoodsByCategory(categoryId);
  }

  @action
  Future<void> getRestaurant() async {
    restaurants = await _foodService.getRestaurants();
  }

  @action
  void changeNavbarItem(int value) {
    currentNavBarItem = value;
  }

  @action
  void changeFoodSizeIndex(int value) {
    foodSizeIndex = value;
  }
}
