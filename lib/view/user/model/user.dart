import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  Cart? cart;
  String? id;
  String? name;
  String? email;
  String? phoneNumber;
  String? password;
  String? createdAt;
  String? updatedAt;
  int? iV;

  User(
      {this.cart,
      this.id,
      this.name,
      this.email,
      this.phoneNumber,
      this.password,
      this.createdAt,
      this.updatedAt,
      this.iV});

  User.fromJson(Map<String, dynamic> json) {
    cart = json['cart'] != null ? Cart.fromJson(json['cart']) : null;
    id = json['_id'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    password = json['password'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (cart != null) {
      data['cart'] = cart!.toJson();
    }
    data['_id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phoneNumber'] = phoneNumber;
    data['password'] = password;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}

class Cart {
  List<CartItems>? cartItems;

  Cart({this.cartItems});

  Cart.fromJson(Map<String, dynamic> json) {
    if (json['cartItems'] != null) {
      cartItems = <CartItems>[];
      json['cartItems'].forEach((v) {
        cartItems!.add(CartItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (cartItems != null) {
      data['cartItems'] = cartItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CartItems {
  String? foodId;
  int? quantity;
  String? cartItemsId;

  CartItems({this.foodId, this.quantity, this.cartItemsId});

  CartItems.fromJson(Map<String, dynamic> json) {
    foodId = json['foodId'];
    quantity = json['quantity'];
    cartItemsId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['foodId'] = foodId;
    data['quantity'] = quantity;
    data['_id'] = cartItemsId;
    return data;
  }
}
