class ReviewEntity{
  final String productID;
  final String name;
  final String image;
  final num avgRating;
  final String description;
  final String date;

  ReviewEntity({
    required this.productID,
    required this.name,
    required this.image,
    required this.avgRating,
    required this.description,
    required this.date
  });
}