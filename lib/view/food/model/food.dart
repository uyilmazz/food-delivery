import 'package:json_annotation/json_annotation.dart';

part 'food.g.dart';

@JsonSerializable()
class Food {
  String? id;
  String? name;
  double? price;
  String? description;
  List<String>? size;
  double? cookingTime;
  List<String>? categories;

  Food(
      {this.id,
      this.name,
      this.price,
      this.description,
      this.size,
      this.cookingTime,
      this.categories});

  factory Food.fromJson(Map<String, dynamic> json) => _$FoodFromJson(json);

  Map<String, dynamic> toJson() => _$FoodToJson(this);
}



// class Food {
//   String? id;
//   String? name;
//   double? price;
//   String? description;
//   List<String>? size;
//   double? cookingTime;
//   List<String>? categories;

//   Food(
//       {this.id,
//       this.name,
//       this.price,
//       this.description,
//       this.size,
//       this.cookingTime,
//       this.categories});

//   factory Food.fromJson(Map<String, dynamic> json) => _$FoodFromJson(json);

//   Map<String, dynamic> toJson() => _$FoodToJson(this);
// }
