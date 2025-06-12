import 'package:bloc/bloc.dart';
import 'package:fruits_hub/features/home_view/domain/entities/review_entity.dart';
import 'package:meta/meta.dart';

import '../../../../data/models/review-model.dart';
import '../../../../domain/repos/reviews_repo.dart';

part 'update_reviews_state.dart';

class UpdateReviewsCubit extends Cubit<UpdateReviewsState> {
  UpdateReviewsCubit({required this.reviewsRepo}) : super(UpdateReviewsInitial());
  final ReviewsRepo reviewsRepo;
  List<ReviewEntity> reviews = [];

  Future<void> updateReviews() async {
    emit(UpdateReviewsLoading());

    var result= await reviewsRepo.updateReviews();
    result.fold(
            (faliure){
          emit(UpdateReviewsFailure(errorMessage: faliure.errorMessage.toString()));
        },
            (reviewsEntities){
              reviews=reviewsEntities;
          print(reviewsEntities.length);
          emit(UpdateReviewsSuccess(reviews:reviewsEntities));

        }
    );
  }

  Future<void> deleteReviews({required ReviewEntity reviewEntity}) async {
    emit(UpdateReviewsLoading());

    var result= await reviewsRepo.deleteReviews(reviewEntity: reviewEntity);
    result.fold(
            (faliure){
          emit(UpdateReviewsFailure(errorMessage: faliure.errorMessage.toString()));
        },
            (r){
          emit(UpdateReviewsSuccess(reviews:reviews));

        }
    );
  }
}
