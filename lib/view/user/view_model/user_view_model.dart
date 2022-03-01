import 'package:flutter/material.dart';
import '../../../core/base/model/base_view_model.dart';
import '../service/Iuser_service.dart';
import 'package:mobx/mobx.dart';

import '../model/user.dart';
part 'user_view_model.g.dart';

class UserViewModel = _UserViewModelBase with _$UserViewModel;

abstract class _UserViewModelBase with Store, BaseViewModel {
  @override
  BuildContext? context;

  final IUserService _userService;
  _UserViewModelBase(this._userService);

  @observable
  User? user;

  @observable
  List<dynamic> userCart = [];

  @observable
  bool isLoading = false;

  @observable
  double totalPrice = 0;

  @override
  void setContext(BuildContext contextValue) {
    context = contextValue;
  }

  @override
  void init() async {
    changeLoading();
    await getUser();
    await getCart();
    changeLoading();
  }

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  @action
  Future<void> getUser() async {
    final _user = await _userService.getUser();
    user = _user;
  }

  @action
  Future<void> getCart() async {
    final _cart = await _userService.getCart();
    userCart = _cart;
    calculateTotalPrice();
  }

  @action
  Future<void> addToCart(String foodId) async {
    await _userService.addToCart(foodId);
    await getCart();
    calculateTotalPrice();
  }

  @action
  Future<void> removeCartItem(String foodId) async {
    await _userService.removeCartItem(foodId);
    await getCart();
    calculateTotalPrice();
  }

  @action
  void calculateTotalPrice() {
    double _totalPrice = 0;
    for (var item in userCart) {
      _totalPrice += item['food']['price'] * item['quantity'];
    }
    totalPrice = _totalPrice;
  }
}
