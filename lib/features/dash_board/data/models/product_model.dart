import 'dart:io';
import 'dart:math';

import '../../domain/entities/product_entity.dart';

class ProductModel{
  final String name;
  final String code;
  final String description;
  final bool isFeatured;
  final bool isOrganig;
  final int expMonthes;
  final int numOfCalories;
  final int unitAmount;
  final int ratingCount;
  final int sellingCount;
  final num avgRating;
  final num price;
  //final List<ReviewModel> reviews;
  String? imageUrl;

  ProductModel({
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
    required this.sellingCount,// no need to be in product entity
    required this.price,
  //  required this.reviews,
    this.imageUrl,
  });
 factory ProductModel.fromEntity(ProductEntity productEntity){
   return ProductModel(
       name: productEntity.name,
       code: productEntity.code,
       description: productEntity.description,
       isFeatured: productEntity.isFeatured,
       isOrganig: productEntity.isOrganig,
       expMonthes: productEntity.expMonthes,
       numOfCalories: productEntity.numOfCalories,
       unitAmount: productEntity.numOfCalories,
       ratingCount: productEntity.ratingCount,
       avgRating: productEntity.avgRating,
       sellingCount: productEntity.sellingCount,
       price: productEntity.price,
     //  reviews: productEntity.reviews.map((e) => ReviewModel.fromEntity(e)).toList()//convert every review entity to model then to list
   );
 }///convert product entity to model

  factory ProductModel.fromJson(Map<String,dynamic> json){
    return ProductModel(
      name: json['name'],
      price: json['price'],
      description: json['description'],
      code: json['code'],
      isFeatured: json['isFeatured'],
      isOrganig: json['isOrganig'],
      expMonthes: json['expMonthes'],
      numOfCalories: json['numOfCalories'],
      unitAmount: json['unitAmount'],
      avgRating: json['avgRating'],
      ratingCount: json['ratingCount'],
      sellingCount: json['sellingCount'],
      imageUrl: json['image'],
     // reviews: json['reviews'] != null ?
    //  List<ReviewModel>.from(
    //      json['reviews'].map((e) => ReviewModel.fromJson(json)))
      //    : [],
            );
  }
  ProductEntity toEntity(){
    return ProductEntity(
        name: name,
        price: price,
        description: description,
        code: code,
        isFeatured: isFeatured,
        imageUrl: imageUrl,
        isOrganig: isOrganig,
        expMonthes: expMonthes,
        numOfCalories: numOfCalories,
        unitAmount: unitAmount,
        ratingCount: ratingCount,
        avgRating: avgRating,
        sellingCount: sellingCount,
     //   reviews: reviews.map((e) => e.toEntity()).toList()
    );
  }
 toJason(){// same as to map
   return {
     'name': name,
     'price': price,
     'description': description,
     'code':code,
     'isFeatured':isFeatured,
     'isOrganig': isOrganig,
     'expMonthes':expMonthes,
     'numOfCalories':numOfCalories,
     'unitAmount':unitAmount,
     'avgRating':avgRating,
     'ratingCount':ratingCount,
     'sellingCount':sellingCount,
     'imageUrl':imageUrl,
    // 'reviews':reviews.map((e) => e.toJason()).toList()// convert every review model to json than to list

   }; //to save data in fire storage as json
 }
}