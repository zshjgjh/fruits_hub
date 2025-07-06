

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
  final String? date;
  final int? amount;
  final String? followOrder;
  final String? acceptOrder;
  final String? shippingOrder;
  final String? deliveryOrder;
  final String? delivered;

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
    this.date,
    this.amount,
    this.followOrder,
    this.acceptOrder ,
    this.shippingOrder,
    this.deliveryOrder,
    this.delivered ,
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
      date: orderEntity.date,
      amount: orderEntity.amount,
      flatNumber: orderEntity.flatNumber,
      followOrder:orderEntity.followOrder,
      acceptOrder:orderEntity.acceptOrder,
      shippingOrder:orderEntity.shippingOrder,
      deliveryOrder:orderEntity.deliveryOrder,
      delivered:orderEntity.delivered,
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
      date:date,
      amount: amount,
      followOrder:followOrder,
      acceptOrder:acceptOrder,
      shippingOrder:shippingOrder,
      deliveryOrder:deliveryOrder,
      delivered:delivered,
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
      date: json['date'],
      amount: json['amount'],
      followOrder: json['followOrder'],
      acceptOrder: json['acceptOrder'] ,
      shippingOrder: json['shippingOrder'] ,
      deliveryOrder: json['deliveryOrder'] ,
      delivered: json['delivered'],
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
      'amount':amount,
      'flatNumber': flatNumber,
      'date': date,


    };
  }
}
