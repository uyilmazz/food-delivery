import 'package:dio/dio.dart';
import '../model/user.dart';

abstract class IUserService {
  final Dio dio;
  IUserService(this.dio);

  Future<User> getUser();
  Future<dynamic> getCart();
  Future<void> addToCart(String foodId);
  Future<void> removeCartItem(String foodId);
}
