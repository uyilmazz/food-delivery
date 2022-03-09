import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  Cart? cart;
  @JsonKey(name: '_id')
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

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() {
    return _$UserToJson(this);
  }
}

@JsonSerializable()
class Cart {
  List<CartItems>? cartItems;

  Cart({this.cartItems});

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);

  Map<String, dynamic> toJson() {
    return _$CartToJson(this);
  }
}

@JsonSerializable()
class CartItems {
  String? foodId;
  int? quantity;
  String? cartItemsId;

  CartItems({this.foodId, this.quantity, this.cartItemsId});

  factory CartItems.fromJson(Map<String, dynamic> json) =>
      _$CartItemsFromJson(json);

  Map<String, dynamic> toJson() {
    return _$CartItemsToJson(this);
  }
}
