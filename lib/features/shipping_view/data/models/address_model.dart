import '../../domain/entity/address_entity.dart';

class AddressModel {
  final String name;
  final String email;
  final String phone;
  final String address;
  final String city;
  final String flatNumber;

  AddressModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.city,
    required this.flatNumber,
  });

  // تحويل من Entity إلى Model
  factory AddressModel.fromEntity(AddressEntity entity) {
    return AddressModel(
      name: entity.name,
      email: entity.email,
      phone: entity.phone,
      address: entity.address,
      city: entity.city,
      flatNumber: entity.flatNumber,
    );
  }

  // تحويل من Model إلى Entity
  AddressEntity toEntity() {
    return AddressEntity(
      name: name,
      email: email,
      phone: phone,
      address: address,
      city: city,
      flatNumber: flatNumber,
    );
  }

  // تحويل من JSON إلى Model
  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      name: json['name'] ,
      email: json['email'] ,
      phone: json['phone'] ,
      address: json['address'] ,
      city: json['city'] ,
      flatNumber: json['flatNumber'] ,
    );
  }

  // تحويل من Model إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'address': address,
      'city': city,
      'flatNumber': flatNumber,
    };
  }
}
