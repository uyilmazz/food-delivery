import 'package:dio/dio.dart';
import '../model/user.dart';

abstract class IUserService {
  final Dio dio;
  IUserService(this.dio);

  Future<User> getUser(String userId);
  Future<dynamic> getCart(String userId);
  Future<void> addToCart(String foodId, String id);
  Future<void> decrementCartItem(String foodId, String userID);
  Future<void> removeCartItem(String foodId, String userID);
  Future<User?> registerUser(String name, String email, String password);
  Future<User?> loginUser(String email, String password);
  Future<User?> verifyToken();
  Future<void> logOut();
  Future<void> clearCart(String userID);
}
