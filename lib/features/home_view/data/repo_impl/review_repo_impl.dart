import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/errors/server_failure.dart';
import 'package:fruits_hub/core/utilis/constants.dart';
import 'package:fruits_hub/core/utilis/services/supabase/subabase_data_base_service.dart';
import 'package:fruits_hub/features/home_view/domain/entities/review_entity.dart';
import 'package:fruits_hub/features/home_view/domain/repos/reviews_repo.dart';

import '../../domain/entities/product_entity.dart';
import '../models/review-model.dart';

class ReviewsRepoImpl extends ReviewsRepo{
  final SupaBaseDataBaseService supaBaseDataBaseService;

  ReviewsRepoImpl({required this.supaBaseDataBaseService});
  @override
  Future<Either<Failure, List<ReviewEntity>>> getReviews() async {
    try {
      var data=await supaBaseDataBaseService.getData(path: kReviews);
      List<ReviewModel> reviews=data.map((e) => ReviewModel.fromJson(e)).toList();
      List<ReviewEntity> reviewsEntities=reviews.map((e) => e.toEntity()).toList();
      return right(reviewsEntities);

    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> setReview({required ReviewEntity reviewEntity}) async {
   try {
    await supaBaseDataBaseService.addData(path: kReviews, data: ReviewModel.fromEntity(reviewEntity).toJason() );
    return right(null);
   } catch (e) {
     return left(ServerFailure(e.toString()));
   }
  }

}