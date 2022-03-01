// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserViewModel on _UserViewModelBase, Store {
  final _$userAtom = Atom(name: '_UserViewModelBase.user');

  @override
  User? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$userCartAtom = Atom(name: '_UserViewModelBase.userCart');

  @override
  List<dynamic> get userCart {
    _$userCartAtom.reportRead();
    return super.userCart;
  }

  @override
  set userCart(List<dynamic> value) {
    _$userCartAtom.reportWrite(value, super.userCart, () {
      super.userCart = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_UserViewModelBase.isLoading');

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

  final _$totalPriceAtom = Atom(name: '_UserViewModelBase.totalPrice');

  @override
  double get totalPrice {
    _$totalPriceAtom.reportRead();
    return super.totalPrice;
  }

  @override
  set totalPrice(double value) {
    _$totalPriceAtom.reportWrite(value, super.totalPrice, () {
      super.totalPrice = value;
    });
  }

  final _$getUserAsyncAction = AsyncAction('_UserViewModelBase.getUser');

  @override
  Future<void> getUser() {
    return _$getUserAsyncAction.run(() => super.getUser());
  }

  final _$getCartAsyncAction = AsyncAction('_UserViewModelBase.getCart');

  @override
  Future<void> getCart() {
    return _$getCartAsyncAction.run(() => super.getCart());
  }

  final _$addToCartAsyncAction = AsyncAction('_UserViewModelBase.addToCart');

  @override
  Future<void> addToCart(String foodId) {
    return _$addToCartAsyncAction.run(() => super.addToCart(foodId));
  }

  final _$removeCartItemAsyncAction =
      AsyncAction('_UserViewModelBase.removeCartItem');

  @override
  Future<void> removeCartItem(String foodId) {
    return _$removeCartItemAsyncAction.run(() => super.removeCartItem(foodId));
  }

  final _$_UserViewModelBaseActionController =
      ActionController(name: '_UserViewModelBase');

  @override
  void changeLoading() {
    final _$actionInfo = _$_UserViewModelBaseActionController.startAction(
        name: '_UserViewModelBase.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$_UserViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void calculateTotalPrice() {
    final _$actionInfo = _$_UserViewModelBaseActionController.startAction(
        name: '_UserViewModelBase.calculateTotalPrice');
    try {
      return super.calculateTotalPrice();
    } finally {
      _$_UserViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
userCart: ${userCart},
isLoading: ${isLoading},
totalPrice: ${totalPrice}
    ''';
  }
}
