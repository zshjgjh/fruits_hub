class OrderEntity {
  final String? id;
  final bool? payCash;
  final num? price;
  final num? delivery;
  final String? userID;
  final String? name;
  final String? email;
  final String? phone;
  final int? amount;
  String? address;
  final String? city;
  final String? flatNumber;
  final String? date;
  final String? followOrder;
  final String? acceptOrder;
  final String? shippingOrder;
  final String? deliveryOrder;
  final String? delivered;

  OrderEntity({
    this.price,
    this.delivery = 40,
    this.payCash,
    this.userID,
    this.id,
    this.name,
    this.email,
    this.phone,
    this.address,
    this.city,
    this.flatNumber,
    this.date,
    this.amount,
    this.followOrder='',
    this.acceptOrder ='',
    this.shippingOrder='',
    this.deliveryOrder='' ,
    this.delivered='',
  });
}
