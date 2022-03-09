// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Restaurant _$RestaurantFromJson(Map<String, dynamic> json) => Restaurant(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      address: json['address'] as String?,
      telNo: json['telNo'] as String?,
      delivery: json['delivery'] as String?,
      rating: json['rating'] as int?,
    );

Map<String, dynamic> _$RestaurantToJson(Restaurant instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'telNo': instance.telNo,
      'delivery': instance.delivery,
      'rating': instance.rating,
    };
