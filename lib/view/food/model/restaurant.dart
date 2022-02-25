import 'package:json_annotation/json_annotation.dart';

part 'restaurant.g.dart';

@JsonSerializable()
class Restaurant {
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

  Restaurant.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    address = json['address'];
    telNo = json['telNo'];
    delivery = json['delivery'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['name'] = name;
    data['address'] = address;
    data['telNo'] = telNo;
    data['delivery'] = delivery;
    data['rating'] = rating;
    return data;
  }
}
