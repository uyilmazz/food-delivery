import 'package:dio/dio.dart';

import 'Iuser_service.dart';
import '../model/user.dart';

class UserService extends IUserService {
  UserService(Dio dio) : super(dio);

  final String _baseUrl = "http://10.0.2.2:3000";
  final String _userId = "6214c15f9ccae1c60c0eca14";

  @override
  Future<User> getUser() async {
    final response = await dio.get('$_baseUrl/users/$_userId');
    return User.fromJson(response.data);
  }

  @override
  Future<dynamic> getCart() async {
    final response = await dio.get('$_baseUrl/cart/$_userId');
    return response.data;
  }

  @override
  Future<void> addToCart(String foodId) async {
    await dio.post('$_baseUrl/cart', data: {'foodId': foodId});
  }

  @override
  Future<void> removeCartItem(String foodId) async {
    await dio.post('$_baseUrl/delete-cartItem', data: {'foodId': foodId});
  }
}
