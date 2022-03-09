// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      cart: json['cart'] == null
          ? null
          : Cart.fromJson(json['cart'] as Map<String, dynamic>),
      id: json['_id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      password: json['password'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      iV: json['iV'] as int?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'cart': instance.cart,
      '_id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'password': instance.password,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'iV': instance.iV,
    };

Cart _$CartFromJson(Map<String, dynamic> json) => Cart(
      cartItems: (json['cartItems'] as List<dynamic>?)
          ?.map((e) => CartItems.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CartToJson(Cart instance) => <String, dynamic>{
      'cartItems': instance.cartItems,
    };

CartItems _$CartItemsFromJson(Map<String, dynamic> json) => CartItems(
      foodId: json['foodId'] as String?,
      quantity: json['quantity'] as int?,
      cartItemsId: json['cartItemsId'] as String?,
    );

Map<String, dynamic> _$CartItemsToJson(CartItems instance) => <String, dynamic>{
      'foodId': instance.foodId,
      'quantity': instance.quantity,
      'cartItemsId': instance.cartItemsId,
    };
