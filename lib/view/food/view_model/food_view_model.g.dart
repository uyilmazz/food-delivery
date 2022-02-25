// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FoodViewModel on _FoodViewModelBase, Store {
  final _$categoriesAtom = Atom(name: '_FoodViewModelBase.categories');

  @override
  List<dynamic> get categories {
    _$categoriesAtom.reportRead();
    return super.categories;
  }

  @override
  set categories(List<dynamic> value) {
    _$categoriesAtom.reportWrite(value, super.categories, () {
      super.categories = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_FoodViewModelBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$foodsAtom = Atom(name: '_FoodViewModelBase.foods');

  @override
  List<dynamic> get foods {
    _$foodsAtom.reportRead();
    return super.foods;
  }

  @override
  set foods(List<dynamic> value) {
    _$foodsAtom.reportWrite(value, super.foods, () {
      super.foods = value;
    });
  }

  final _$restaurantsAtom = Atom(name: '_FoodViewModelBase.restaurants');

  @override
  List<dynamic> get restaurants {
    _$restaurantsAtom.reportRead();
    return super.restaurants;
  }

  @override
  set restaurants(List<dynamic> value) {
    _$restaurantsAtom.reportWrite(value, super.restaurants, () {
      super.restaurants = value;
    });
  }

  final _$currentNavBarItemAtom =
      Atom(name: '_FoodViewModelBase.currentNavBarItem');

  @override
  int get currentNavBarItem {
    _$currentNavBarItemAtom.reportRead();
    return super.currentNavBarItem;
  }

  @override
  set currentNavBarItem(int value) {
    _$currentNavBarItemAtom.reportWrite(value, super.currentNavBarItem, () {
      super.currentNavBarItem = value;
    });
  }

  final _$foodSizeIndexAtom = Atom(name: '_FoodViewModelBase.foodSizeIndex');

  @override
  int get foodSizeIndex {
    _$foodSizeIndexAtom.reportRead();
    return super.foodSizeIndex;
  }

  @override
  set foodSizeIndex(int value) {
    _$foodSizeIndexAtom.reportWrite(value, super.foodSizeIndex, () {
      super.foodSizeIndex = value;
    });
  }

  final _$getCategoriesAsyncAction =
      AsyncAction('_FoodViewModelBase.getCategories');

  @override
  Future<void> getCategories() {
    return _$getCategoriesAsyncAction.run(() => super.getCategories());
  }

  final _$getFoodsAsyncAction = AsyncAction('_FoodViewModelBase.getFoods');

  @override
  Future<void> getFoods() {
    return _$getFoodsAsyncAction.run(() => super.getFoods());
  }

  final _$getFoodByCategoryAsyncAction =
      AsyncAction('_FoodViewModelBase.getFoodByCategory');

  @override
  Future<void> getFoodByCategory(String categoryId) {
    return _$getFoodByCategoryAsyncAction
        .run(() => super.getFoodByCategory(categoryId));
  }

  final _$getRestaurantAsyncAction =
      AsyncAction('_FoodViewModelBase.getRestaurant');

  @override
  Future<void> getRestaurant() {
    return _$getRestaurantAsyncAction.run(() => super.getRestaurant());
  }

  final _$_FoodViewModelBaseActionController =
      ActionController(name: '_FoodViewModelBase');

  @override
  void changeLoading() {
    final _$actionInfo = _$_FoodViewModelBaseActionController.startAction(
        name: '_FoodViewModelBase.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$_FoodViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeNavbarItem(int value) {
    final _$actionInfo = _$_FoodViewModelBaseActionController.startAction(
        name: '_FoodViewModelBase.changeNavbarItem');
    try {
      return super.changeNavbarItem(value);
    } finally {
      _$_FoodViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeFoodSizeIndex(int value) {
    final _$actionInfo = _$_FoodViewModelBaseActionController.startAction(
        name: '_FoodViewModelBase.changeFoodSizeIndex');
    try {
      return super.changeFoodSizeIndex(value);
    } finally {
      _$_FoodViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
categories: ${categories},
isLoading: ${isLoading},
foods: ${foods},
restaurants: ${restaurants},
currentNavBarItem: ${currentNavBarItem},
foodSizeIndex: ${foodSizeIndex}
    ''';
  }
}
