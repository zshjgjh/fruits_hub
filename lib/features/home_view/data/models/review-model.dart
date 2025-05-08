

import '../../domain/entities/review_entity.dart';

class ReviewModel{
  final String name;
  final String image;
  final num avgRating;
  final String description;
  final String date;

  ReviewModel({
    required this.name,
    required this.image,
    required this.avgRating,
    required this.description,
    required this.date
  });

  factory ReviewModel.fromEntity(ReviewEntity reviewEntity){
    return ReviewModel(
        name: reviewEntity.name,
        image: reviewEntity.image,
        avgRating: reviewEntity.avgRating,
        description: reviewEntity.description,
        date: reviewEntity.date
    );}

  factory ReviewModel.fromJson(Map<String,dynamic> json){
    return ReviewModel(
        name: json['name'],
        image: json['image'],
        avgRating: json['ratting'],
        date: json['date'],
        description: json['reviewDescription']);
  }

  ReviewEntity toEntity(){
    return ReviewEntity(
        name: name,
        image: image,
        avgRating: avgRating,
        date: date,
        description: description
    );
  }
   toJason(){
    return{
      'name':name,
      'image':image,
      'ratting':avgRating,
      'reviewDescription':description,
      'date':date
    };
   }
}