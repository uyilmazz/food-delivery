import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../model/user.dart';
import 'Iuser_service.dart';

class UserService extends IUserService {
  UserService(Dio dio) : super(dio);

  final FlutterSecureStorage storage = const FlutterSecureStorage();

  final String _baseUrl = "http://10.0.2.2:3000";
  // final String _userId = "6214c15f9ccae1c60c0eca14";
  final Map<String, String> _headers = <String, String>{
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  @override
  Future<User> getUser(String userId) async {
    final response = await dio.get('$_baseUrl/users/$userId');
    return User.fromJson(response.data);
  }

  @override
  Future<dynamic> getCart(String userId) async {
    final response = await dio.get('$_baseUrl/cart/$userId');
    return response.data;
  }

  @override
  Future<void> addToCart(String foodId, String id) async {
    await dio.post('$_baseUrl/cart', data: {'foodId': foodId, 'userID': id});
  }

  @override
  Future<void> decrementCartItem(String foodId, String userID) async {
    await dio.post('$_baseUrl/decrement-cartItem',
        data: {'foodId': foodId, 'userID': userID});
  }

  @override
  Future<void> removeCartItem(String foodId, String userID) async {
    await dio.post('$_baseUrl/remove-cartItem',
        data: {'foodId': foodId, 'userID': userID});
  }

  @override
  Future<void> clearCart(String userID) async {
    await dio.post('$_baseUrl/clear-cart', data: {'userID': userID});
  }

  @override
  Future<User?> registerUser(String name, String email, String password) async {
    final response = await dio.post('$_baseUrl/users',
        data: {'name': name, 'email': email, 'password': password});

    if (response.statusCode == 201) {
      await storage.write(key: 'token', value: response.data['token']);
      return User.fromJson(response.data);
    }
    return null;
  }

  @override
  Future<User?> loginUser(String email, String password) async {
    final response = await dio.post('$_baseUrl/login',
        data: {'email': email, 'password': password},
        options: Options(headers: _headers));

    if (response.statusCode == 200) {
      await storage.write(key: 'token', value: response.data['token']);
      return User.fromJson(response.data);
    }
    return null;
  }

  @override
  Future<User?> verifyToken() async {
    final _token = await storage.read(key: 'token');
    final response = await dio.post('$_baseUrl/verifyToken',
        data: {'token': _token}, options: Options(headers: _headers));
    if (response.statusCode == 200) {
      return User.fromJson(response.data);
    }
    return null;
  }

  @override
  Future<void> logOut() async {
    await storage.delete(key: 'token');
  }
}
