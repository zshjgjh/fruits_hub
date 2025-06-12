

import '../../domain/entities/review_entity.dart';

class ReviewModel{
   String? id;
   final String userID;
  final String productID;
  final String name;
  final String image;
  final num rating;
  final String description;
  final String date;

  ReviewModel({
     this.id,
    required this.userID,
    required this.productID,
    required this.name,
    required this.image,
    required this.rating,
    required this.description,
    required this.date
  });

  factory ReviewModel.fromEntity(ReviewEntity reviewEntity){
    return ReviewModel(
        productID: reviewEntity.productID,
        name: reviewEntity.name,
        image: reviewEntity.image,
        rating: reviewEntity.rating,
        description: reviewEntity.description,
        date: reviewEntity.date,
      userID: reviewEntity.userID,

    );}

  factory ReviewModel.fromJson(Map<String,dynamic> json){
    return ReviewModel(
      id: json['id'],
       productID:json['productID'] ,
        name: json['name'],
        image: json['image'],
        rating: json['rating'],
        date: json['date'],
        description: json['description'],
      userID: json['userID'], );
  }

  ReviewEntity toEntity(){
    return ReviewEntity(
      userID: userID,
      id: id,
      productID: productID,
        name: name,
        image: image,
        rating: rating,
        date: date,
        description: description,

    );
  }
   toJason(){
    return{
      'userID':userID,
      'productID':productID,
      'name':name,
      'image':image,
      'rating':rating,
      'description':description,
      'date':date
    };
   }
}