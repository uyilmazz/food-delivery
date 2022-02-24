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
  String toString() {
    return '''
categories: ${categories},
isLoading: ${isLoading},
foods: ${foods}
    ''';
  }
}
