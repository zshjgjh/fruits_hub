import 'dart:io';


class ProductEntity{
  final String name;
  final String code;
  final String description;
  final bool isFeatured;
  final bool isOrganig;
  final int expMonthes;
  final int numOfCalories;
  final int unitAmount;
  final int ratingCount;
  final num avgRating;
  final int sellingCount;
  final num price;
  File? imageFile;
 // final List<ReviewEntity> reviews;
  String? imageUrl;

  ProductEntity({
    required this.name,
    required this.code,
    required this.description,
    required this.isFeatured,
    required this.isOrganig,
    required this.expMonthes,
    required this.numOfCalories,
    required this.unitAmount,
    required this.ratingCount,
    required this.avgRating,
    required this.sellingCount,
    required this.price,
    this.imageFile,
   // required this.reviews,
    this.imageUrl,
  });

}