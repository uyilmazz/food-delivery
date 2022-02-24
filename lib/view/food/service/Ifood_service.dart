import 'package:dio/dio.dart';

import '../model/category.dart';
import '../model/food.dart';

abstract class IFoodService {
  final Dio dio;
  IFoodService(this.dio);

  Future<dynamic> getFoodItems();
  Future<Food> getFood(String id);
  Future<dynamic> getCategories();
  Future<dynamic> getFoodsByCategory(String categoryId);
}
