import 'package:hive/hive.dart';

part 'card_model.g.dart';
 // For code generation

@HiveType(typeId: 1)
class CardModel extends HiveObject {
  @HiveField(0)
 final String cardHolderName;

  @HiveField(1)
  final String cardNumber;

  @HiveField(2)
  final String expiryDate;

  @HiveField(3)
  final String cvv;

  @HiveField(4)
  bool isDefault;


  @HiveField(5)
  String image;

  CardModel({
    required this.cardHolderName,
    required this.cardNumber,
    required this.expiryDate,
    required this.cvv,
    this.isDefault = false,
    this.image=''
  });
}
