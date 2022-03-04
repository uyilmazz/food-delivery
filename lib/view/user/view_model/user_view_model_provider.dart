import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../../core/base/model/base_view_model.dart';
import '../service/user_service.dart';

import '../model/user.dart';
import '../service/Iuser_service.dart';

class UserViewModelProvider extends ChangeNotifier with BaseViewModel {
  final IUserService _userService = UserService(Dio());

  User? user;

  List<dynamic> userCart = [];
  bool isVerified = false;
  bool isLoading = true;
  double totalPrice = 0;
  bool addButtonActive = true;

  @override
  void init() {}

  void addButtonChange() {
    addButtonActive = !addButtonActive;
    notifyListeners();
  }

  void changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  Future<void> getCart() async {
    var _cart = await _userService.getCart(user!.id!);
    userCart = _cart;
    calculateTotalPrice();
    notifyListeners();
  }

  Future<void> addToCart(String foodId) async {
    await _userService.addToCart(foodId, user!.id!);
    await getCart();
    calculateTotalPrice();
    notifyListeners();
  }

  Future<void> decrementCartItem(String foodId) async {
    await _userService.decrementCartItem(foodId, user!.id!);
    await getCart();
    calculateTotalPrice();
    notifyListeners();
  }

  Future<void> removeCartItem(String foodId) async {
    await _userService.removeCartItem(foodId, user!.id!);
    await getCart();
    calculateTotalPrice();
    notifyListeners();
  }

  Future<void> clearCart() async {
    await _userService.clearCart(user!.id!);
    await getCart();
    calculateTotalPrice();
    notifyListeners();
  }

  void calculateTotalPrice() {
    double _totalPrice = 0;
    for (var item in userCart) {
      _totalPrice += item['food']['price'] * item['quantity'];
    }
    totalPrice = _totalPrice;
    notifyListeners();
  }

  //onboardViewModel
  Future<bool> registerUser(String name, String email, String password) async {
    final response = await _userService.registerUser(name, email, password);
    if (response != null) {
      user = response;
      getCart();
      notifyListeners();
      return true;
    }
    notifyListeners();
    return false;
  }

  Future<bool> loginUser(String email, String password) async {
    final response = await _userService.loginUser(email, password);
    if (response != null) {
      user = response;
      getCart();
      notifyListeners();
      return true;
    }
    notifyListeners();
    return false;
  }

  Future<void> verifyToken() async {
    User? response = await _userService.verifyToken();
    if (response != null) {
      user = response;
      getCart();
      isVerified = true;
    } else {
      isVerified = false;
    }
    await Future.delayed(const Duration(seconds: 3));
    changeLoading();
    notifyListeners();
  }

  Future<void> logOut() async {
    await _userService.logOut();
  }
}
