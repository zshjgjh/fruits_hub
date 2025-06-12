import 'package:dartz/dartz.dart';

import '../../../../core/errors/server_failure.dart';
import '../../data/models/review-model.dart';
import '../entities/product_entity.dart';
import '../entities/review_entity.dart';

abstract class ReviewsRepo{
Future<Either<Failure,void>> setReview({required ReviewEntity reviewEntity});
Future<Either<Failure,List<ReviewEntity>>> updateReviews();
Future<Either<Failure,void>> deleteReviews({required ReviewEntity reviewEntity});
}