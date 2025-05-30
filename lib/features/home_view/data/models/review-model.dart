

import '../../domain/entities/review_entity.dart';

class ReviewModel{
  final String productID;
  final String name;
  final String image;
  final num avgRating;
  final String description;
  final String date;

  ReviewModel({
    required this.productID,
    required this.name,
    required this.image,
    required this.avgRating,
    required this.description,
    required this.date
  });

  factory ReviewModel.fromEntity(ReviewEntity reviewEntity){
    return ReviewModel(
        productID: reviewEntity.productID,
        name: reviewEntity.name,
        image: reviewEntity.image,
        avgRating: reviewEntity.avgRating,
        description: reviewEntity.description,
        date: reviewEntity.date
    );}

  factory ReviewModel.fromJson(Map<String,dynamic> json){
    return ReviewModel(
       productID:json['productID'] ,
        name: json['name'],
        image: json['image'],
        avgRating: json['avgRating'],
        date: json['date'],
        description: json['description']);
  }

  ReviewEntity toEntity(){
    return ReviewEntity(
      productID: productID,
        name: name,
        image: image,
        avgRating: avgRating,
        date: date,
        description: description
    );
  }
   toJason(){
    return{
      'productID':productID,
      'name':name,
      'image':image,
      'avgRating':avgRating,
      'description':description,
      'date':date
    };
   }
}