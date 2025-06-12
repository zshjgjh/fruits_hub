import 'dart:io';

import 'package:fruits_hub/features/home_view/domain/entities/review_entity.dart';



class ProductEntity{
  final String id;
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
    required this.id,
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

double calculateReviewsValue({required List<ReviewEntity> reviews, required int value,required ProductEntity productEntity}) {
  double reviewsValue = 0;
  for (var review in reviews) {
    if (review.rating.round() == value) {
      reviewsValue = reviewsValue + 1;
    }
  }
  return productEntity.ratingCount==0?1: reviewsValue/productEntity.ratingCount;
}

