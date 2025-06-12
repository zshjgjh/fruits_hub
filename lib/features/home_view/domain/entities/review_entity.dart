class ReviewEntity{
   String? id;
   final String userID;
  final String productID;
  final String name;
  final String image;
  final num rating;
  final String description;
  final String date;

  ReviewEntity({
     this.id,
    required this.userID,
    required this.productID,
    required this.name,
    required this.image,
    required this.rating,
    required this.description,
    required this.date
  });


}
