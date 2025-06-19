

import '../../domain/entity/order_entity.dart';

class OrderModel {
  final String? id;
  final bool? payCash;
  final num? price;
  final num? delivery;
  final String? userID;
  final String? name;
  final String? email;
  final String? phone;
  final String? address;
  final String? city;
  final String? flatNumber;

  OrderModel({
    this.id,
    this.payCash,
    this.price,
    this.delivery = 40,
    this.userID,
    this.name,
    this.email,
    this.phone,
    this.address,
    this.city,
    this.flatNumber,
  });

  factory OrderModel.fromEntity(OrderEntity orderEntity) {
    return OrderModel(
      id: orderEntity.id,
      payCash: orderEntity.payCash,
      price: orderEntity.price,
      delivery: orderEntity.delivery,
      userID: orderEntity.userID,
      name: orderEntity.name,
      email: orderEntity.email,
      phone: orderEntity.phone,
      address: orderEntity.address,
      city: orderEntity.city,
      flatNumber: orderEntity.flatNumber,
    );
  }

  OrderEntity toEntity() {
    return OrderEntity(
      id: id,
      payCash: payCash,
      price: price,
      delivery: delivery,
      userID: userID,
      name: name,
      email: email,
      phone: phone,
      address: address,
      city: city,
      flatNumber: flatNumber,
    );
  }

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      payCash: json['payCash'],
      price: json['price'],
      delivery: json['delivery'],
      userID: json['userID'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      address: json['address'],
      city: json['city'],
      flatNumber: json['flatNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'payCash': payCash,
      'price': price,
      'delivery': delivery,
      'userID': userID,
      'name': name,
      'email': email,
      'phone': phone,
      'address': address,
      'city': city,
      'flatNumber': flatNumber,
    };
  }
}
