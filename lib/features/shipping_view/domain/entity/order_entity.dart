class OrderEntity {
  final String? id;
  final bool? payCash;
  final num? price;
  final num? delivery;
  final String? userID;
  final String? name;
  final String? email;
  final String? phone;
   String? address;
  final String? city;
  final String? flatNumber;

  OrderEntity(
      {this.price,
      this.delivery=40,
      this.payCash,
      this.userID,
      this.id,
      this.name,
      this.email,
      this.phone,
      this.address,
      this.city,
      this.flatNumber});


}
