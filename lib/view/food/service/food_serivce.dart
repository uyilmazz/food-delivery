import 'package:dio/src/dio.dart';

import '../model/category.dart';
import '../model/food.dart';
import '../model/restaurant.dart';
import 'Ifood_service.dart';

class FoodService extends IFoodService {
  FoodService(Dio dio) : super(dio);
  final String baseUrl = "http://10.0.2.2:3000";

  @override
  Future<dynamic> getFoodItems() async {
    final response = await dio.get('$baseUrl/foods');
    return response.data.map((data) => Food.fromJson(data)).toList();
  }

  @override
  Future<Food> getFood(String id) async {
    final response = await dio.get('$baseUrl/foods/$id');
    return Food.fromJson(response.data);
  }

  @override
  Future<dynamic> getCategories() async {
    final response = await dio.get('http://10.0.2.2:3000/categories');
    return await response.data.map((data) => Category.fromJson(data)).toList();
  }

  @override
  Future<dynamic> getFoodsByCategory(String categoryId) async {
    final response = await dio.get('$baseUrl/categories/$categoryId');
    return await response.data.map((data) => Food.fromJson(data)).toList();
  }

  @override
  Future<dynamic> getRestaurants() async {
    final response = await dio.get('$baseUrl/restaurants');
    return await response.data
        .map((data) => Restaurant.fromJson(data))
        .toList();
  }
}
