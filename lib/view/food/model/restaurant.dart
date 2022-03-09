import 'package:json_annotation/json_annotation.dart';

part 'restaurant.g.dart';

@JsonSerializable()
class Restaurant {
  @JsonKey(name: '_id')
  String? id;
  String? name;
  String? address;
  String? telNo;
  String? delivery;
  int? rating;

  Restaurant(
      {this.id,
      this.name,
      this.address,
      this.telNo,
      this.delivery,
      this.rating});

  factory Restaurant.fromJson(Map<String, dynamic> json) =>
      _$RestaurantFromJson(json);

  Map<String, dynamic> toJson() {
    return _$RestaurantToJson(this);
  }
}
